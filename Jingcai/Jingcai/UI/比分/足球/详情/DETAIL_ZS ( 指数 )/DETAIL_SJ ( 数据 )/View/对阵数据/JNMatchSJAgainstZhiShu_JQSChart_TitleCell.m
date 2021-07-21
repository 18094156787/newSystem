//
//  JNMatchSJAgainstZhiShu_JQSChart_TitleCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/18.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JNMatchSJAgainstZhiShu_JQSChart_TitleCell.h"

@implementation JNMatchSJAgainstZhiShu_JQSChart_TitleCell

- (void)initViews {
    [self addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.height.mas_equalTo(AUTO(28));
    }];
    
    UILabel *awayWinLab = [UILabel initWithTitle:@"负" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:0];
    [self.titleLab addSubview:awayWinLab];
    [awayWinLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.titleLab);
        make.right.offset(AUTO(-5));
    }];
    
    UIView *awayWinView =[UIView new];
    awayWinView.backgroundColor = COLOR_002868;
    [awayWinView hg_setAllCornerWithCornerRadius:AUTO(4)];
    [self.contentView addSubview:awayWinView];
    [awayWinView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.titleLab);
        make.right.equalTo(awayWinLab.mas_left).offset(-4);
        make.width.height.mas_equalTo(AUTO(8));
    }];
    
    UILabel *eqalWinLab = [UILabel initWithTitle:@"平" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:0];
    [self.contentView addSubview:eqalWinLab];
    [eqalWinLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.titleLab);
        make.height.mas_equalTo(AUTO(15));
        make.right.equalTo(awayWinView.mas_left).offset(-15);
    }];
    
    UIView *eqalView =[UIView new];
    eqalView.backgroundColor = COLOR_30B27A;
    [eqalView hg_setAllCornerWithCornerRadius:AUTO(4)];
    [self.contentView addSubview:eqalView];
    [eqalView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.titleLab);
        make.right.equalTo(eqalWinLab.mas_left).offset(-4);
        make.width.height.mas_equalTo(AUTO(8));
    }];
    
    UILabel *homeWinLab = [UILabel initWithTitle:@"胜" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:0];
    [self.contentView addSubview:homeWinLab];
    [homeWinLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.titleLab);
        make.height.mas_equalTo(AUTO(15));
        make.right.equalTo(eqalView.mas_left).offset(-15);
    }];
    
    UIView *homeWindView =[UIView new];
    homeWindView.backgroundColor = JCBaseColor;
    [homeWindView hg_setAllCornerWithCornerRadius:AUTO(4)];
    [self.contentView addSubview:homeWindView];
    [homeWindView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.titleLab);
        make.right.equalTo(homeWinLab.mas_left).offset(-4);
        make.width.height.mas_equalTo(AUTO(8));
    }];

}

- (void)data {
    self.titleLab.text = @"  近10场战绩";

}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:[COLOR_002868 colorWithAlphaComponent:0.06] andTextAlignment:0];
    }
    return _titleLab;
}



@end
