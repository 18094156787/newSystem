//
//  JCYuCeCashHongBaoViewCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/3/30.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCYuCeCashHongBaoViewCell.h"

@implementation JCYuCeCashHongBaoViewCell

- (void)initViews {
    self.backgroundColor = JCClearColor;
   
    [self.contentView addSubview:self.bgView];
    [self.bgView hg_setAllCornerWithCornerRadius:AUTO(5)];
    self.bgView.backgroundColor = JCWhiteColor;
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(AUTO(126));
        make.edges.insets(UIEdgeInsetsMake(AUTO(12), AUTO(12), 0, AUTO(12)));
    }];
    
    [self.bgView addSubview:self.infoLab];
    [self.infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.offset(0);
        make.height.mas_equalTo(AUTO(20));
        make.width.mas_greaterThanOrEqualTo(AUTO(88));
    }];
    
    
    [self.bgView addSubview:self.priceLab];
    [self.priceLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.top.equalTo(self.infoLab.mas_bottom).offset(AUTO(12));
        make.width.mas_equalTo(AUTO(90));
    }];
    

    

    
//    UIView *lineView = [UIView new];
//    lineView.backgroundColor = COLOR_F2F2F2;
//    [self.bgView addSubview:lineView];
//    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.offset(AUTO(20));
//        make.bottom.offset(AUTO(-20));
//        make.left.equalTo(self.priceLab.mas_right);
//        make.width.mas_equalTo(1);
//    }];
    
    [self.bgView addSubview:self.contentLab1];
    [self.contentLab1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.priceLab.mas_right).offset(AUTO(10));
        make.top.offset(AUTO(20));
        make.right.offset(AUTO(-5));
        make.height.mas_equalTo(AUTO(20));
    }];
    
    [self.bgView addSubview:self.contentLab2];
    [self.contentLab2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentLab1);
        make.top.equalTo(self.contentLab1.mas_bottom);
        make.right.offset(AUTO(-5));
        make.height.mas_greaterThanOrEqualTo(AUTO(20));
    }];
    
    [self.bgView addSubview:self.contentLab3];
    [self.contentLab3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentLab1);
        make.top.equalTo(self.contentLab2.mas_bottom);
        make.right.offset(AUTO(-5));
        make.right.offset(AUTO(-120));
    }];
    
    [self.bgView addSubview:self.withDrawBtn];
    [self.withDrawBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-12));
        make.bottom.offset(AUTO(-8));
        make.size.mas_equalTo(CGSizeMake(AUTO(60), AUTO(24)));
    }];
    
    [self.bgView addSubview:self.withDrawView];
    [self.withDrawView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-12));
        make.bottom.offset(AUTO(-8));
        make.size.mas_equalTo(CGSizeMake(AUTO(100), AUTO(24)));
    }];
    
    [self.bgView addSubview:self.detailBtn];
    [self.detailBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(8));
        make.bottom.offset(AUTO(-8));
        make.size.mas_equalTo(CGSizeMake(AUTO(60), AUTO(24)));
    }];
    
    WeakSelf;
    [self.withDrawBtn bk_whenTapped:^{
        if (weakSelf.JCWithDrawBlock) {
            weakSelf.JCWithDrawBlock();
        }
    }];
    
    [self.withDrawView bk_whenTapped:^{
        if (weakSelf.JCWithDrawBlock) {
            weakSelf.JCWithDrawBlock();
        }
    }];
}

- (void)setModel:(JCJingCaiHongbaoInfoModel *)model {
    _model = model;
    NSString *price = [NSString stringWithFormat:@"¥ %@",@([model.total floatValue])];
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:price];
    NSRange range = [price rangeOfString:@"¥"];
    if (range.location!=NSNotFound) {
        [attr addAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(12)]} range:range];
    }
    self.priceLab.attributedText = attr;
    self.infoLab.text = model.title.length>0?[NSString stringWithFormat:@"  %@  ",model.title]:@"现金红包";
    self.contentLab1.text = [NSString stringWithFormat:@"%@",model.scope];
    self.contentLab2.text = @"限本账户用户使用";
    self.contentLab3.text = @"每张仅提现 1 次";
    
    if (model.desc.length>0) {
//        self.contentLab1.text = @"使用范围";
        self.contentLab2.text = model.desc;
        self.contentLab3.text = @"";
    }

    if ([model.status intValue]==1) {
        self.bgView.alpha = 1;
        self.bgView.image = JCIMAGE(@"hb_ticket_nor_new");
        self.withDrawBtn.userInteractionEnabled = YES;
        [self.withDrawBtn setTitleColor:COLOR_EF2F2F forState:0];
         self.withDrawBtn.layer.borderColor = JCBaseColor.CGColor;
        self.detailBtn.hidden = YES;
        if (model.use==1) {
            if (model.withdraw==0) {
                self.withDrawBtn.hidden = NO;
                [self.withDrawBtn setTitle:@"去提现" forState:0];
                self.withDrawView.hidden = YES;
            }else if (model.withdraw==1) {
                self.withDrawBtn.hidden = YES;
                self.withDrawView.infoLab.text = @"提现中";
                self.withDrawView.hidden = NO;
            }else if (model.withdraw==2) {
                self.detailBtn.hidden = NO;
                self.withDrawBtn.hidden = YES;
                self.withDrawView.infoLab.text = @"查看详情";
                self.withDrawView.hidden = NO;
            }else{
                self.withDrawBtn.hidden = NO;
                self.withDrawView.hidden = YES;
            }
            
        }
        if (model.use==2) {
            self.withDrawBtn.hidden = YES;
            self.withDrawView.infoLab.text = @"已提现";
            self.withDrawView.hidden = NO;
            

        }
        if (model.use==3) {
            [self.withDrawBtn setTitle:@"已过期" forState:0];
            self.withDrawBtn.userInteractionEnabled = NO;
            self.withDrawView.hidden = YES;

        }
        if (model.use==4) {
            self.withDrawBtn.hidden = YES;
            self.detailBtn.hidden = NO;
            self.withDrawView.infoLab.text = @"查看详情";
            self.withDrawView.hidden = NO;
        }
        
    }else{
        self.withDrawView.hidden = YES;
        self.detailBtn.hidden = YES;
        self.withDrawBtn.hidden = NO;
        [self.withDrawBtn setTitle:@"已过期" forState:0];
        self.bgView.alpha = 0.6;
        self.bgView.image = JCIMAGE(@"hb_ticket_dis_new");
        self.withDrawBtn.userInteractionEnabled = NO;
        [self.withDrawBtn setTitleColor:COLOR_C3B5AB forState:0];
        self.withDrawBtn.layer.borderColor = COLOR_C3B5AB.CGColor;
    }
 
    
}

