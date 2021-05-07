//
//  JCWithDrawRecordCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/8/31.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCWithDrawRecordCell.h"

@implementation JCWithDrawRecordCell

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
    
    [bgView addSubview:self.timeLab];
    [self.timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(12));
        make.top.equalTo(self.titleLab.mas_bottom).offset(AUTO(4));
        make.right.offset(AUTO(-70));
    }];
    
    [bgView addSubview:self.moneyLab];
    [self.moneyLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(0);
        make.centerY.equalTo(self.titleLab);
        make.width.mas_equalTo(AUTO(70));
    }];
    
    [bgView addSubview:self.statusLab];
    [self.statusLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(0);
        make.centerY.equalTo(self.timeLab);
        make.width.mas_equalTo(AUTO(70));
    }];
    
    
}

- (void)setModel:(JCWithdrawalModel *)model {
    _model = model;
    self.titleLab.text = model.title;
    self.timeLab.text = model.created_at;
    self.moneyLab.text = model.total;
    if ([model.audit_status_id integerValue]==1||[model.audit_status_id integerValue]==4) {
        self.statusLab.textColor = JCBaseColor;
    }else if([model.audit_status_id integerValue]==2){
        self.statusLab.textColor = COLOR_13AE13;
    }else {
        self.statusLab.textColor = COLOR_999999;//
    }
    self.statusLab.text = model.audit_status;

    
}




- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(15) andWeight:1 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _titleLab;
}

- (UILabel *)timeLab {
    if (!_timeLab) {
        _timeLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _timeLab;
}

- (UILabel *)moneyLab {
    if (!_moneyLab) {
        _moneyLab = [UILabel initWithTitle:@"" andFont:AUTO(15) andWeight:2 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _moneyLab;
}

- (UILabel *)statusLab {
    if (!_statusLab) {
        _statusLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _statusLab;
}

@end
