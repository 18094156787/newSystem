//
//  JCApplyBindBankCardCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/11/16.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCApplyBindBankCardCell.h"

@implementation JCApplyBindBankCardCell

- (void)initViews {
    [self.contentView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.centerY.equalTo(self.contentView);
        make.width.mas_equalTo(AUTO(70));
    }];
    [self.contentView addSubview:self.contentTF];
    [self.contentTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLab.mas_right).offset(AUTO(10));
        make.centerY.equalTo(self.contentView);
        make.right.offset(AUTO(-10));
        make.height.mas_equalTo(AUTO(25));
    }];
    
    [self.contentView addSubview:self.errorInfoView];
    [self.errorInfoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentTF);
        make.height.mas_equalTo(AUTO(20));
        make.width.mas_equalTo(AUTO(200));
        make.bottom.offset(0);
    }];
    


    [self.errorInfoView addSubview:self.errorIconImgView];
    [self.errorIconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.centerY.equalTo(self.errorInfoView);
        make.size.mas_equalTo(CGSizeMake(AUTO(12), AUTO(12)));
    }];
    
    [self.errorInfoView addSubview:self.errorInfoLab];
     [self.errorInfoLab mas_makeConstraints:^(MASConstraintMaker *make) {
         make.left.equalTo(self.errorIconImgView.mas_right).offset(2);
         make.centerY.equalTo(self.errorInfoView);
     }];
}



- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(16) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _titleLab;
}

- (UITextField *)contentTF {
    if (!_contentTF) {
        _contentTF = [UITextField new];
        _contentTF.textColor = COLOR_2F2F2F;
        _contentTF.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(16)];
        _contentTF.placeholder  = @"未填写";
    }
    return _contentTF;
}

- (UIView *)errorInfoView {
    if (!_errorInfoView) {
        _errorInfoView = [UIView new];
    }
    return _errorInfoView;
}

- (UILabel *)errorInfoLab {
    if (!_errorInfoLab) {
        _errorInfoLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:0];
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

@end
