//
//  JCPoissonDataModelDetailTitleView.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/11.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCPoissonDataModelDetailTitleView.h"

@implementation JCPoissonDataModelDetailTitleView


- (void)initViews {
    self.backgroundColor = JCWhiteColor;
    UIView *iconView = [UIView new];
    iconView.backgroundColor = JCBaseColor;
    [self addSubview:iconView];
    [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.centerY.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(4, 16));
    }];
    
    [self addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(28));
        make.centerY.equalTo(self);
    }];
}
- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(16) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _titleLab;
}

@end
