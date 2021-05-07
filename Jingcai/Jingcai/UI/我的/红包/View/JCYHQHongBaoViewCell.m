//
//  JCYHQHongBaoViewCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/11.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCYHQHongBaoViewCell.h"

@implementation JCYHQHongBaoViewCell

- (void)initViews {
    self.backgroundColor = JCClearColor;

    self.bgView.userInteractionEnabled = YES;
    [self.contentView addSubview:self.bgView];
    [self.bgView hg_setAllCornerWithCornerRadius:AUTO(12)];
    self.bgView.image = JCIMAGE(@"jc_yc_hongbaoBg");
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
    
    [self.bgView addSubview:self.contentLab_m];
    [self.contentLab_m mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.priceLab.mas_bottom).offset(AUTO(2));
        make.centerX.equalTo(self.priceLab);
    }];

    [self.bgView addSubview:self.contentLab2];
    [self.contentLab2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(90));
        make.top.offset(AUTO(20));
        make.height.mas_equalTo(AUTO(20));
        make.right.offset(AUTO(-5));
    }];
    
//    [self.bgView addSubview:self.contentLab_m];
//    [self.contentLab_m mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.timeLab);
//        make.top.equalTo(self.contentLab2.mas_bottom);
//        make.height.mas_equalTo(AUTO(20));
//        make.right.offset(AUTO(-100));
//    }];
    

    [self.bgView addSubview:self.contentLab3];
    [self.contentLab3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentLab2);
        make.top.equalTo(self.contentLab2.mas_bottom);
        make.height.mas_greaterThanOrEqualTo(AUTO(20));
        make.right.offset(AUTO(-5));
    }];
    

    
    [self.bgView addSubview:self.contentLab4];
    [self.contentLab4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentLab2);
        make.top.equalTo(self.contentLab3.mas_bottom);
        make.height.mas_equalTo(AUTO(20));
        make.right.offset(AUTO(-5));
//        make.bottom.equalTo(self.contentView).offset(AUTO(-10));
    }];
    

    
    [self.bgView addSubview:self.timeLab];
    [self.timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(12));
        make.bottom.offset(AUTO(-12));
        make.height.mas_equalTo(AUTO(17));
    }];
    
    [self.bgView addSubview:self.statusLab];
    [self.statusLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.timeLab);
        make.right.offset(AUTO(-12));
        make.size.mas_equalTo(CGSizeMake(AUTO(60), AUTO(24)));
    }];
    

}



- (void)setYhqModel:(JCJingCaiHongbaoInfoModel *)yhqModel {
    _yhqModel = yhqModel;
    self.priceLab.text = [NSString stringWithFormat:@"¥ %@",@([yhqModel.total floatValue]/100)];;
    self.infoLab.text = [NSString stringWithFormat:@"  %@  ",NonNil(yhqModel.title)];
    self.timeLab.text = [NSString stringWithFormat:@"%@",yhqModel.time];
    self.contentLab2.text = [NSString stringWithFormat:@"%@",yhqModel.scope];
    self.contentLab_m.text = [NSString stringWithFormat:@"%@",yhqModel.condition];
    self.contentLab3.text = @"购买方案超出部分不找零";
    self.contentLab4.text = @"不可提现或转赠";
    
    if (yhqModel.desc.length>0) {
        self.contentLab2.text = yhqModel.scope;
        self.contentLab3.text = yhqModel.desc;
        self.contentLab4.text = @"";
    }

    
    if ([yhqModel.status intValue]==1) {
        if (yhqModel.use==1) {
            self.bgView.image = JCIMAGE(@"hb_ticket_nor_new");
            self.statusLab.textColor = JCBaseColor;
            self.statusLab.layer.borderColor = JCBaseColor.CGColor;
            self.statusLab.userInteractionEnabled = YES;
            self.bgView.alpha = 1;
            self.statusLab.text = @"去使用";
//            self.timeLab.textColor = COLOR_F2A15E;
        }
        else{
            if (yhqModel.use==2) {
                self.statusLab.text = @"已使用";
            }
            if (yhqModel.use==3) {
                self.statusLab.text = @"已过期";
            }
//            self.timeLab.textColor = COLOR_F2A15E;
            self.bgView.alpha = 0.6;
            self.bgView.image = JCIMAGE(@"hb_ticket_dis_new");
            self.statusLab.textColor = COLOR_C3B5AB;
            self.statusLab.layer.borderColor = COLOR_C3B5AB.CGColor;
        }

    }else{
        self.bgView.alpha = 0.6;
        self.statusLab.text = @"已过期";
        self.bgView.image = JCIMAGE(@"hb_ticket_dis_new");
        self.statusLab.textColor = COLOR_C3B5AB;
        self.statusLab.layer.borderColor = COLOR_C3B5AB.CGColor;
    }
    
    
    WeakSelf;
    [self.statusLab bk_whenTapped:^{
//        [[self getViewController].navigationController popViewControllerAnimated:YES];
        if (yhqModel.use==1&&[yhqModel.status intValue]!=2) {
            if (weakSelf.JCYCBlock) {
                weakSelf.JCYCBlock();
            }
        }

    }];
    
    
    
}

