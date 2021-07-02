//
//  JCMineIncomeTopView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/8/31.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCMineIncomeTopView.h"
#import "JCBaseTitleAlertView.h"
#import "JCWithDrawRecordDetailVC.h"
#import "JCApplyBindingBankCardVC.h"
@implementation JCMineIncomeTopView

- (void)initViews {
    UIView *topView = [UIView new];
    [self addSubview:topView];
    topView.frame = CGRectMake(0, 0, SCREEN_WIDTH, kNavigationBarHeight+AUTO(230));



    // gradient
    CAGradientLayer *gl = [CAGradientLayer layer];
    gl.frame = CGRectMake(0, 0, SCREEN_WIDTH, kNavigationBarHeight+AUTO(230));
    gl.startPoint = CGPointMake(0.42, 0.79);
    gl.endPoint = CGPointMake(0.42, 0);
    gl.colors = @[(__bridge id)[UIColor colorWithRed:163/255.0 green:32/255.0 blue:32/255.0 alpha:1.0].CGColor, (__bridge id)[UIColor colorWithRed:229/255.0 green:69/255.0 blue:61/255.0 alpha:1.0].CGColor];
    gl.locations = @[@(0), @(1.0f)];
    [topView.layer addSublayer:gl];
    
    [topView addSubview:self.moneyLabel];
    [self.moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.offset(AUTO(20)+kNavigationBarHeight);
        make.height.mas_equalTo(AUTO(22));
    }];
    
    [topView addSubview:self.moneyLab];
    [self.moneyLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.moneyLabel);
        make.top.equalTo(self.moneyLabel.mas_bottom).offset(AUTO(10));
        make.height.mas_equalTo(AUTO(50));
    }];
    
    [topView addSubview:self.withDrawBtn];
    [self.withDrawBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.moneyLab).offset(-5);
        make.right.offset(AUTO(-20));
        make.size.mas_equalTo(CGSizeMake(AUTO(76), AUTO(30)));
    }];
    
    UIImageView *logoImgView = [UIImageView new];
    logoImgView.image = JCIMAGE(@"me_income_img");
    [self addSubview:logoImgView];
    [logoImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-8));
        make.top.equalTo(self.moneyLabel);
        make.size.mas_equalTo(CGSizeMake(AUTO(154), AUTO(88)));
    }];
    
    [self addSubview:self.bgView];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.top.equalTo(self.moneyLab.mas_bottom).offset(AUTO(20));
        make.height.mas_equalTo(AUTO(92));
    }];
    

    
    

    
    [self.bgView addSubview:self.yesterdayLabel];
    [self.yesterdayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(25));
        make.top.offset(AUTO(20));
    }];
    
    float  width = (SCREEN_WIDTH- AUTO(50))/3.0f;
    
    [self.bgView addSubview:self.yesterdayLab];
    [self.yesterdayLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.yesterdayLabel);
        make.top.equalTo(self.yesterdayLabel.mas_bottom).offset(5);
        make.width.mas_equalTo(width);
    }];
    
    [self.bgView addSubview:self.monthLabel];
    [self.monthLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.yesterdayLabel);
        make.centerX.equalTo(self.bgView);
    }];
    
    [self.bgView addSubview:self.monthLab];
    [self.monthLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.monthLabel);
        make.top.equalTo(self.monthLabel.mas_bottom).offset(5);
        make.width.mas_equalTo(width);
    }];
    
    [self.bgView addSubview:self.totalLabel];
    [self.totalLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.yesterdayLabel);
        make.right.offset(AUTO(-25));
    }];
    
    [self.bgView addSubview:self.totalLab];
    [self.totalLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.totalLabel);
        make.top.equalTo(self.totalLabel.mas_bottom).offset(5);
        make.width.mas_equalTo(width);
    }];
    

}

