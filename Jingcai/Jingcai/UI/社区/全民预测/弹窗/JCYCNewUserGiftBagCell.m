//
//  JCYCNewUserGiftBagCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/4/20.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCYCNewUserGiftBagCell.h"

@implementation JCYCNewUserGiftBagCell

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
//        make.height.mas_equalTo(AUTO(15));
    }];
    
    [self data];
}


- (void)setModel:(JCActivityRedPacketModel *)model {
    _model = model;
    self.titleLab.text = model.name;
    self.timeLab.text = [NSString stringWithFormat:@"· %@",model.time];
    self.contentLab.text = [NSString stringWithFormat:@"· %@",model.scope];
    if ([model.number integerValue]>0) {
        NSString *string = [NSString stringWithFormat:@"%@ 张",model.number];
        NSRange range = [string rangeOfString:@"张"];
        NSMutableAttributedString *attr =
        [[NSMutableAttributedString alloc] initWithString:string];
        [attr addAttributes:@{NSForegroundColorAttributeName: COLOR_A9A9A9, NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Regular" size:12]} range:range];
        self.countLab.attributedText = attr;
    }
}

- (void)setFirstLoginModel:(JCActivityRedPacketModel *)firstLoginModel {
    _firstLoginModel = firstLoginModel;
    NSString *title = [NSString stringWithFormat:@"%@%@元",NonNil(firstLoginModel.name),NonNil(firstLoginModel.total)];
    self.titleLab.text = title;
    self.timeLab.text = firstLoginModel.time;
    self.contentLab.text = firstLoginModel.scope;
    if ([firstLoginModel.number integerValue]>0) {
        NSString *string = [NSString stringWithFormat:@"%@ 张",firstLoginModel.number];
        NSRange range = [string rangeOfString:@"张"];
        NSMutableAttributedString *attr =
        [[NSMutableAttributedString alloc] initWithString:string];
        [attr addAttributes:@{NSForegroundColorAttributeName: COLOR_A9A9A9, NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Regular" size:12]} range:range];
        self.countLab.attributedText = attr;
    }
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
        _countLab = [UILabel initWithTitle:@"" andFont:AUTO(28) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _countLab;
}


@end

