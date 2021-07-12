//
//  JCPostCheckArticle_Invite_Gaochou_HeadView.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/7/1.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCPostCheckArticle_Invite_Gaochou_HeadView.h"

@implementation JCPostCheckArticle_Invite_Gaochou_HeadView

- (void)initViews {
    self.backgroundColor = JCWhiteColor;
    UIView *colorView = [UIView new];
    colorView.backgroundColor = COLOR_F0F0F0;
    [self addSubview:colorView];
    [colorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.offset(0);
        make.height.mas_equalTo(AUTO(8));
    }];
    
    
    UILabel *label0 = [UILabel initWithTitle:@"当您成功成为签约红榜达人时,您可直接发布付费方案！" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    label0.numberOfLines = 0;
    [self addSubview:label0];
    [label0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(13));
        make.right.offset(AUTO(-13));
        make.top.offset(AUTO(15));
        make.height.mas_equalTo(AUTO(40));
    }];
    
    UIView *iconView = [UIView new];
    iconView.backgroundColor = JCBaseColor;
    [self addSubview:iconView];
    [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.equalTo(label0.mas_bottom).offset(AUTO(15));
        make.size.mas_equalTo(CGSizeMake(2, 16));
    }];


    UILabel *label = [UILabel initWithTitle:@"您的稿酬配置如下：" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    [self addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(iconView.mas_right).offset(AUTO(10));
        make.centerY.equalTo(iconView);
        make.height.mas_equalTo(16);
    }];
    
    
    [self addSubview:self.ruleBtn];
    [self.ruleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-15));
        make.centerY.equalTo(iconView);
        make.width.height.mas_equalTo(AUTO(25));
    }];
    
    UIView *lineView1 = [UIView new];
    [self addSubview:lineView1];
    lineView1.backgroundColor = COLOR_F0F0F0;
    [lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.offset(0);
        make.bottom.offset(0);
        make.height.mas_equalTo(1);
    }];
    

    
}


- (void)ruleBtnClick {
    self.ruleView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    [[UIApplication sharedApplication].keyWindow addSubview:self.ruleView];
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(18) andWeight:2 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _titleLab;
}

- (UILabel *)articlecCountLab {
    if (!_articlecCountLab) {
        _articlecCountLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _articlecCountLab;
}

- (UILabel *)articlecCountLabel {
    if (!_articlecCountLabel) {
        _articlecCountLabel = [UILabel initWithTitle:@"付费达人方案总数" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _articlecCountLabel;
}

- (UILabel *)benefitCountLab {
    if (!_benefitCountLab) {
        _benefitCountLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _benefitCountLab;
}



- (UILabel *)benefitCountLabel {
    if (!_benefitCountLabel) {
        _benefitCountLabel = [UILabel initWithTitle:@"获得收益提成总数" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _benefitCountLabel;
}


- (UIButton *)ruleBtn {
    if (!_ruleBtn) {
        _ruleBtn = [UIButton new];
        [_ruleBtn setImage:JCIMAGE(@"commom_question") forState:0];
        [_ruleBtn setImage:JCIMAGE(@"commom_question") forState:UIControlStateHighlighted];
        [_ruleBtn addTarget:self action:@selector(ruleBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _ruleBtn;
}

- (JCWithDrawRecordRuleView *)ruleView {
    if (!_ruleView) {
        _ruleView = [JCWithDrawRecordRuleView new];
    }
    return _ruleView;
}

@end
