//
//  JCIncomeDetailCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/1/20.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCIncomeDetailCell.h"

@implementation JCIncomeDetailCell

- (void)initViews {
    self.backgroundColor = JCClearColor;
    UIView *bgView = [UIView new];
    bgView.backgroundColor = JCWhiteColor;
    [self addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    [bgView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.offset(AUTO(12));
        make.right.offset(AUTO(-70));
        make.height.mas_equalTo(AUTO(22));
    }];
    
    [bgView addSubview:self.contentLab];
    [self.contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(12));
        make.top.equalTo(self.titleLab.mas_bottom).offset(AUTO(4));
        make.right.offset(AUTO(-70));
    }];
    
    [bgView addSubview:self.moneyLab];
    [self.moneyLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(0);
        make.centerY.equalTo(bgView);
        make.width.mas_equalTo(AUTO(70));
    }];
    
    
}



- (void)setModel:(JCMyIncomeModel *)model {
    _model = model;
    self.titleLab.text = model.title;
    self.contentLab.text = model.content;
    self.moneyLab.text = model.commission;
}



- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(15) andWeight:1 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _titleLab;
}

- (UILabel *)contentLab {
    if (!_contentLab) {
        _contentLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _contentLab;
}

- (UILabel *)moneyLab {
    if (!_moneyLab) {
        _moneyLab = [UILabel initWithTitle:@"" andFont:AUTO(15) andWeight:2 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _moneyLab;
}

@end
