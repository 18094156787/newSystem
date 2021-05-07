//
//  JCYCRuleTitleView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/4/13.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCYCRuleTitleView.h"

@implementation JCYCRuleTitleView

- (void)initViews {
    UIView *lineView = [UIView new];
    [self addSubview:lineView];
    lineView.backgroundColor = COLOR_FE644D;
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.centerY.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(2, 16));
    }];
    
    [self addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.centerY.equalTo(self);
    }];
    
    
//    self.titleLab.text = @"分段小标题01";
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:16 andWeight:0 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
        _titleLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(16)];
        _titleLab.numberOfLines = 0 ;
    }
    return _titleLab;;
}

@end