- (UILabel *)priceLab {
    if (!_priceLab) {
        _priceLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:0 andTextColor:COLOR_EF2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _priceLab.font = [UIFont fontWithName:@"PingFangSC-Semibold" size:AUTO(22)];
    }
    return _priceLab;
}

- (UILabel *)statusLab {
    if (!_statusLab) {
        _statusLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:0 andTextColor:COLOR_EF2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _statusLab.font = [UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(12)];
        _statusLab.layer.borderColor = COLOR_F0F0F0.CGColor;
        _statusLab.layer.borderWidth = 1;
        _statusLab.layer.cornerRadius = AUTO(12);
        _statusLab.layer.masksToBounds = YES;
        _statusLab.userInteractionEnabled = YES;
    }
    return _statusLab;
}

- (UILabel *)infoLab {
    if (!_infoLab) {
        _infoLab = [UILabel initWithTitle:@"" andFont:AUTO(10) andWeight:1 andTextColor:JCBaseColor andBackgroundColor:COLOR_FFC6C6 andTextAlignment:NSTextAlignmentCenter];
        [_infoLab hg_setCornerOnLeftTopAndBottomRightWithRadius:5];
    }
    return _infoLab;
}



- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:0 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
        _titleLab.font = [UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(14)];
    }
    return _titleLab;
}

- (UILabel *)timeLab {
    if (!_timeLab) {
        _timeLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:0 andTextColor:COLOR_F2A15E andBackgroundColor:JCClearColor andTextAlignment:0];
        _timeLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(12)];
        _timeLab.numberOfLines = 0;
    }
    return _timeLab;
}

- (UILabel *)contentLab2 {
    if (!_contentLab2) {
        _contentLab2 = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:0 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:0];
        _contentLab2.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(12)];
        _contentLab2.numberOfLines = 0;
    }
    return _contentLab2;
}

- (UILabel *)contentLab_m {
    if (!_contentLab_m) {
        _contentLab_m = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:0 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:0];
        _contentLab_m.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(12)];
        _contentLab_m.numberOfLines = 0;
    }
    return _contentLab_m;
}

- (UILabel *)contentLab3 {
    if (!_contentLab3) {
        _contentLab3 = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:0 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:0];
        _contentLab3.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(12)];
        _contentLab3.numberOfLines = 0;
    }
    return _contentLab3;
}

- (UILabel *)contentLab4 {
    if (!_contentLab4) {
        _contentLab4 = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:0 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:0];
        _contentLab4.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(12)];
        _contentLab4.numberOfLines = 0;
    }
    return _contentLab4;
}

- (UIImageView *)bgView {
    if (!_bgView) {
        _bgView = [UIImageView new];
    }
    return _bgView;
}

@end
