//
//  JCJingCaiAIBigDataBuyPriceView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/27.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCJingCaiAIBigDataBuyPriceView.h"

@implementation JCJingCaiAIBigDataBuyPriceView

- (void)initViews{
    
    [self addSubview:self.thIconImgView];
    [self.thIconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.offset(15);
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
        make.size.mas_equalTo(CGSizeMake(AUTO(115), AUTO(44)));
    }];
    
    WeakSelf;
    [self.sureBtn bk_whenTapped:^{
        if (weakSelf.JCSureBtnClickBlock) {
            weakSelf.JCSureBtnClickBlock();
        }
    }];

}

- (void)setProductModel:(JCBigDataMonthProduceModel *)productModel {
    _productModel = productModel;
    float price= [productModel.total integerValue]/100.0;
    if (self.is_dc) {
        price= [productModel.one_total integerValue]/100.0;
    }
    NSNumber *priceStr = [[NSNumber alloc] initWithFloat:price];
    NSString *total = [NSString stringWithFormat:@"需支付 %@ 红币",priceStr];
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:total];
    NSRange range = [total rangeOfString:[NSString stringWithFormat:@"%@",priceStr]];
    if (range.location!=NSNotFound) {
        [attr addAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(28)]} range:range];
        [attr addAttributes:@{NSForegroundColorAttributeName:JCBaseColor} range:range];
    }
    self.priceLab.attributedText = attr;
    
    if ([productModel.old_total integerValue]>[productModel.total integerValue]) {
        self.thIconImgView.hidden = NO;
        NSInteger old_price= [productModel.old_total integerValue]/100.0;
        NSString *oriPrice = [NSString stringWithFormat:@"原价%ld红币/月",old_price];
        
         //中划线
//         NSDictionary *attribtDic = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
         NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:oriPrice];
        NSRange range = [oriPrice rangeOfString:[NSString stringWithFormat:@"%ld",old_price]];
        [attribtStr addAttributes:@{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle],NSBaselineOffsetAttributeName:@(NSUnderlineStyleSingle)} range:range];
        
        self.oriPriceLab.attributedText = attribtStr;
    }else{
        self.thIconImgView.hidden = YES;
        [self.priceLab mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(AUTO(15));
            make.centerY.equalTo(self.sureBtn);
            make.height.mas_equalTo(AUTO(30));
        }];
    }
    

}

- (UILabel *)priceLab {
    if (!_priceLab) {
        _priceLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _priceLab;
}

- (UIButton *)sureBtn {
    if (!_sureBtn) {
        _sureBtn = [UIButton initWithText:@"确认支付" FontSize:AUTO(14) Weight:2 BackGroundColor:JCBaseColor TextColors:JCWhiteColor];
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

- (UIImageView *)thIconImgView {
    if (!_thIconImgView) {
        _thIconImgView = [UIImageView new];
        _thIconImgView.image = JCIMAGE(@"ic_price_xsth");
        _thIconImgView.hidden = YES;
    }
    return _thIconImgView;
}
@end
