//
//  JCMyBuyDakaViewCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2019/8/16.
//  Copyright © 2019年 blockstar. All rights reserved.
//

#import "JCMyBuyDakaViewCell.h"
#import "JCFootBallAuthorDetailWMViewController.h"
@implementation JCMyBuyDakaViewCell


- (void)initViews {
    
    [self.contentView addSubview:self.ysImgView];
    [self.ysImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.offset(0);
        make.width.height.mas_equalTo(AUTO(40));
    }];
    
    [self.contentView addSubview:self.headImgView];
    [self.headImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.offset(AUTO(10));
        make.width.height.mas_equalTo(AUTO(36));
    }];
    
    [self.contentView addSubview:self.nameLab];
    [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headImgView.mas_right).offset(AUTO(5));
        make.top.equalTo(self.headImgView);
        make.height.mas_equalTo(AUTO(16));
    }];
    
    [self.contentView addSubview:self.tagLab];
    [self.tagLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headImgView.mas_right).offset(AUTO(5));
        make.top.equalTo(self.nameLab.mas_bottom).offset(AUTO(2));
        make.height.mas_equalTo(AUTO(14));
    }];
    
    [self.contentView insertSubview:self.userClickView atIndex:0];
    [self.userClickView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.offset(0);
        make.bottom.equalTo(self.headImgView);
        make.right.equalTo(self.nameLab);
    }];
    

    
    [self.contentView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.equalTo(self.headImgView.mas_bottom).offset(AUTO(10));
        make.right.offset(AUTO(-15));
    }];
    
    [self.contentView addSubview:self.refundLab];
     [self.refundLab mas_makeConstraints:^(MASConstraintMaker *make) {
         make.left.offset(AUTO(15));
         make.top.equalTo(self.titleLab.mas_bottom).offset(AUTO(10));
         make.height.mas_equalTo(AUTO(18));
     }];
    
    [self.contentView addSubview:self.timeLab];
    [self.timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.refundLab.mas_right).offset(AUTO(8));
        make.centerY.equalTo(self.refundLab);
        make.height.mas_equalTo(AUTO(18));
    }];
    
    [self.contentView addSubview:self.priceLab];
    [self.priceLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.timeLab);
        make.right.offset(AUTO(-15));
    }];
    
    UIView *lineView = [UIView new];
    lineView.backgroundColor = COLOR_DDDDDD;
    [self.contentView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.timeLab.mas_bottom).offset(AUTO(10));
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.height.mas_equalTo(0.5);
    }];
    self.lineView = lineView;
    
    [self.contentView addSubview:self.infoLab];
    [self.infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.top.equalTo(self.lineView.mas_bottom).offset(AUTO(10));
//        make.bottom.offset(AUTO(-10));
    }];
    
    UIView *lineView1= [UIView new];
    lineView1.backgroundColor = [COLOR_000000 colorWithAlphaComponent:0.06];
    [self.contentView addSubview:lineView1];
    [lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.top.equalTo(self.infoLab.mas_bottom).offset(AUTO(15));
        make.height.mas_equalTo(1);
    }];
    
    [self.contentView addSubview:self.priceView];
    [self.priceView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView1.mas_bottom).offset(AUTO(15));
        make.left.right.offset(0);
        make.height.mas_equalTo(AUTO(30));
        make.bottom.offset(AUTO(-5));
    }];
    
    [self.priceView addSubview:self.payPriceLab];
    [self.payPriceLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.offset(0);
    }];
    
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

    [self.userClickView bk_whenTapped:^{

        if (weakSelf.model.zctj_newtuijian_user_id.length==0) {
            return;
        }
        JCFootBallAuthorDetailWMViewController *vc = [JCFootBallAuthorDetailWMViewController new];
        vc.autherID = weakSelf.model.zctj_newtuijian_user_id;
        [[weakSelf getViewController].navigationController pushViewController:vc animated:YES];
    }];
    
    
}

- (void)setModel:(JCWTjInfoBall *)model {
    
    _model = model;

    NSString *title = [NSString stringWithFormat:@"%@",NonNil(model.zctj_newtuijian_title)];
    if (model.zctj_newtuijian_is_bd==1) {
        title = [NSString stringWithFormat:@"【补】%@",NonNil(model.zctj_newtuijian_title)];
    }

    NSMutableAttributedString *attrTitle = [[NSMutableAttributedString alloc] initWithString:title];
    NSRange range = [title rangeOfString:@"【补】"];
    if (range.location!=NSNotFound) {
        [attrTitle addAttribute:NSForegroundColorAttributeName value:JCBaseColor range:range];
    }
     self.titleLab.attributedText = attrTitle;

    
    BOOL isRefund = NO;//不中返还
    self.refundLab.text = @"";
    if ([model.zctj_newtuijian_refund integerValue]==1) {
        isRefund = YES;
    }
    BOOL isBudan = NO;//补单
    if ([model.zctj_newtuijian_refund integerValue]==2) {
        isBudan = YES;
    }
    self.ysImgView.hidden = [model.pre_sale integerValue]==1?NO:YES;
    
    if ([model.zctj_newtuijian_refund integerValue]>0) {
        if (isRefund) {
            self.refundLab.text = [NSString stringWithFormat:@"  %@  ",@"不中返还"];
            self.refundLab.textColor = JCBaseColor;
            self.refundLab.layer.borderColor = JCBaseColor.CGColor;
            self.refundLab.backgroundColor = [JCBaseColor colorWithAlphaComponent:0.1];
        }
        if (isBudan) {
            self.refundLab.text = [NSString stringWithFormat:@"  %@  ",@"不中补单"];
            self.refundLab.textColor = COLOR_F37E22;
            self.refundLab.layer.borderColor = COLOR_F37E22.CGColor;
            self.refundLab.backgroundColor = [COLOR_F37E22 colorWithAlphaComponent:0.1];
        }
        [self.timeLab mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.refundLab.mas_right).offset(AUTO(8));
            make.centerY.equalTo(self.refundLab);
            make.height.mas_equalTo(AUTO(18));
        }];
    }else{
        [self.timeLab mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.refundLab.mas_left);;
            make.centerY.equalTo(self.refundLab);
            make.height.mas_equalTo(AUTO(18));
        }];