- (void)withDrawBtnClick {
    
    {
        WeakSelf;
         JCWithDrawRecordDetailVC *vc = [JCWithDrawRecordDetailVC new];
         vc.JCRefreshBlock = ^{
             if (weakSelf.JCRefreshBlock) {
                 weakSelf.JCRefreshBlock();
             }
         };
         [[self getViewController].navigationController pushViewController:vc animated:YES];
        return;
    }
    if ([self.model.surplus_profit integerValue]==0) {
        return;
    }
    
    if ([self.model.is_time integerValue]!=1) {
        JCBaseTitleAlertView *alertView = [JCBaseTitleAlertView new];
        [alertView alertTitle:@"提现规则" TitleColor:COLOR_333333 Mesasge:@"每月5~10日可确认上月稿酬，并发起提现申请，稿酬将在每月10号通过转账支付至用户指定银行账户。" MessageColor:COLOR_666666 ComfirmTitle:@"知道了" ComfirmColor:JCBaseColor confirmHandler:^{
            [alertView removeFromSuperview];
        }];
        alertView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        [[UIApplication sharedApplication].keyWindow addSubview:alertView];
        return;;
    }
    if ([self.model.is_tx integerValue]==1) {
        JCBaseTitleAlertView *alertView = [JCBaseTitleAlertView new];
        [alertView alertTitle:@"" TitleColor:COLOR_333333 Mesasge:@"您本月已成功提现一次,请下月再来" MessageColor:COLOR_666666 ComfirmTitle:@"知道了" ComfirmColor:JCBaseColor confirmHandler:^{
            [alertView removeFromSuperview];
        }];
        alertView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        [[UIApplication sharedApplication].keyWindow addSubview:alertView];
        return;;
    }
    if ([JCWUserBall currentUser].bankcard_number.length==0) {
        JCBaseTitleAlertView *alertView = [JCBaseTitleAlertView new];
        [alertView alertTitle:@"" TitleColor:COLOR_333333 Mesasge:@"您未绑定银行卡,前往绑定" MessageColor:COLOR_666666 ComfirmTitle:@"知道了" ComfirmColor:JCBaseColor confirmHandler:^{
            [alertView removeFromSuperview];
            JCApplyBindingBankCardVC *vc = [JCApplyBindingBankCardVC new];
            [[self getViewController].navigationController pushViewController:vc animated:YES];
        }];
        alertView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        [[UIApplication sharedApplication].keyWindow addSubview:alertView];

        return;;
    }
    WeakSelf;
    JCWithDrawRecordDetailVC *vc = [JCWithDrawRecordDetailVC new];
    vc.JCRefreshBlock = ^{
        if (weakSelf.JCRefreshBlock) {
            weakSelf.JCRefreshBlock();
        }
    };
    [[self getViewController].navigationController pushViewController:vc animated:YES];

    

}

- (void)setModel:(JCMyIncomeDetailModel *)model {
    _model = model;
//
    NSString *money = [NSString stringWithFormat:@"¥ %@",model.surplus_profit];
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:money];
    NSRange range = [money rangeOfString:@"¥"];
    if (range.location!=NSNotFound) {
        [attr addAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(18)]} range:range];
    }
    self.moneyLab.attributedText = attr;
    self.yesterdayLab.text = model.yestoday_profit;
    self.monthLab.text = model.month_profit;
    self.totalLab.text = model.cumulative_income;
    if ([self.model.surplus_profit integerValue]==0) {
        self.withDrawBtn.backgroundColor = COLOR_DDDDDD;
    }
}



- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [UIView new];
        _bgView.backgroundColor = JCWhiteColor;
        [_bgView hg_setAllCornerWithCornerRadius:AUTO(5)];
    }
    return _bgView;
}



- (UILabel *)moneyLabel {
    if (!_moneyLabel) {
        _moneyLabel = [UILabel initWithTitle:@"收益余额" andFont:AUTO(16) andWeight:1 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _moneyLabel;
}

- (UILabel *)moneyLab {
    if (!_moneyLab) {
        _moneyLab = [UILabel initWithTitle:@"" andFont:AUTO(48) andWeight:2 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _moneyLab;
}

- (UIButton *)withDrawBtn {
    if (!_withDrawBtn) {
        _withDrawBtn = [UIButton initWithText:@"提现" FontSize:AUTO(13) Weight:2 BackGroundColor:JCBaseColor TextColors:JCWhiteColor];
        _withDrawBtn.layer.cornerRadius = AUTO(15);
        _withDrawBtn.layer.masksToBounds = YES;
        _withDrawBtn.layer.borderColor = JCWhiteColor.CGColor;
        _withDrawBtn.layer.borderWidth = 1;
        [_withDrawBtn addTarget:self action:@selector(withDrawBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _withDrawBtn;
}

- (UILabel *)yesterdayLabel {
    if (!_yesterdayLabel) {
        _yesterdayLabel = [UILabel initWithTitle:@"昨日收益" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _yesterdayLabel;
}

- (UILabel *)yesterdayLab {
    if (!_yesterdayLab) {
        _yesterdayLab = [UILabel initWithTitle:@"" andFont:AUTO(22) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _yesterdayLab;
}

- (UILabel *)monthLabel {
    if (!_monthLabel) {
        _monthLabel = [UILabel initWithTitle:@"本月收益" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _monthLabel;
}

- (UILabel *)monthLab {
    if (!_monthLab) {
        _monthLab = [UILabel initWithTitle:@"" andFont:AUTO(22) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _monthLab;
}

- (UILabel *)totalLabel {
    if (!_totalLabel) {
        _totalLabel = [UILabel initWithTitle:@"累计收益" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _totalLabel;
}

- (UILabel *)totalLab {
    if (!_totalLab) {
        _totalLab = [UILabel initWithTitle:@"" andFont:AUTO(22) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _totalLab;
}

@end
