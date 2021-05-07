//
//  JCUserLoginRedPacketViewCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/11.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCUserLoginRedPacketViewCell.h"

@implementation JCUserLoginRedPacketViewCell

- (void)initViews {
    self.backgroundColor = JCClearColor;
    
    UIView *bgView = [UIView new];
    bgView.backgroundColor = JCWhiteColor;
    [bgView hg_setAllCornerWithCornerRadius:12];
    [self.contentView addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(AUTO(10), AUTO(15), 0, AUTO(15)));
    }];
    
    [bgView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(10));
        make.left.offset(AUTO(17));
        make.right.offset(AUTO(-15));
        make.height.mas_equalTo(AUTO(20));
    }];
    
    [bgView addSubview:self.timeLab];
    [self.timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLab.mas_bottom).offset(AUTO(5));
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.height.mas_equalTo(AUTO(15));
    }];

    [bgView addSubview:self.contentLab];
    [self.contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.timeLab.mas_bottom).offset(AUTO(5));
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.height.mas_equalTo(AUTO(15));
    }];
    
    [bgView addSubview:self.countLab];
    [self.countLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(bgView);
        make.right.offset(AUTO(-15));
        make.size.mas_equalTo(CGSizeMake(AUTO(74), AUTO(30)));
    }];
    
}

- (void)setModel:(JCActivityRedPacketModel *)model {
    _model = model;
    
    NSString *title = [NSString stringWithFormat:@"¥ %@ %@",NonNil(model.total),NonNil(model.name)];
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:title];
    NSRange price_range = [title rangeOfString:@"¥"];
    [attr addAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(10)]} range:price_range];
    if (model.name.length>0) {
        NSRange range = [title rangeOfString:model.name];
        [attr addAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(10)]} range:range];
    }
    self.titleLab.attributedText = attr;
    self.timeLab.text = model.time;
    self.contentLab.text = model.scope;
    self.countLab.text = [NSString stringWithFormat:@"%@张",model.number];

}

- (void)setPp_Model:(JCActivityRedPacketModel *)pp_Model {
    _pp_Model = pp_Model;
//    self.titleLab.text = pp_Model.name;
    NSString *title = [NSString stringWithFormat:@"¥ %@ %@",NonNil(pp_Model.total),NonNil(pp_Model.name)];
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:title];
    NSRange price_range = [title rangeOfString:@"¥"];
    [attr addAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(10)]} range:price_range];
    if (pp_Model.name.length>0) {
        NSRange range = [title rangeOfString:pp_Model.name];
        [attr addAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(10)]} range:range];
    }
    self.titleLab.attributedText = attr;
    self.timeLab.text = pp_Model.time;
    self.contentLab.text = pp_Model.scope;
    self.countLab.text = [NSString stringWithFormat:@"%@张",pp_Model.number];
//    if ([model.number integerValue]>0) {
//        NSString *string = [NSString stringWithFormat:@"%@张",model.number];
//        NSRange range = [string rangeOfString:model.number];
//        NSMutableAttributedString *attr =
//        [[NSMutableAttributedString alloc] initWithString:@"张"];
//        [attr addAttributes:@{NSForegroundColorAttributeName: COLOR_A9A9A9, NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Regular" size:12]} range:range];
//        self.countLab.attributedText = attr;
//    }
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(16) andWeight:3 andTextColor:COLOR_EF2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _titleLab;
}

- (UILabel *)timeLab {
    if (!_timeLab) {
        _timeLab = [UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _timeLab;
}

- (UILabel *)contentLab {
    if (!_contentLab) {
        _contentLab = [UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _contentLab;
}

- (UILabel *)countLab {
    if (!_countLab) {
        _countLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _countLab.layer.borderColor = JCBaseColor.CGColor;
        _countLab.layer.borderWidth = 1;
        _countLab.layer.masksToBounds = YES;
        _countLab.layer.cornerRadius = AUTO(15);
    }
    return _countLab;
}
@end
