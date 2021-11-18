//
//  JCKellyDataModelDetailInfoCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/12.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCKellyDataModelDetailInfoCell.h"

@implementation JCKellyDataModelDetailInfoCell

- (void)initViews {
    [self.contentView addSubview:self.bgView];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(16));
        make.right.offset(AUTO(-16));
        make.top.offset(AUTO(AUTO(10)));
        make.bottom.offset(AUTO(-8));
//        make.bottom.offset(AUTO(-20));
//        make.height.mas_equalTo(100);
    }];
    
    self.bgView.layer.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0].CGColor;
    self.bgView.layer.cornerRadius = 8;
    self.bgView.layer.shadowColor = [UIColor colorWithRed:78/255.0 green:83/255.0 blue:99/255.0 alpha:0.16].CGColor;
    self.bgView.layer.shadowOffset = CGSizeMake(0,8);
    self.bgView.layer.shadowOpacity = 1;
    self.bgView.layer.shadowRadius = 16;
    
    [self.contentView addSubview:self.chuView];
    [self.chuView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.offset(AUTO(10));
        make.right.offset(AUTO(-15));
        make.height.mas_equalTo(AUTO(70));
    }];
    
    UIView *lineView1 = [UIView new];
    lineView1.backgroundColor = UIColorFromRGB(0xE8E8E8);
    [self.contentView addSubview:lineView1];
    [lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(24));
        make.right.offset(AUTO(-24));
        make.top.equalTo(self.chuView.mas_bottom).offset(AUTO(12));
        make.height.mas_equalTo(1);
    }];
    
    [self.contentView addSubview:self.jiView];
    [self.jiView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView1.mas_bottom).offset(0);
        make.left.right.equalTo(self.chuView);
        make.height.mas_equalTo(AUTO(70));
    }];
    
    [self.contentView addSubview:self.historyLab];
    [self.historyLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-24));
        make.left.offset(AUTO(24));
        make.top.equalTo(self.jiView.mas_bottom).offset(AUTO(10));
        make.bottom.equalTo(self.contentView).offset(AUTO(-20));
    }];
}

- (void)setModel:(JCKellyDataDetailModel *)model {
    _model = model;
    NSString *title = [NSString stringWithFormat:@"查询到%ld条赔率数据；已完成凯利指数数据运算",model.company_num];
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:title];
    NSRange range = [title rangeOfString:[NSString stringWithFormat:@"%ld",model.company_num]];
    if (range.location!=NSNotFound) {
        [attr addAttributes:@{NSForegroundColorAttributeName:COLOR_EF2F2F} range:range];
    }
    self.historyLab.attributedText = attr;
    
    self.chuView.model  = model.odds_index.begin_odds;
    self.jiView.chuModel = model.odds_index.begin_odds;
    self.jiView.model = model.odds_index.last_odds;
}



- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [UIView new];
        _bgView.backgroundColor = JCWhiteColor;
//        [_bgView hg_setAllCornerWithCornerRadius:8];
    }
    return _bgView;
}

- (JCKellyDataModelOpenRateView *)chuView {
    if (!_chuView) {
        _chuView = [JCKellyDataModelOpenRateView new];
    }
    return _chuView;
}

- (JCKellyDataModelOpenRateView *)jiView {
    if (!_jiView) {
        _jiView = [JCKellyDataModelOpenRateView new];
        _jiView.is_jp = YES;
    }
    return _jiView;
}

- (KKPaddingLabel *)historyLab {
    if (!_historyLab) {
        _historyLab = [KKPaddingLabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:UIColorFromRGB(0x606062) andBackgroundColor:UIColorFromRGB(0xF5F5F5) andTextAlignment:0];
        _historyLab.numberOfLines = 0;
        _historyLab.layer.cornerRadius = 4;
        _historyLab.layer.masksToBounds = YES;
        _historyLab.padding = UIEdgeInsetsMake(4, 8, 4, 8);
    }
    return _historyLab;
}
@end
