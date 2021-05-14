//
//  JCJingCaiAIBigDataBuyInfoView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/27.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCJingCaiAIBigDataBuyInfoView.h"

@implementation JCJingCaiAIBigDataBuyInfoView

- (void)initViews {
    [self addSubview:self.priceLab];
    [self.priceLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.offset(0);
        make.height.mas_equalTo(AUTO(30));
    }];
    
//    [self addSubview:self.thIconImgView];
//    [self.thIconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.equalTo(self.priceLab).offset(AUTO(3));
//        make.left.equalTo(self.priceLab.mas_right).offset(2);
//        make.size.mas_equalTo(CGSizeMake(AUTO(42), AUTO(14.5)));
//    }];
    
    [self addSubview:self.oriPriceLab];
    [self.oriPriceLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.priceLab.mas_right).offset(5);
        make.centerY.equalTo(self.priceLab);
    }];
    
//    [self addSubview:self.infoLab];
//    [self.infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.priceLab);
//        make.top.equalTo(self.priceLab.mas_bottom);
//    }];
    



//    [self addSubview:self.sureBtn];
//    [self.sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.offset(AUTO(-15));
//        make.top.equalTo(self.priceLab).offset(AUTO(5));
//        make.size.mas_equalTo(CGSizeMake(AUTO(92), AUTO(32)));
//    }];
    

    


    
    WeakSelf;
    [self.sureBtn bk_whenTapped:^{
        if (weakSelf.JCSureBtnClickBlock) {
            weakSelf.JCSureBtnClickBlock();
        }
    }];



}
- (void)setProductModel:(JCBigDataMonthProduceModel *)productModel {
    _productModel = productModel;
    NSInteger total = [productModel.total integerValue]/100;
    NSString *title = [NSString stringWithFormat:@"%ld",total];
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:title];

    self.priceLab.attributedText = attr;
    NSInteger oriPirce_inter = [productModel.old_total integerValue]/100;
    NSString *oriPrice = [NSString stringWithFormat:@"%ld红币/月",oriPirce_inter];

    NSRange range = [oriPrice rangeOfString:[NSString stringWithFormat:@"%ld",oriPirce_inter]];
    if (oriPirce_inter>total) {
//        oriPrice = @"红币/月";
        //中划线
   //     NSDictionary *attribtDic = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
       
        NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:oriPrice];
       [attribtStr addAttributes:@{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle],NSStrikethroughStyleAttributeName:[NSNumber numberWithInteger:NSUnderlineStyleSingle]} range:range];
   //    [attribtStr addAttributes:@{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle] range:range];
       [attribtStr setAttributes:@{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle],NSBaselineOffsetAttributeName:@(NSUnderlineStyleSingle)} range:range];

       self.oriPriceLab.attributedText = attribtStr;
    }else{
        self.oriPriceLab.text = @"红币/月";
    }


}

- (UILabel *)priceLab {
    if (!_priceLab) {
        _priceLab = [UILabel initWithTitle:@"" andFont:AUTO(20) andWeight:2 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _priceLab;
}

- (UIButton *)sureBtn {
    if (!_sureBtn) {
        _sureBtn = [UIButton initWithText:@"立即购买" FontSize:AUTO(14) Weight:2 BackGroundColor:JCClearColor TextColors:JCWhiteColor];
        _sureBtn.backgroundColor = JCBaseColor;
        [_sureBtn hg_setAllCornerWithCornerRadius:AUTO(16)];
    }
    return _sureBtn;
}

- (UILabel *)oriPriceLab {
    if (!_oriPriceLab) {
        _oriPriceLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:2 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _oriPriceLab;
}

- (UIImageView *)thIconImgView {
    if (!_thIconImgView) {
        _thIconImgView = [UIImageView new];
        _thIconImgView.image = JCIMAGE(@"ic_price_xsth");
    }
    return _thIconImgView;
}

- (UILabel *)infoLab {
    if (!_infoLab) {
        _infoLab = [UILabel initWithTitle:@"注：本服务为数据订阅服务，不包含方案！" andFont:AUTO(10) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _infoLab;
}
@end
