//
//  JCFootBall_GZH_AuthorErCodeView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/10/27.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCFootBall_GZH_AuthorErCodeView.h"

@implementation JCFootBall_GZH_AuthorErCodeView

- (void)initViews {
    self.backgroundColor = [JCBlackColor colorWithAlphaComponent:0.5];
    UIView *bgView = [UIView new];
    bgView.backgroundColor = JCWhiteColor;
    [bgView hg_setAllCornerWithCornerRadius:AUTO(20)];
    [self addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(30));
        make.right.offset(AUTO(-30));
        make.top.offset(kNavigationBarHeight+AUTO(50));
        make.height.mas_equalTo(AUTO(410));
    }];
    
    [bgView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(bgView);
        make.top.offset(AUTO(20));
        make.centerX.equalTo(bgView);
        make.height.mas_equalTo(AUTO(20));
    }];
    
    [bgView addSubview:self.closeBtn];
    [self.closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(0);
        make.centerY.equalTo(self.titleLab);
        make.width.height.mas_equalTo(AUTO(50));
    }];
    
    UIView *lineView = [UIView new];
    lineView.backgroundColor = COLOR_F4F4F8;
    [bgView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.height.mas_equalTo(1);
        make.top.equalTo(self.titleLab.mas_bottom).offset(AUTO(20));
    }];
    
    [bgView addSubview:self.codeImgView];
    [self.codeImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView.mas_bottom).offset(AUTO(30));
        make.centerX.equalTo(bgView);
        make.width.height.mas_equalTo(AUTO(180));
    }];
    
    [bgView addSubview:self.saveBtn];
    [self.saveBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.codeImgView.mas_bottom).offset(AUTO(20));
        make.centerX.equalTo(bgView);
        make.size.mas_equalTo(CGSizeMake(AUTO(102), AUTO(30)));
    }];
    
    [bgView addSubview:self.infoLab];
    [self.infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.saveBtn.mas_bottom).offset(AUTO(20));
        make.centerX.equalTo(bgView);
        make.left.offset(10);
        make.right.offset(-10);
    }];
    
    
    WeakSelf;
    [self.closeBtn bk_whenTapped:^{
        [weakSelf removeFromSuperview];
    }];
    
    [self.saveBtn bk_whenTapped:^{
        if (weakSelf.codeImg) {
            UIImageWriteToSavedPhotosAlbum(weakSelf.codeImg, weakSelf, @selector(image:didFinishSavingWithError:contextInfo:), nil);
        }
    }];

}

- (void)setExpertDetailModel:(JCWExpertBall *)expertDetailModel {
    
    _expertDetailModel = expertDetailModel;
    self.titleLab.text = [NSString stringWithFormat:@"关注%@",expertDetailModel.user_name];
    [self.codeImgView sd_setImageWithURL:[NSURL URLWithString:expertDetailModel.qr_code] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        self.codeImg = image;
    }];
    self.infoLab.text = [NSString stringWithFormat:@"扫描二维码或者搜索[%@]\n每天都有免费方案推荐",expertDetailModel.user_name];
}

- (void)setInfoModel:(JCWTjInfoBall *)infoModel {
    _infoModel = infoModel;
    self.titleLab.text = [NSString stringWithFormat:@"关注%@",infoModel.user_name];
    [self.codeImgView sd_setImageWithURL:[NSURL URLWithString:infoModel.qr_code] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        self.codeImg = image;
    }];
    self.infoLab.text = [NSString stringWithFormat:@"扫描二维码或者搜索[%@]\n每天都有免费方案推荐",infoModel.user_name];
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

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(16) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _titleLab;
}

- (UIButton *)closeBtn {
    if (!_closeBtn) {
        _closeBtn = [UIButton new];
        [_closeBtn setImage:JCIMAGE(@"cancel_code") forState:0];
        [_closeBtn setImage:JCIMAGE(@"cancel_code") forState:UIControlStateHighlighted];
    }
    return _closeBtn;
}

- (UIImageView *)codeImgView {
    if (!_codeImgView) {
        _codeImgView = [UIImageView new];
    }
    return _codeImgView;
}

- (UIButton *)saveBtn {
    if (!_saveBtn) {
        _saveBtn = [UIButton initWithText:@"保存到相册" FontSize:AUTO(14) Weight:2 BackGroundColor:JCBaseColor TextColors:JCWhiteColor];
        [_saveBtn hg_setAllCornerWithCornerRadius:AUTO(15)];
        
    }
    return _saveBtn;
}


- (UILabel *)infoLab {
    if (!_infoLab) {
        _infoLab = [UILabel initWithTitle:@"" andFont:AUTO(16) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _infoLab.numberOfLines = 0;
    }
    return _infoLab;
}

@end
