//
//  JCDakaBuyPayWayTopView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/10/28.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCDakaBuyPayWayTopView.h"

@implementation JCDakaBuyPayWayTopView

- (void)initViews {
    UIView *iconView = [UIView new];
    iconView.backgroundColor = JCBaseColor;
    [self addSubview:iconView];
    [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.centerY.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(2, 16));
    }];

    UILabel *label = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    [self addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(iconView.mas_right).offset(AUTO(10));
        make.centerY.equalTo(iconView);
        make.height.mas_equalTo(16);
    }];
    self.titleLab = label;
    
    self.lineView = [UIView new];
    self.lineView.backgroundColor = COLOR_F0F0F0;
    [self addSubview:self.lineView];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.bottom.offset(0);
        make.height.mas_equalTo(1);
    }];
    
    self.infoLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:2 andTextColor:COLOR_A9A9A9 andBackgroundColor:JCClearColor andTextAlignment:0];
    [self addSubview:self.infoLab];
    [self.infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-15));
        make.centerY.equalTo(iconView);
        make.height.mas_equalTo(16);
    }];

}

@end
