//
//  JCYCMyYcPrizeShowView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/10/29.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCYCMyYcPrizeShowView.h"

@implementation JCYCMyYcPrizeShowView

- (void)initViews {
    self.backgroundColor = [JCBlackColor colorWithAlphaComponent:0.5];
    UIView *bgView = [UIView new];
    [self addSubview:bgView];
    bgView.backgroundColor = JCWhiteColor;
    [bgView hg_setAllCornerWithCornerRadius:AUTO(20)];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(kNavigationBarHeight+100);
        make.left.offset(AUTO(30));
        make.right.offset(AUTO(-30));
    }];
    
    UILabel *titleLab = [UILabel initWithTitle:@"领取奖励" andFont:AUTO(16) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    [bgView addSubview:titleLab];
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.offset(AUTO(20));
    }];
    
    UIView *lineView = [UIView new];
    lineView.backgroundColor = COLOR_F4F4F8;
    [bgView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.top.equalTo(titleLab.mas_bottom);
        make.height.mas_equalTo(1);
    }];
    
    UILabel *prizeLab = [UILabel initWithTitle:@"本期奖金：" andFont:AUTO(16) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    [bgView addSubview:prizeLab];
    [prizeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(20));
        make.top.equalTo(lineView.mas_bottom).offset(AUTO(15));
        make.height.mas_equalTo(AUTO(17));
    }];
    
    [bgView addSubview:self.priceLab];
    [self.priceLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(prizeLab.mas_right).offset(AUTO(8));
        make.centerY.equalTo(prizeLab);
    }];
    
    [bgView addSubview:self.kefuLab];
    [self.kefuLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(20));
        make.right.offset(AUTO(-20));
        make.top.equalTo(prizeLab.mas_bottom).offset(AUTO(10));
    }];
    
    UILabel *codeLab = [UILabel initWithTitle:@"验证码：" andFont:AUTO(16) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    [bgView addSubview:codeLab];
     [codeLab mas_makeConstraints:^(MASConstraintMaker *make) {
         make.left.offset(AUTO(20));
         make.top.equalTo(self.kefuLab.mas_bottom).offset(AUTO(10));
         make.height.mas_equalTo(AUTO(17));
     }];
    
    [bgView addSubview:self.codeLab];
    [self.codeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(codeLab.mas_right).offset(AUTO(8));
        make.centerY.equalTo(codeLab);
    }];
    
    [bgView addSubview:self.copyBtn];
    [self.copyBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(20));
        make.right.offset(AUTO(-20));
        make.top.equalTo(codeLab.mas_bottom).offset(AUTO(20));
        make.height.mas_equalTo(AUTO(44));
        make.bottom.offset(AUTO(-20));
    }];
    
    
    WeakSelf;
    [self.copyBtn bk_whenTapped:^{
        if ([JCConfigModel currentConfigModel].customer_award.length>0) {
              UIPasteboard * pasteBoard = [UIPasteboard generalPasteboard];
              pasteBoard.string = [JCConfigModel currentConfigModel].customer_award;
              [JCWToastTool showHint:@"复制成功 请前往微信添加客服"];
            [weakSelf removeFromSuperview];
        }

    }];
    
}


- (void)setModel:(JCMyZhanJiModel *)model {
    _model = model;
//    float price = [model.total floatValue]/100.0f;
    self.priceLab.text = [NSString stringWithFormat:@"%@",[NSString stringWithFormat:@"%@元",model.total]];
    self.kefuLab.text = [NSString stringWithFormat:@"请联系客服微信号：%@领取奖金，领取奖金时请提供验证码给予客服人员进行核对",[JCConfigModel currentConfigModel].customer_award];
    self.codeLab.text = [NSString stringWithFormat:@"%@",model.code];

}

- (UILabel *)priceLab {
    if (!_priceLab) {
        _priceLab = [UILabel initWithTitle:@"" andFont:AUTO(16) andWeight:2 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _priceLab;
}

- (UILabel *)kefuLab {
    if (!_kefuLab) {
        _kefuLab = [UILabel initWithTitle:@"" andFont:AUTO(16) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
        _kefuLab.numberOfLines = 0;
    }
    return _kefuLab;
}

- (UILabel *)codeLab {
    if (!_codeLab) {
        _codeLab = [UILabel initWithTitle:@"" andFont:AUTO(16) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _codeLab;
}

- (UIButton *)copyBtn {
    if (!_copyBtn) {
        _copyBtn  = [UIButton initWithText:@"复制微信号" FontSize:AUTO(16) Weight:2 BackGroundColor:JCBaseColor TextColors:JCWhiteColor];
        [_copyBtn hg_setAllCornerWithCornerRadius:AUTO(22)];
    }
    return _copyBtn;
}

@end
