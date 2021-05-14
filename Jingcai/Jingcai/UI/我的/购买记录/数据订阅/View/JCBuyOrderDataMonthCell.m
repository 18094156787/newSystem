//
//  JCBuyOrderDataMonthCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/27.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBuyOrderDataMonthCell.h"

@implementation JCBuyOrderDataMonthCell

- (void)initViews {
    [self.contentView addSubview:self.titleInfoLab];
    [self.titleInfoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.offset(AUTO(12));
        make.height.mas_equalTo(AUTO(25));
    }];
    
    [self.contentView addSubview:self.timeLab];
    [self.timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-15));
        make.centerY.equalTo(self.titleInfoLab);
    }];
    
    [self.contentView addSubview:self.bgView];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.top.equalTo(self.titleInfoLab.mas_bottom).offset(AUTO(15));
        make.right.offset(0);
        make.height.mas_equalTo(AUTO(100));
        make.bottom.offset(AUTO(-10));
    }];
    


    
    [self.bgView addSubview:self.headImgView];
    [self.headImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.offset(0);
        make.size.mas_equalTo(CGSizeMake(AUTO(120), AUTO(90)));
    }];
    
    [self.bgView addSubview:self.contentLab];
    [self.contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headImgView);
        make.left.equalTo(self.headImgView.mas_right).offset(AUTO(10));
        make.right.offset(AUTO(-10));
    }];
    
    [self.bgView addSubview:self.countLab];
    [self.countLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headImgView.mas_right).offset(AUTO(10));
        make.bottom.equalTo(self.headImgView);
        
    }];
    
    [self.bgView addSubview:self.priceLab];
    [self.priceLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-15));
        make.bottom.equalTo(self.headImgView);
    }];
    
}

- (void)setModel:(JCMyBuyOrderDataModel *)model {
    _model = model;
    self.titleInfoLab.text = model.style_desc;
    if ([model.distance_day intValue]>0) {
        NSString *title = [NSString stringWithFormat:@"到期时间剩余%@天",model.distance_day];
        NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:title];
        NSRange range = [title rangeOfString:model.distance_day];
        if (range.location!=NSNotFound) {
            [attr addAttribute:NSForegroundColorAttributeName value:JCBaseColor range:range];
        }
        self.timeLab.attributedText = attr;
    }else{
        self.timeLab.text = @"已过期";
    }
    [self.headImgView sd_setImageWithURL:[NSURL URLWithString:model.logo]];
    self.contentLab.text = model.title;
//    self.countLab.text = [NSString stringWithFormat:@"共%@人购买",model.user_count];
    self.priceLab.text = [NSString stringWithFormat:@"实付金额：%@红币",model.pay_price];
}

- (UILabel *)titleInfoLab {
    if (!_titleInfoLab) {
        _titleInfoLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _titleInfoLab;
}

- (UILabel *)timeLab {
    if (!_timeLab) {
        _timeLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_000000 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _timeLab;
}

- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [UIView new];
    }
    return _bgView;
}

- (UIImageView *)headImgView {
    if (!_headImgView) {
        _headImgView = [UIImageView new];
    }
    return _headImgView;
}

- (UILabel *)contentLab {
    if (!_contentLab) {
        _contentLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
        _contentLab.numberOfLines= 3;
    }
    return _contentLab;
}

- (UILabel *)countLab {
    if (!_countLab) {
        _countLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _countLab;
}

- (UILabel *)priceLab {
    if (!_priceLab) {
        _priceLab = [UILabel initWithTitle:@"" andFont:AUTO(13) andWeight:1 andTextColor:[COLOR_000000 colorWithAlphaComponent:0.6] andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _priceLab;
}

- (UILabel *)orderDetailLab {
    if (!_orderDetailLab) {
        _orderDetailLab = [UILabel initWithTitle:@"订单详情" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _orderDetailLab.layer.borderColor= COLOR_DDDDDD.CGColor;
        _orderDetailLab.layer.borderWidth = 0.5;
        _orderDetailLab.layer.cornerRadius = 2;
        _orderDetailLab.layer.masksToBounds = YES;
    }
    return _orderDetailLab;
}
@end
