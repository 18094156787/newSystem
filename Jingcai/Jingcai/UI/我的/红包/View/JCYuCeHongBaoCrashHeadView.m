//
//  JCYuCeHongBaoCrashHeadView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/11/5.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCYuCeHongBaoCrashHeadView.h"
#import "JCYuCeHongBaoSmallPriceWithDrawVC.h"
@implementation JCYuCeHongBaoCrashHeadView

- (void)initViews {
    UILabel *label = [UILabel initWithTitle:@"未提现：" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_A9A9A9 andBackgroundColor:JCClearColor andTextAlignment:0];
    [self addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.offset(AUTO(20));
    }];
    
    UILabel *label1= [UILabel initWithTitle:@"累计提现：" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_A9A9A9 andBackgroundColor:JCClearColor andTextAlignment:0];
    [self addSubview:label1];
    [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.equalTo(label.mas_bottom).offset(AUTO(8));
    }];
    
    [self addSubview:self.moneyLab];
    [self.moneyLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label.mas_right).offset(AUTO(5));
        make.centerY.equalTo(label);
    }];
    
    [self addSubview:self.totalyLab];
    [self.totalyLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label1.mas_right).offset(AUTO(5));
        make.centerY.equalTo(label1);
    }];
    
    [self addSubview:self.submitBtn];
    [self.submitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.right.offset(AUTO(-15));
        make.size.mas_equalTo(CGSizeMake(AUTO(88), AUTO(30)));
    }];
    
    UIView *lineView = [UIView new];
    lineView.backgroundColor = COLOR_F0F0F0;
    [self addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.bottom.offset(0);
        make.height.mas_equalTo(1);
    }];
    
    WeakSelf;
    [self.submitBtn bk_whenTapped:^{
        [weakSelf userHaveBigAndSmallHB];
    }];
}

- (void)userHaveBigAndSmallHB {
   // tips表示是否要弹窗，1表示只有大额红包时提示，2表示同时有小额和大额红包时提示

    if ([self.tips integerValue]==1) {
        JCBaseTitleAlertView *alertView = [JCBaseTitleAlertView new];
        [alertView alertTitle:@"确认提现" TitleColor:COLOR_2F2F2F Mesasge:@"您的红包金额较大，这需要单独提现\n请点击单个红包提现" MessageColor:COLOR_666666 ComfirmTitle:@"确定" ComfirmColor:JCBaseColor confirmHandler:^{
            [alertView removeFromSuperview];
        }];
        alertView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        [[UIApplication sharedApplication].keyWindow addSubview:alertView];
    }else if([self.tips integerValue]==2){
        JCBaseTitleAlertView *alertView = [JCBaseTitleAlertView new];
//        alertView.lineView.hidden = YES;
        [alertView alertTitle:@"确认提现" TitleColor:COLOR_2F2F2F Mesasge:@"您拥有多个较大金额红包，需要单独提现，本次批量提现只包含其他金额较小红包，您还要继续提现吗？" MessageColor:COLOR_666666 SureTitle:@"继续提现" SureColor:JCWhiteColor SureHandler:^{
            [alertView removeFromSuperview];
            [self txAction];
            
        } CancleTitle:@"取消" CancleColor:JCBaseColor CancelHandler:^{
           [alertView removeFromSuperview];
        }];
        alertView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        [[UIApplication sharedApplication].keyWindow addSubview:alertView];
        
    }else{
        //只有小额红包
        [self txAction];
    }


}

- (void)txAction {
    JCYuCeHongBaoSmallPriceWithDrawVC *vc = [JCYuCeHongBaoSmallPriceWithDrawVC new];
    vc.tx_all = YES;
    vc.JCBlock = ^{
        if (self.JCRefresh) {
            self.JCRefresh();
        }
    };
    [[self getViewController].navigationController pushViewController:vc animated:YES];
}

- (UILabel *)moneyLab {
    if (!_moneyLab) {
        _moneyLab = [UILabel initWithTitle:@"" andFont:AUTO(16) andWeight:2 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _moneyLab;
}

- (UILabel *)totalyLab {
    if (!_totalyLab) {
        _totalyLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_A9A9A9 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _totalyLab;
}

- (UIButton *)submitBtn {
    if (!_submitBtn) {
        _submitBtn = [UIButton initWithText:@"全部提现" FontSize:AUTO(14) Weight:1 BackGroundColor:JCClearColor TextColors:JCBaseColor];
        _submitBtn.layer.borderColor = JCBaseColor.CGColor;
        _submitBtn.layer.borderWidth = 1;
        _submitBtn.layer.cornerRadius = AUTO(15);
        _submitBtn.layer.masksToBounds = YES;
    }
    return _submitBtn;;
}

@end
