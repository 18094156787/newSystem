//
//  JCJingCaiAIBigDataMatchTitleView.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/10/22.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCJingCaiAIBigDataMatchTitleView.h"

@implementation JCJingCaiAIBigDataMatchTitleView

- (void)initViews {
    
    UIView *iconView = [UIView new];
    iconView.backgroundColor = JCBaseColor;
    [self addSubview:iconView];
    [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(8));
        make.centerY.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(2, 16));
    }];
    
    [self addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.centerY.equalTo(self);
    }];
    
    [self addSubview:self.tipLab];
    [self.tipLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-15));
        make.centerY.equalTo(self);
        make.height.mas_equalTo(AUTO(40));
    }];
    
    UIView *lineView = [UIView new];
    lineView.backgroundColor = COLOR_F0F0F0;
    [self addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.offset(0);
        make.height.mas_equalTo(0.8);
    }];
    
    WeakSelf;
    [self.tipLab bk_whenTapped:^{
        if (weakSelf.JCBlcok) {
            weakSelf.JCBlcok();
        }
    }];
}
- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(16) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _titleLab;
}
- (UILabel *)tipLab {
    if (!_tipLab) {
        _tipLab = [UILabel initWithTitle:@"示例" andFont:AUTO(14) andWeight:1 andTextColor:UIColorFromRGB(0x0082DD) andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _tipLab.userInteractionEnabled = YES;
    }
    return _tipLab;
}

@end
