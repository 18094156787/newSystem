//
//  JCWithDrawRecordDetailHeadView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/1.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCWithDrawRecordDetailHeadView.h"

@implementation JCWithDrawRecordDetailHeadView

- (void)initViews {
    self.backgroundColor = JCWhiteColor;
    UIView *colorView = [UIView new];
    colorView.backgroundColor = COLOR_F0F0F0;
    [self addSubview:colorView];
    [colorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.offset(0);
        make.height.mas_equalTo(AUTO(8));
    }];
    
    UIView *iconView = [UIView new];
    iconView.backgroundColor = JCBaseColor;
    [self addSubview:iconView];
    [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.offset(AUTO(23));
        make.size.mas_equalTo(CGSizeMake(2, 16));
    }];

    UILabel *label = [UILabel initWithTitle:@"订单信息" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
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
    
    
    [self addSubview:self.articlecCountLab];
    [self.articlecCountLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(iconView.mas_bottom).offset(AUTO(18));
        make.left.offset(AUTO(15));
        make.height.mas_equalTo(AUTO(18));
    }];

    
    [self addSubview:self.benefitCountLab];
    [self.benefitCountLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.articlecCountLab.mas_bottom).offset(AUTO(8));
        make.left.offset(AUTO(15));
        make.height.mas_equalTo(AUTO(18));
    }];
    
    [self addSubview:self.dsCountLab];
    [self.dsCountLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.benefitCountLab.mas_bottom).offset(AUTO(8));
        make.left.offset(AUTO(15));
        make.height.mas_equalTo(AUTO(18));
    }];
    
    UIView *lineView1 = [UIView new];
    [self addSubview:lineView1];
    lineView1.backgroundColor = COLOR_F0F0F0;
    [lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.bottom.offset(0);
        make.height.mas_equalTo(0.5);
    }];
    

    
}


- (void)setModel:(JCMyGaoChouDetailModel *)model {
    _model = model;
    self.articlecCountLab.text = [NSString stringWithFormat:@"共发布 %@ 篇付费达人方案",model.tuijian_count];
    self.benefitCountLab.text = [NSString stringWithFormat:@"共获得收益提成 %@ 笔",model.sf_count];
    
    self.dsCountLab.text = [NSString stringWithFormat:@"共获得打赏收益 %@ 笔",model.ds_count];
    
 
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



- (UILabel *)benefitCountLab {
    if (!_benefitCountLab) {
        _benefitCountLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _benefitCountLab;
}


- (UILabel *)dsCountLab {
    if (!_dsCountLab) {
        _dsCountLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _dsCountLab;
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