- (UILabel *)priceLab {
    if (!_priceLab) {
        _priceLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:0 andTextColor:COLOR_EF2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _priceLab.font = [UIFont fontWithName:@"PingFangSC-Semibold" size:AUTO(24)];
    }
    return _priceLab;
}

- (UILabel *)infoLab {
    if (!_infoLab) {
        _infoLab = [UILabel initWithTitle:@"" andFont:AUTO(10) andWeight:1 andTextColor:JCBaseColor andBackgroundColor:COLOR_FFC6C6 andTextAlignment:NSTextAlignmentCenter];
        [_infoLab hg_setCornerOnLeftTopAndBottomRightWithRadius:5];
    }
    return _infoLab;
}

- (UILabel *)contentLab1 {
    if (!_contentLab1) {
        _contentLab1 = [UILabel initWithTitle:@"" andFont:AUTO(10) andWeight:0 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:0];
        _contentLab1.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(12)];
        _contentLab1.numberOfLines = 0;
    }
    return _contentLab1;
}

- (UILabel *)contentLab2 {
    if (!_contentLab2) {
        _contentLab2 = [UILabel initWithTitle:@"" andFont:AUTO(10) andWeight:0 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:0];
        _contentLab2.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(12)];
        _contentLab2.numberOfLines = 0;
    }
    return _contentLab2;
}

- (UILabel *)contentLab3 {
    if (!_contentLab3) {
        _contentLab3 = [UILabel initWithTitle:@"" andFont:AUTO(10) andWeight:0 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:0];
        _contentLab3.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(12)];
        _contentLab3.numberOfLines = 0;
    }
    return _contentLab3;
}

- (UIButton *)withDrawBtn {
    if (!_withDrawBtn) {
        _withDrawBtn = [UIButton initWithText:@"去提现" FontSize:0 BackGroundColor:JCClearColor TextColor:COLOR_EF2F2F];
        _withDrawBtn.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(12)];
        _withDrawBtn.layer.cornerRadius = AUTO(12);
        _withDrawBtn.layer.masksToBounds = YES;
        _withDrawBtn.layer.borderColor = JCClearColor.CGColor;
        _withDrawBtn.layer.borderWidth = 1;
    }
    return _withDrawBtn;;
}

- (UIButton *)detailBtn {
    if (!_detailBtn) {
        _detailBtn = [UIButton initWithText:@"提现失败" FontSize:0 BackGroundColor:JCClearColor TextColor:COLOR_EF2F2F];
        _detailBtn.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(12)];
    }
    return _detailBtn;;
}

- (UIImageView *)bgView {
    if (!_bgView) {
        _bgView = [UIImageView new];
        _bgView.userInteractionEnabled = YES;
    }
    return _bgView;
}

- (JCYuCeCashHongBaoStatusView *)withDrawView {
    if (!_withDrawView) {
        _withDrawView = [JCYuCeCashHongBaoStatusView new];
    }
    return _withDrawView;
}

@end


@implementation JCYuCeCashHongBaoStatusView

- (void)initViews {
    [self addSubview:self.indicateImgView];
    [self.indicateImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(0);
        make.centerY.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(AUTO(14), AUTO(14)));
    }];
    
    [self addSubview:self.infoLab];
    [self.infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.indicateImgView.mas_left).offset(-3);
        make.centerY.equalTo(self);
    }];
}
- (UILabel *)infoLab {
    if (!_infoLab) {
        _infoLab = [UILabel initWithTitle:@"提现中" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_F2A15E andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _infoLab;
}

- (UIImageView *)indicateImgView {
    if (!_indicateImgView) {
        _indicateImgView = [UIImageView new];
        _indicateImgView.image = JCIMAGE(@"ic_hb_detail");
        _indicateImgView.userInteractionEnabled = YES;
    }
    return _indicateImgView;
}
@end
