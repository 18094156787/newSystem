//
//  JCPostCheckUserIDCardCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/8/23.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCPostCheckUserIDCardCell.h"

@implementation JCPostCheckUserIDCardCell

- (void)initViews {
    [self.contentView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.offset(AUTO(15));
        make.height.mas_equalTo(AUTO(20));
    }];
    
    [self.contentView addSubview:self.errorInfoView];
    [self.errorInfoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLab.mas_right).offset(2);
        make.centerY.equalTo(self.titleLab);
        make.height.mas_equalTo(AUTO(25));
    }];
    
    [self.errorInfoView addSubview:self.errorIconImgView];
    [self.errorIconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLab.mas_right).offset(2);
        make.centerY.equalTo(self.errorInfoView);
        make.size.mas_equalTo(CGSizeMake(AUTO(12), AUTO(12)));
    }];
    

    
    
    [self.errorInfoView addSubview:self.errorInfoLab];
    [self.errorInfoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.errorIconImgView.mas_right).offset(2);
        make.centerY.equalTo(self.errorInfoView);
    }];
    
    [self.contentView addSubview:self.photoImgView];
    [self.photoImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(5));
        make.right.mas_equalTo(AUTO(-5));
        make.top.equalTo(self.titleLab.mas_bottom).offset(AUTO(15));
        make.height.mas_equalTo(AUTO(190));
    }];
    
    [self.photoImgView addSubview:self.deleteBtn];
    [self.deleteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.equalTo(self.photoImgView);
        make.width.height.mas_equalTo(AUTO(28));
    }];
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"手持身份证照片" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _titleLab;
}

- (UIView *)errorInfoView {
    if (!_errorInfoView) {
        _errorInfoView = [UIView new];
    }
    return _errorInfoView;
}

- (UIImageView *)photoImgView {
    if (!_photoImgView) {
        _photoImgView = [UIImageView new];
        _photoImgView.image = JCIMAGE(@"post_img_scsfz");
        _photoImgView.contentMode = UIViewContentModeScaleAspectFit;
        _photoImgView.userInteractionEnabled = YES;
    }
    return _photoImgView;
}

- (UILabel *)errorInfoLab {
    if (!_errorInfoLab) {
        _errorInfoLab = [UILabel initWithTitle:@"请上传照片" andFont:AUTO(12) andWeight:1 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:0];
        
    }
    return _errorInfoLab;
}
- (UIImageView *)errorIconImgView {
    if (!_errorIconImgView) {
        _errorIconImgView = [UIImageView new];
        _errorIconImgView.image = JCIMAGE(@"me_message_ic_tips");
    }
    return _errorIconImgView;
}

- (UIButton *)deleteBtn {
    if (!_deleteBtn) {
        _deleteBtn = [UIButton new];
        [_deleteBtn setBackgroundImage:JCIMAGE(@"post_ic_del") forState:0];
        _deleteBtn.hidden = YES;
    }
    return _deleteBtn;
}

@end
