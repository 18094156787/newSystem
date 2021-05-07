//
//  JCDiXianFootView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/11/13.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCDiXianFootView.h"

@implementation JCDiXianFootView

- (void)initViews {
    self.backgroundColor = JCClearColor;
    UILabel *label = [UILabel initWithTitle:@"没有更多内容了" andFont:AUTO(12) andWeight:1 andTextColor:[COLOR_000000 colorWithAlphaComponent:0.21] andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    [self addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.equalTo(self);
    }];
    UIView *leftLine = [UIView new];
    leftLine.backgroundColor = [COLOR_000000 colorWithAlphaComponent:0.1];
    [self addSubview:leftLine];
    [leftLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.offset(AUTO(12));
        make.right.equalTo(label.mas_left).offset(AUTO(-8));
        make.height.mas_equalTo(1);
    }];

    UIView *rightLine = [UIView new];
    rightLine.backgroundColor = [COLOR_000000 colorWithAlphaComponent:0.1];
    [self addSubview:rightLine];
    [rightLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.right.offset(AUTO(-12));
        make.left.equalTo(label.mas_right).offset(AUTO(8));
        make.height.mas_equalTo(1);
    }];
}
@end
