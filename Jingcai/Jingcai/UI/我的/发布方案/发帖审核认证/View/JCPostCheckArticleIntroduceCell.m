//
//  JCPostCheckArticleIntroduceCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/8/23.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCPostCheckArticleIntroduceCell.h"
#import "UITextView+Placeholder.h"
@implementation JCPostCheckArticleIntroduceCell

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
    

    
    [self.contentView addSubview:self.contentTV];
    [self.contentTV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.mas_equalTo(AUTO(-15));
        make.top.equalTo(self.titleLab.mas_bottom).offset(AUTO(15));
        make.bottom.offset(-AUTO(20));
    }];
    
    [self.contentView addSubview:self.countLab];
    [self.countLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-15));
        make.top.equalTo(self.contentTV.mas_bottom);
    }];
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"专家简介" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _titleLab;
}


- (UITextView *)contentTV {
    if (!_contentTV) {
        _contentTV = [UITextView new];
        _contentTV.textColor = COLOR_333333;
        _contentTV.showsVerticalScrollIndicator = NO;
        _contentTV.placeholder = @"请输入专家简介（最少20字，最多100字）";
        _contentTV.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(14)];
    }
    return _contentTV;
}

- (UIView *)errorInfoView {
    if (!_errorInfoView) {
        _errorInfoView = [UIView new];
    }
    return _errorInfoView;
}

- (UILabel *)errorInfoLab {
    if (!_errorInfoLab) {
        _errorInfoLab = [UILabel initWithTitle:@"请输入20~100字的专家简介" andFont:AUTO(12) andWeight:1 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:0];
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

- (UILabel *)countLab {
    if (!_countLab) {
        _countLab = [UILabel initWithTitle:@"0/100" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _countLab;
}
@end
