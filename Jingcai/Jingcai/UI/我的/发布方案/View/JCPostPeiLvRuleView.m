//
//  JCPostPeiLvRuleView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/3.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCPostPeiLvRuleView.h"

@implementation JCPostPeiLvRuleView

- (void)initViews {
    self.backgroundColor = [JCBlackColor colorWithAlphaComponent:0.5];
//    self.titleLab.text = title;
//    self.titleLab.textColor = titleColor;
//    self.contentLab.text = message;
//    self.contentLab.textColor = msgColor;
//    [self.sureBtn setTitle:comfirmTitle forState:0];
//    self.sureBtn.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(14)];
    
    
     [self addSubview:self.bgView];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.offset(kNavigationBarHeight+AUTO(30));
        make.left.offset(AUTO(35));
        make.right.offset(AUTO(-35));

    }];

    [self.bgView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(15));
        make.left.offset(AUTO(30));
        make.right.offset(AUTO(-30));
    }];

    
    [self.bgView addSubview:self.contentLab];
    [self.contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLab.mas_bottom).offset(AUTO(10));
        make.left.offset(AUTO(20));
        make.right.offset(AUTO(-20));
    }];

    [self.bgView addSubview:self.lineView];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.bgView);
        make.height.mas_equalTo(0.5);
        make.top.equalTo(self.contentLab.mas_bottom).offset(AUTO(15));
    }];

    [self.bgView addSubview:self.sureBtn];
    [self.sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.bgView);
        make.height.mas_equalTo(AUTO(80));
//
        make.top.equalTo(self.lineView.mas_bottom);
        make.bottom.equalTo(self.bgView).offset(0);
    }];
    
    UILabel *sureLab = [UILabel initWithTitle:@"确认" andFont:AUTO(16) andWeight:2 andTextColor:JCWhiteColor andBackgroundColor:JCBaseColor andTextAlignment:NSTextAlignmentCenter];
    [sureLab hg_setAllCornerWithCornerRadius:AUTO(22)];
    [self.sureBtn addSubview:sureLab];
    [sureLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.equalTo(self.sureBtn);
        make.size.mas_equalTo(CGSizeMake(AUTO(270), AUTO(44)));
    }];
    

    NSString *title = @"1.竞足单场\n① 单场单选的赔率值必须大于1.40。\n② 单场双选的赔率，两个选项赔率值必须均超过2.00以上，且总赔率必须超过1. 40(A+B大于5.60)。\n③ 单选赔率值在1.40-1.49范围内的推荐作品不得付费阅读。\n④ 双选赔率值需达到1.50 (即A+B达到6.00)的投稿作品允许付费阅读。\n2.竞足串关（涉及2场及以上场次比赛分析）\n① 2串1赔率大于2.00倍（回报率>1.00) ,3串1赔率大于3.00倍（回报率>2.00)。串关场次应符合单场的要求，写明比赛场次的具体分析\n② 串关最多只允许1个双选的场次。\n3.计算公式\n① 2串关回报率=A*B-1\n② 3串关回报率=A*B*C-1\n③ 双选总赔率P=a*b/（a+b），a、b为双选的选项。\n④ 双选串关回报率A*B*P-1";
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:title];
    NSRange range = [title rangeOfString:@"1.竞足单场"];
    NSRange range1 = [title rangeOfString:@"2.竞足串关"];
    NSRange range2 = [title rangeOfString:@"（涉及2场及以上场次比赛分析）"];
    NSRange range3 = [title rangeOfString:@"3.计算公式"];
    [attr addAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(15)]} range:range];
    [attr addAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(15)]} range:range1];
    [attr addAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(12)]} range:range2];
    [attr addAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(15)]} range:range3];
    
    self.contentLab.attributedText = attr;
    WeakSelf;
    [self.sureBtn bk_whenTapped:^{
        [weakSelf removeFromSuperview];
    }];
}

- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [UIView new];
        _bgView.backgroundColor = JCWhiteColor;
        [_bgView hg_setAllCornerWithCornerRadius:AUTO(20)];
    }
    return _bgView;
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"规则说明" andFont:AUTO(17) andWeight:1 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _titleLab.numberOfLines = 0;
    }
    return _titleLab;
}

- (UILabel *)contentLab {
    if (!_contentLab) {
        _contentLab = [UILabel initWithTitle:@"" andFont:AUTO(15) andWeight:1 andTextColor:COLOR_666666 andBackgroundColor:JCClearColor andTextAlignment:0];
        _contentLab.numberOfLines = 0;
    }
    return _contentLab;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [UIView new];
        _lineView.backgroundColor =COLOR_DDDDDD;
    }
    return _lineView;
}

- (UIButton *)sureBtn {
    if (!_sureBtn) {
        _sureBtn = [UIButton initWithText:@"" FontSize:AUTO(14) Weight:1 BackGroundColor:JCClearColor TextColors:JCClearColor];
    }
    return _sureBtn;
}

@end
