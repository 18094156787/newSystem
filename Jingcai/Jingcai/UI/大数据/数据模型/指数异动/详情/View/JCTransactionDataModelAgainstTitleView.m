//
//  JCTransactionDataModelAgainstTitleView.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/19.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCTransactionDataModelAgainstTitleView.h"

@implementation JCTransactionDataModelAgainstTitleView

- (void)initViews {
    
    UIView *iconView = [UIView new];
    iconView.backgroundColor = JCBaseColor;
    [self addSubview:iconView];
    [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.centerY.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(2, 16));
    }];
    
    [self addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(28));
        make.centerY.equalTo(iconView);
    }];
    
    [self addSubview:self.infoLab];
    [self.infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-16));
        make.centerY.equalTo(iconView);
    }];
    

    
    UILabel *awayLab = [UILabel initWithTitle:@"客队" andFont:AUTO(10) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:0];
    [self addSubview:awayLab];
    [awayLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-15));
        make.centerY.equalTo(self);
    }];
    
    UIView *awayView = [UIView new];
    awayView.backgroundColor = UIColorFromRGB(0x3578E3);
    [self addSubview:awayView];
    [awayView hg_setAllCornerWithCornerRadius:1];
    [awayView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(awayLab.mas_left).offset(AUTO(-2));
        make.centerY.equalTo(self);
        make.width.height.mas_equalTo(AUTO(8));
    }];
    
    UILabel *homeLab = [UILabel initWithTitle:@"主队" andFont:AUTO(10) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:0];
    [self addSubview:homeLab];
    [homeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(awayView.mas_left).offset(AUTO(-20));
        make.centerY.equalTo(self);
    }];
    
    UIView *homeView = [UIView new];
    [self addSubview:homeView];
    homeView.backgroundColor = COLOR_EF2F2F;
    [homeView hg_setAllCornerWithCornerRadius:1];
    [homeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(homeLab.mas_left).offset(AUTO(-2));
        make.centerY.equalTo(self);
        make.width.height.mas_equalTo(AUTO(8));
    }];
}
- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(16) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _titleLab;
}

- (UILabel *)infoLab {
    if (!_infoLab) {
        _infoLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _infoLab;
}
@end