//        [self.timeLab mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(self.refundLab.mas_left);
//        }];
        self.refundLab.text = @"";
    }
    
    
    self.tagLab.text = [NSString stringWithFormat:@"  %@  ",model.zctj_user_info_zhong];
    self.tagLab.hidden = model.zctj_user_info_zhong.length==0?YES:NO;
   

    [self.headImgView sd_setImageWithURL:[NSURL URLWithString:model.zucai_user_user_img] placeholderImage:JCIMAGE(@"userImg_default")];
    self.nameLab.text = model.zucai_user_user_name;

//    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[model.end_time floatValue]];
//    NSString *time = [date stringWithFormat:@"yyyy-MM-dd HH:mm"];
    self.timeLab.text = [NSString stringWithFormat:@"截止时间: %@",model.zctj_newtuijian_end_time];
    
    if ([model.zucai_order_refund_status integerValue]==4) {

        self.statusLab.text = @"已退款";
        self.statusLab.textColor  =COLOR_30B27A;
    }else {
        self.statusLab.text = @"正常";
        self.statusLab.textColor  =COLOR_999999;
    }
    
    if (model.zctj_newtuijian_zhong.length>0) {
        self.infoLab.textColor = JCBaseColor;
        self.infoLab.text = NonNil(model.zctj_newtuijian_zhong);
        self.lineView.hidden = NO;

    }else{
        self.infoLab.textColor = COLOR_30B27A;
        self.infoLab.text = @"待定";
        self.lineView.hidden = NO;
    }
    //原价
    NSString *ori_price = [NSString stringWithFormat:@"原价 %@",model.total_price];
    NSMutableAttributedString *ori_attr = [[NSMutableAttributedString alloc] initWithString:ori_price];
    NSRange ori_range = [ori_price rangeOfString:@"原价"];
    [ori_attr addAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(12)],NSForegroundColorAttributeName:COLOR_9F9F9F} range:ori_range];
    self.priceLab.attributedText = ori_attr;
    
    
    
    
    NSString *price = [NSString stringWithFormat:@"实付金额：%@",NonNil(model.zucai_order_pay_price)];
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:price];
    NSRange pay_range = [price rangeOfString:@"实付金额："];
    [attr addAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(12)]} range:pay_range];
    self.payPriceLab.attributedText = attr;
   
}


- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
        _titleLab.numberOfLines = 0;
    }
    return _titleLab;
}

- (UILabel *)timeLab {
    if (!_timeLab) {
        _timeLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _timeLab;
}


- (UIImageView *)headImgView {
    if (!_headImgView) {
        _headImgView = [UIImageView new];
        [_headImgView hg_setAllCornerWithCornerRadius:AUTO(18)];
    }return _headImgView;
}

- (UILabel *)nameLab {
    if (!_nameLab) {
        _nameLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _nameLab;
}

- (UILabel *)infoLab {
    if (!_infoLab) {
        _infoLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_FF4642 andBackgroundColor:JCClearColor andTextAlignment:0];
        _infoLab.numberOfLines = 0;
    }
    return _infoLab;
}


- (UIButton *)likeBtn {
    if (!_likeBtn) {
        _likeBtn = [UIButton initWithText:@"" FontSize:AUTO(12) Weight:1 BackGroundColor:JCClearColor TextColors:COLOR_999999];
    }
    return _likeBtn;
}

- (UIImageView *)likeImgView {
    if (!_likeImgView) {
        _likeImgView = [UIImageView new];
        _likeImgView.image = JCIMAGE(@"icon_dz_s_un");
    }
    return _likeImgView;
}

- (UILabel *)likeLab {
    if (!_likeLab) {
        _likeLab = [UILabel initWithTitle:@"点赞" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _likeLab;
}
- (UILabel *)refundLab {
    if (!_refundLab) {
        _refundLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:JCBaseColor andBackgroundColor:[JCBaseColor colorWithAlphaComponent:0.1] andTextAlignment:0];
        _refundLab.layer.cornerRadius = AUTO(8);
        _refundLab.layer.masksToBounds = YES;
        _refundLab.layer.borderWidth = 0.5;
        _refundLab.layer.borderColor = JCBaseColor.CGColor;
    }
    return _refundLab;
}

- (UILabel *)tagLab {
    if (!_tagLab) {
        _tagLab = [UILabel initWithTitle:@"" andFont:AUTO(10) andWeight:1 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:0];
        _tagLab.layer.borderColor = JCBaseColor.CGColor;
        _tagLab.layer.borderWidth = 0.5;
        _tagLab.layer.cornerRadius = AUTO(7);
        _tagLab.layer.masksToBounds = YES;
    }
    return _tagLab;
}
- (UIView *)userClickView {
    if (!_userClickView) {
        _userClickView = [UIView new];
    }
    return _userClickView;
}
- (UIImageView *)ysImgView {
    if (!_ysImgView) {
        _ysImgView = [UIImageView new];
        _ysImgView.image = JCIMAGE(@"ic_presale");
        _ysImgView.hidden = YES;
    }
    return _ysImgView;
}

- (UILabel *)priceLab {
    if (!_priceLab) {
        _priceLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:2 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentRight];
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
