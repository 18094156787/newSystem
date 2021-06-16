//
//  JCHongbangPriceInfoView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/22.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCHongbangPriceInfoView.h"

@implementation JCHongbangPriceInfoView

- (void)initViews {

    self.backgroundColor = JCWhiteColor;
    self.layer.shadowColor = [UIColor colorWithRed:221/255.0 green:221/255.0 blue:221/255.0 alpha:0.5].CGColor;
    self.layer.shadowOffset = CGSizeMake(0,-1);
    self.layer.shadowOpacity = 1;
    self.layer.shadowRadius = 1.5;
    
    [self addSubview:self.thIconImgView];
    [self.thIconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(15);
        make.top.offset(AUTO(5));
        make.size.mas_equalTo(CGSizeMake(AUTO(42), AUTO(14.5)));
    }];
    
    [self addSubview:self.priceLab];
    [self.priceLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.equalTo(self.thIconImgView.mas_bottom);
        make.height.mas_equalTo(AUTO(30));
    }];
    

    
    [self addSubview:self.oriPriceLab];
    [self.oriPriceLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.priceLab);
        make.top.equalTo(self.priceLab.mas_bottom).offset(-3);
    }];




    [self addSubview:self.sureBtn];
    [self.sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-15));
        make.top.offset(AUTO(15));
        make.size.mas_equalTo(CGSizeMake(AUTO(125), AUTO(44)));
    }];
    
    [self addSubview:self.hbPriceLab];
    [self.hbPriceLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.priceLab.mas_right).offset(AUTO(15));
        make.centerY.equalTo(self.priceLab).offset(5);

    }];


    
    WeakSelf;
    [self.sureBtn bk_whenTapped:^{
        if (weakSelf.JCSureBtnClickBlock) {
            weakSelf.JCSureBtnClickBlock();
        }
    }];



}

- (void)setTjInfoDetailBall:(JCWTjInfoDetailBall *)tjInfoDetailBall {
    _tjInfoDetailBall = tjInfoDetailBall;
//    tjInfoDetailBall.isAI = YES;

    self.thIconImgView.hidden= YES;
    if ([tjInfoDetailBall.sf floatValue]<[tjInfoDetailBall.old_sf floatValue]) {
        self.thIconImgView.hidden= NO;
         NSString *oriPrice = [NSString stringWithFormat:@"原价%@红币", @([tjInfoDetailBall.old_sf floatValue]/100.f)];
        if (tjInfoDetailBall.is_ai) {
            oriPrice = [NSString stringWithFormat:@"原价%@红币", @([tjInfoDetailBall.old_sf floatValue]/100.0f)];
        }
         
          //中划线

          NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:oriPrice];
        NSRange range = [oriPrice rangeOfString:[NSString stringWithFormat:@"%@",@([tjInfoDetailBall.old_sf floatValue]/100.0f)]];
        if (range.location!=NSNotFound) {
            [attribtStr addAttributes:@{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle],NSBaselineOffsetAttributeName:@(NSUnderlineStyleSingle)} range:range];
        }
         self.oriPriceLab.attributedText = attribtStr;
     }
    
    
    NSString *money = [NSString stringWithFormat:@"需支付: %@ 红币",@([self.tjInfoDetailBall.sf floatValue]/100.0f)];
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:money];
    NSRange range = [money rangeOfString:@"红币"];
    NSRange range1 = [money rangeOfString:@"需支付:"];
    [attributedStr setAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(14)],NSForegroundColorAttributeName:COLOR_2F2F2F} range:range];
        [attributedStr setAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(14)],NSForegroundColorAttributeName:COLOR_2F2F2F} range:range1];
    self.priceLab.attributedText = attributedStr;
}

- (void)setPrice:(NSString *)price {
    NSString *money = [NSString stringWithFormat:@"需支付: %@ 红币",price];
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:money];
    NSRange range = [money rangeOfString:@"红币"];
    NSRange range1 = [money rangeOfString:@"需支付:"];
    [attributedStr setAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(14)],NSForegroundColorAttributeName:COLOR_2F2F2F} range:range];
        [attributedStr setAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(14)],NSForegroundColorAttributeName:COLOR_2F2F2F} range:range1];
    self.priceLab.attributedText = attributedStr;
    
    
    
//    self.hbPriceLab.text = @"4454";
    
}

- (void)setHbPrice:(NSString *)hbPrice {
    _hbPrice = hbPrice;
    if (hbPrice.length>0) {
        NSString *hBprice = [NSString stringWithFormat:@"%@红币",hbPrice];
        NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:hBprice];

        [attribtStr addAttributes:@{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle],NSBaselineOffsetAttributeName:@(NSUnderlineStyleSingle)} range:attribtStr.rangeOfAll];

            self.hbPriceLab.attributedText = attribtStr;
    }else{
        self.hbPriceLab.text = @"";
    }
    
}

- (UILabel *)priceLab {
    if (!_priceLab) {
        _priceLab = [UILabel initWithTitle:@"" andFont:AUTO(21) andWeight:3 andTextColor:COLOR_F72D27 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _priceLab;
}

- (UIButton *)sureBtn {
    if (!_sureBtn) {
        _sureBtn = [UIButton initWithText:@"确认支付" FontSize:AUTO(16) Weight:2 BackGroundColor:JCBaseColor TextColors:JCWhiteColor];
        [_sureBtn hg_setAllCornerWithCornerRadius:AUTO(22)];
    }
    return _sureBtn;
}

- (UILabel *)oriPriceLab {
    if (!_oriPriceLab) {
        _oriPriceLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _oriPriceLab;
}

- (UILabel *)hbPriceLab {
    if (!_hbPriceLab) {
        _hbPriceLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _hbPriceLab;
}

- (UIImageView *)thIconImgView {
    if (!_thIconImgView) {
        _thIconImgView = [UIImageView new];
        _thIconImgView.image = JCIMAGE(@"ic_price_xsth");
        _thIconImgView.hidden = YES;
    }
    return _thIconImgView;
}

@end
