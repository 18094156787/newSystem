//
//  JCJingCaiAIBigDataStyleHeadTitleView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/30.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCJingCaiAIBigDataStyleHeadTitleView.h"

@implementation JCJingCaiAIBigDataStyleHeadTitleView

- (void)initViews {
    [self addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.offset(AUTO(8));
        make.height.mas_equalTo(AUTO(25));
    }];
    
    UIView *lineView = [UIView new];
    lineView.backgroundColor = COLOR_F0F0F0;
    [self addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.offset(0);
        make.top.equalTo(self.titleLab.mas_bottom).offset(AUTO(8));
        make.height.mas_equalTo(1);
    }];
    
    UIView *iconView = [UIView new];
    iconView.backgroundColor = JCBaseColor;
    [self addSubview:iconView];
    [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView.mas_bottom).offset(AUTO(8));
        make.left.offset(AUTO(8));
        make.size.mas_equalTo(CGSizeMake(2, 16));
    }];
    
    [self addSubview:self.contentLab];
    [self.contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(iconView);
        make.left.offset(AUTO(15));
        make.height.mas_equalTo(AUTO(22));
    }];
}
- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(15) andWeight:2 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _titleLab;
}
- (UILabel *)contentLab {
    if (!_contentLab) {
        _contentLab = [UILabel initWithTitle:@"" andFont:AUTO(15) andWeight:2 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _contentLab;
}
@end
