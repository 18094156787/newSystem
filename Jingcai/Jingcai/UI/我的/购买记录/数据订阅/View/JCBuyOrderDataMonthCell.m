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
//        make.bottom.offset(AUTO(-10));
    }];
    
    [self.contentView addSubview:self.priceView];
    [self.priceView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bgView.mas_bottom).offset(AUTO(8));
        make.left.right.offset(0);
        make.height.mas_equalTo(AUTO(30));
        make.bottom.offset(AUTO(-5));
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
    
    [self.priceView addSubview:self.payPriceLab];
    [self.payPriceLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.offset(0);
    }];
//
    [self.priceView addSubview:self.statusLab];
    [self.statusLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.payPriceLab.mas_right).offset(AUTO(40));
        make.top.offset(0);
    }];

    [self.priceView addSubview:self.indicateImgView];
    [self.indicateImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-15));
        make.centerY.equalTo(self.payPriceLab);
        make.size.mas_equalTo(CGSizeMake(AUTO(5), AUTO(10)));
    }];

    [self.priceView addSubview:self.orderDetailLab];
    [self.orderDetailLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.indicateImgView.mas_left).offset(-3);
        make.centerY.equalTo(self.indicateImgView);
    }];

    WeakSelf;
    [self.orderDetailLab bk_whenTapped:^{
        if (weakSelf.JCBlock) {
            weakSelf.JCBlock();
        }
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

    
    //原价
    NSString *ori_price = [NSString stringWithFormat:@"原价 %@",@"40"];
    NSMutableAttributedString *ori_attr = [[NSMutableAttributedString alloc] initWithString:ori_price];
    NSRange ori_range = [ori_price rangeOfString:@"原价"];
    [ori_attr addAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(10)],NSForegroundColorAttributeName:COLOR_9F9F9F} range:ori_range];
    self.priceLab.attributedText = ori_attr;
    
    
    
    
    NSString *price = [NSString stringWithFormat:@"实付金额：%@红币",NonNil(model.pay_price)];
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:price];
    NSRange range = [price rangeOfString:@"实付金额："];
    [attr addAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(12)]} range:range];
    self.payPriceLab.attributedText = attr;
    
    self.statusLab.text = @"已退款";
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
        [_headImgView hg_setAllCornerWithCornerRadius:4];
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
        _priceLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:2 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentRight];
    }
    return _priceLab;
}
- (UIView *)priceView {
    if (!_priceView) {
        _priceView = [UIView new];
    }
    return _priceView;
}

- (UILabel *)payPriceLab {
    if (!_payPriceLab) {
        _payPriceLab = [UILabel initWithTitle:@"" andFont:AUTO(13) andWeight:2 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _payPriceLab;
}

- (UILabel *)statusLab {
    if (!_statusLab) {
        _statusLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_30B27A andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _statusLab;
}

- (UILabel *)orderDetailLab {
    if (!_orderDetailLab) {
        _orderDetailLab = [UILabel initWithTitle:@"订单详情" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:0];
        _orderDetailLab.userInteractionEnabled = YES;
    }
    return _orderDetailLab;
}
- (UIImageView *)indicateImgView {
    if (!_indicateImgView) {
        _indicateImgView = [UIImageView new];
        _indicateImgView.image = JCIMAGE(@"common_arrow_right");
    }
    return _indicateImgView;
}
@end
