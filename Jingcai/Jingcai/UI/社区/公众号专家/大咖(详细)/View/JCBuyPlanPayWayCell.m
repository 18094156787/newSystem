//
//  JCBuyPlanPayWayCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/5/18.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBuyPlanPayWayCell.h"

@implementation JCBuyPlanPayWayCell

- (void)initViews {
    [self.contentView addSubview:self.iconImgView];
    [self.iconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.centerY.equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(AUTO(24), AUTO(24)));
    }];
    
    [self.contentView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.iconImgView.mas_right).offset(AUTO(5));
    }];
    
    [self.contentView addSubview:self.indicateImgView];
    [self.indicateImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-15));
        make.centerY.equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(AUTO(5), AUTO(10)));
    }];
    
    [self.contentView addSubview:self.selBtn];
    [self.selBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-15));
        make.centerY.equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(AUTO(16), AUTO(16)));
    }];
    
    [self.contentView addSubview:self.selHongbaoLab];
    [self.selHongbaoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-30));
        make.centerY.equalTo(self.contentView);
    }];
    
    [self.contentView addSubview:self.infoLab];
    [self.infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-30));
        make.centerY.equalTo(self.contentView);
    }];
    
//    [self.contentView addSubview:self.hongbaoImgView];
//    [self.hongbaoImgView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.offset(AUTO(-25));
//        make.centerY.equalTo(self.contentView);
//        make.size.mas_equalTo(CGSizeMake(AUTO(82), AUTO(24)));
//    }];
//    
//    [self.hongbaoImgView addSubview:self.hongbaoLab];
//    [self.hongbaoLab mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.insets(UIEdgeInsetsZero);
//    }];
    
    self.lineView = [UIView new];
    self.lineView.backgroundColor = COLOR_F0F0F0;
    [self.contentView addSubview:self.lineView];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.bottom.offset(0);
        make.height.mas_equalTo(1);
    }];
    
}

//- (void)data {
//    self.selHongbaoLab.text = @"已抵扣5.00红币";
//    self.hongbaoLab.text = @"最高可减¥99";
//}


- (void)setPayWayball:(JCPayWayBall *)payWayball {
    _payWayball = payWayball;

    self.selBtn.hidden = payWayball.payWay==JCPayWayEnumHongbao?YES:NO;
    self.indicateImgView.hidden = payWayball.payWay==JCPayWayEnumHongbao?NO:YES;
//    self.hongbaoImgView.hidden = payWayball.payWay==JCPayWayEnumHongbao?NO:YES;
    self.selHongbaoLab.hidden = payWayball.payWay==JCPayWayEnumHongbao?NO:YES;
    if (payWayball.payWay==JCPayWayEnumCaiyun) {
        self.selHongbaoLab.hidden = NO;
        NSString *myMoney = [JCCommomTool formatePointZero1:[JCWUserBall currentUser].prize];//        [NSString stringWithFormat:@"%@",@([[JCWUserBall currentUser].prize integerValue]/100.0f)];
        if (!myMoney) {
            myMoney = @"0";
        }
        NSString *title = [NSString stringWithFormat:@"账户余额 %@红币    ",myMoney];
//        NSString *title = [NSString stringWithFormat:@"%@: %@",payWayball.title,money];
        NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:title];
        NSRange range = [title rangeOfString:[NSString stringWithFormat:@"%@红币",myMoney]];
        if (range.location!=NSNotFound) {
            [attr addAttributes:@{NSForegroundColorAttributeName:COLOR_2F2F2F,NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(14)]} range:range];
            self.infoLab.attributedText = attr;
        }
    }else{
        self.infoLab.text = @"";
    }
    self.titleLab.text = payWayball.title;
    if (payWayball.payWay==JCPayWayEnumHongbao) {
        self.iconImgView.image = JCIMAGE(@"daka_honbao");
        
    }
    if (payWayball.payWay==JCPayWayEnumCaiyun) {
        self.iconImgView.image = JCIMAGE(@"caiyun_hb");
    }

    
    self.selBtn.selected = payWayball.state_issel;
    
}




- (UIImageView *)iconImgView {
    if (!_iconImgView) {
        _iconImgView = [UIImageView new];
    }
    return _iconImgView;
}

- (UIImageView *)indicateImgView {
    if (!_indicateImgView) {
        _indicateImgView = [UIImageView new];
        _indicateImgView.image= JCIMAGE(@"daka_right");
    }
    return _indicateImgView;
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _titleLab;
}

- (UILabel *)infoLab {
    if (!_infoLab) {
        _infoLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_A9A9A9 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _infoLab;
}

- (UIButton *)selBtn {
    if (!_selBtn) {
        _selBtn = [UIButton new];
        [_selBtn setImage:JCIMAGE(@"radio_red_normal") forState:0];
        [_selBtn setImage:JCIMAGE(@"radio_red_selecte_new") forState:UIControlStateSelected];
        _selBtn.userInteractionEnabled = NO;
    }
    return _selBtn;
}

- (UILabel *)selHongbaoLab {
    if (!_selHongbaoLab) {
        _selHongbaoLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _selHongbaoLab;
}

@end
