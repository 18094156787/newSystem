//
//  JCHomeErCodeView.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/8/16.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCHomeErCodeView.h"

@implementation JCHomeErCodeView

- (void)initViews {
    self.backgroundColor = [JCBlackColor colorWithAlphaComponent:0.5];
    [self addSubview:self.imgView];
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(kNavigationBarHeight+AUTO(80));
        make.centerX.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(AUTO(280), AUTO(280)));
    }];
    
    [self addSubview:self.closeBtn];
    [self.closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.equalTo(self.imgView);
        make.width.height.mas_equalTo(AUTO(40));
    }];

    [self addSubview:self.sureBtn];
    [self.sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.imgView.mas_bottom).offset(AUTO(30));
        make.size.mas_equalTo(CGSizeMake(AUTO(224), AUTO(44)));
    }];
    

    WeakSelf;

    
    [self.imgView bk_whenTapped:^{
        if (weakSelf.JCClickBlock) {
            if (weakSelf.model.url.length>0) {
                [weakSelf removeFromSuperview];
            }
//            [weakSelf removeFromSuperview];
            weakSelf.JCClickBlock();
        }
    }];
    
    
    [self.closeBtn bk_whenTapped:^{
        [weakSelf removeFromSuperview];
        if (weakSelf.JCCloseBlock) {
            weakSelf.JCCloseBlock();
        }
    }];
}

- (void)setModel:(JCImageModel *)model {
    _model = model;
    WeakSelf;
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:model.img] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        weakSelf.codeImg = image;
    }];
}

- (void)saveImg {
    if (self.codeImg) {
                UIImageWriteToSavedPhotosAlbum(self.codeImg, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
            }
}
-(void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
//    NSString *msg = nil ;
    if(error){
//        msg = @"保存图片失败" ;
        [JCWToastTool showHint:@"保存失败"];
    }else{
//        msg = @"保存图片成功" ;
        [JCWToastTool showHint:@"保存成功"];
    }
}

//- (void)data {
//    self.imgView.backgroundColor = JCBaseColor;
//}

- (UIImageView *)imgView {
    if (!_imgView) {
        _imgView = [UIImageView new];
        _imgView.userInteractionEnabled = YES;
        _imgView.contentMode = UIViewContentModeScaleAspectFit;
        [_imgView hg_setAllCornerWithCornerRadius:20];
    }
    return _imgView;
}

- (UIButton *)closeBtn {
    if (!_closeBtn) {
        _closeBtn = [UIButton new];
        [_closeBtn setImage:JCIMAGE(@"mine_close_white") forState:0];
        [_closeBtn setImage:JCIMAGE(@"mine_close_white") forState:UIControlStateHighlighted];
    }
    return _closeBtn;
}

- (UIButton *)sureBtn {
    if (!_sureBtn) {
        _sureBtn = [UIButton initWithText:@"点击保存公众号二维码" FontSize:AUTO(16) Weight:1 BackGroundColor:JCBaseColor TextColors:JCWhiteColor];
        [_sureBtn hg_setAllCornerWithCornerRadius:AUTO(22)];
        [_sureBtn addTarget:self action:@selector(saveImg) forControlEvents:UIControlEventTouchUpInside];
//        _sureBtn.userInteractionEnabled = YES;
    }
    return _sureBtn;
}



@end
