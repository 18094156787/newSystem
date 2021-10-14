//
//  JCApplyBindingFootView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/2.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCApplyBindingFootView.h"

@implementation JCApplyBindingFootView

- (void)initViews {
    self.backgroundColor = JCWhiteColor;
    UIView *iconView = [UIView new];
    iconView.backgroundColor = JCBaseColor;
    [self addSubview:iconView];
    [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.offset(AUTO(15));
        make.size.mas_equalTo(CGSizeMake(2, 16));
    }];

    UILabel *label = [UILabel initWithTitle:@"提现须知" andFont:AUTO(16) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    [self addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(iconView.mas_right).offset(AUTO(10));
        make.centerY.equalTo(iconView);
        make.height.mas_equalTo(16);
    }];
    NSString *str  = @"请上方填写您的真实的个人信息，银行卡开户名必须和认证的账号身份信息一致,信息出错或者不一致，会导致您提现失败。上述信息仅用于开通作者提现的稿酬提现，平台尊重并保护用户的隐私信息";
    NSRange range = [str rangeOfString:@"银行卡开户名必须和认证的账号身份信息一致"];
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:str];
    [attr addAttributes:@{NSForegroundColorAttributeName:JCBaseColor} range:range];
    UILabel *contentLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    contentLab.attributedText = attr;
    contentLab.numberOfLines = 0;
    [self addSubview:contentLab];
    [contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.top.equalTo(iconView.mas_bottom).offset(AUTO(15));
    }];
}

@end
