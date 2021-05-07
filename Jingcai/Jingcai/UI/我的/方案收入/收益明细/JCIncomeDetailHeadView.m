//
//  JCIncomeDetailHeadView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/8/31.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCIncomeDetailHeadView.h"

@implementation JCIncomeDetailHeadView

- (void)initViews {
    self.backgroundColor = COLOR_F0F0F0;
    [self addSubview:self.timeLab];
    [self.timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.centerY.equalTo(self);
    }];
    
    [self addSubview:self.moneyLab];
    [self.moneyLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-AUTO(15));
        make.centerY.equalTo(self);
    }];
}


- (void)setModel:(JCMyIncomeTitleModel *)model {
    _model = model;
    self.timeLab.text = model.get_pay_time;
    self.moneyLab.text = [NSString stringWithFormat:@"合计：%@",model.money];
    
}

- (UILabel *)timeLab {
    if (!_timeLab) {
        _timeLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _timeLab;
}

- (UILabel *)moneyLab {
    if (!_moneyLab) {
        _moneyLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _moneyLab;
}


@end
