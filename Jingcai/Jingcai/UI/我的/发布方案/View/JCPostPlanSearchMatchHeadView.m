//
//  JCPostPlanSearchMatchHeadView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/8/21.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCPostPlanSearchMatchHeadView.h"
#import "JCPostPeiLvRuleView.h"
@implementation JCPostPlanSearchMatchHeadView

- (void)initViews {
    self.backgroundColor = JCWhiteColor;
    [self addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.centerY.equalTo(self);
        make.width.mas_equalTo(AUTO(80));
    }];
    
    [self addSubview:self.contentTF];
    [self.contentTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLab.mas_right).offset(AUTO(5));
        make.centerY.equalTo(self);
        make.right.offset(AUTO(-60));
        make.height.mas_equalTo(AUTO(25));
    }];
    
    [self addSubview:self.ruleBtn];
    [self.ruleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.right.offset(AUTO(-15));
        make.width.height.mas_equalTo(AUTO(30));
    }];
    
    WeakSelf;
    [self.contentTF.rac_textSignal subscribeNext:^(id x) {
        if (weakSelf.JCContentBlock) {
            weakSelf.JCContentBlock(x);
        }
    }];
    
    
}

- (void)ruleBtnClick {
    JCPostPeiLvRuleView *ruleView = [JCPostPeiLvRuleView new];
    ruleView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    if ((SCREEN_WIDTH<=375)) {
        ruleView.frame = CGRectMake(0, -kNavigationBarHeight+10, SCREEN_WIDTH, SCREEN_HEIGHT+kNavigationBarHeight);
    }
    [[UIApplication sharedApplication].keyWindow addSubview:ruleView];
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"筛选比赛" andFont:AUTO(16) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];

    }
    return _titleLab;
}

- (UITextField *)contentTF {
    if (!_contentTF) {
        _contentTF = [UITextField new];
        _contentTF.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(14)];
        _contentTF.placeholder = @"例如：欧冠  皇马";
    }
    return _contentTF;
}

- (UIButton *)ruleBtn {
    if (!_ruleBtn) {
        _ruleBtn = [UIButton new];
        [_ruleBtn setImage:JCIMAGE(@"post_rule_icon") forState:0];
        [_ruleBtn setImage:JCIMAGE(@"post_rule_icon") forState:UIControlStateHighlighted];
        [_ruleBtn addTarget:self action:@selector(ruleBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _ruleBtn;
}

@end
