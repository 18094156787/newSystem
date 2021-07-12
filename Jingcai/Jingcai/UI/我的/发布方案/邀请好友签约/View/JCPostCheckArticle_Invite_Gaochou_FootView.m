//
//  JCPostCheckArticle_Invite_Gaochou_FootView.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/7/5.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCPostCheckArticle_Invite_Gaochou_FootView.h"

@implementation JCPostCheckArticle_Invite_Gaochou_FootView


- (void)initViews {
    UIView *lineView1 = [UIView new];
    [self addSubview:lineView1];
    lineView1.backgroundColor = COLOR_F0F0F0;
    [lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.offset(0);
        make.top.offset(0);
        make.height.mas_equalTo(1);
    }];
    
    
    self.backgroundColor = JCWhiteColor;
    UILabel *infoLab = [UILabel initWithTitle:@"请认真查看并核对您的稿酬信息，若无异议，可同意稿酬配置并提交审核！" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:0];
    infoLab.numberOfLines = 0;
    [self addSubview:infoLab];
    [infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.offset(30);
        make.right.offset(AUTO(-15));
    }];
    
    
    [self addSubview:self.agreeBtn];
    [self.agreeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(10));
        make.top.equalTo(infoLab.mas_bottom).offset(5);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    
    UILabel *label = [UILabel initWithTitle:@"我同意上述稿酬配置信息" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    [self addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.agreeBtn);
        make.right.offset(AUTO(-15));
        make.left.equalTo(self.agreeBtn.mas_right);
    }];
    
}

- (void)agreeBtnClick:(UIButton *)sender {
    sender.selected = !sender.selected;
}

- (UIButton *)agreeBtn {
    if (!_agreeBtn) {
        _agreeBtn = [UIButton new];
        [_agreeBtn setImage:JCIMAGE(@"login_choose_nor") forState:0];
        [_agreeBtn setImage:JCIMAGE(@"login_choose_sel") forState:UIControlStateSelected];
        [_agreeBtn addTarget:self action:@selector(agreeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _agreeBtn;
}

@end
