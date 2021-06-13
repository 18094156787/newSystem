//
//  JCJingCaiAIBigDataBuyInfoHeadView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/27.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCJingCaiAIBigDataBuyInfoHeadView.h"

@implementation JCJingCaiAIBigDataBuyInfoHeadView

- (void)initViews {
    self.backgroundColor = COLOR_F4F6F9;
    self.bgView = [[UIView alloc] init];
    self.bgView.backgroundColor = JCWhiteColor;
    [self.bgView hg_setAllCornerWithCornerRadius:AUTO(5)];
    [self addSubview:self.bgView];
    self.bgView.frame = CGRectMake(AUTO(8),AUTO(3),SCREEN_WIDTH-AUTO(16),AUTO(165));



    UIImageView *imgView = [UIImageView new];
    imgView.image = JCIMAGE(@"ic_bigdata_homeTop");
    [self.bgView addSubview:imgView];
    [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(8);
        make.top.offset(AUTO(8));
        make.size.mas_equalTo(CGSizeMake(AUTO(130), AUTO(85)));
    }];
    
    [self.bgView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(imgView.mas_right).offset(AUTO(8));
        make.top.offset(AUTO(5));
        make.right.offset(AUTO(-8));
    }];
    
    
//    [self.bgView addSubview:self.titleLab];
//    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.offset(AUTO(15));
//        make.top.offset(AUTO(8));
//        make.right.offset(AUTO(-15));
//    }];
    

    
    [self.bgView addSubview:self.countLab];
    [self.countLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.equalTo(self.titleLab.mas_bottom).offset(AUTO(10));
        make.height.mas_equalTo(AUTO(20));
    }];
    

    
    [self.bgView addSubview:self.buyBgView];
    [self.buyBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-15));
        make.centerY.equalTo(self.countLab);
        make.left.equalTo(self.countLab.mas_left);
        make.height.mas_equalTo(AUTO(30));
    }];
    
    
    [self.bgView addSubview:self.infoLab];
    [self.infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.equalTo(self.buyBgView.mas_bottom).offset(AUTO(10));
        make.right.offset(AUTO(-15));
    }];

    
    UIView *bottomView = [UIView new];
    bottomView.backgroundColor = JCWhiteColor;
    [self addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bgView.mas_bottom).offset(AUTO(8));
        make.left.right.equalTo(self);
        make.bottom.offset(AUTO(-8));
    }];
    
    [bottomView addSubview:self.serviceLab];
    [self.serviceLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.offset(AUTO(10));
        make.right.offset(AUTO(-15));
        make.height.mas_equalTo(AUTO(22));
    }];
    
    UIView *lineView = [UIView new];
    lineView.backgroundColor = COLOR_DDDDDD;
    [bottomView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.top.equalTo(self.serviceLab.mas_bottom).offset(AUTO(5));
        make.height.mas_equalTo(0.5);
    }];
    
    [bottomView addSubview:self.priceLab];
    [self.priceLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView.mas_bottom).offset(AUTO(8));
        make.right.offset(AUTO(-15));
        make.height.mas_equalTo(AUTO(25));
    }];
    
    self.titleLab.text = @"根据对阵双方的实力、状态、交战、战绩、指数等数据进行分析，给出各种玩法的预测概率。可包月，也可单场订阅（单场订阅可在比分-对应比赛的数据模块中进行购买）";
 
}



- (void)setProductModel:(JCBigDataMonthProduceModel *)productModel {
    _productModel = productModel;
    float price = [productModel.total integerValue]/100.0f;
//    NSString *priceStr =  [NSString stringWithFormat:@"%.1f",price];
    NSNumber *priceStr = [[NSNumber alloc] initWithFloat:price];
    NSString *priceTotal =  [NSString stringWithFormat:@"订单金额 %@ 红币",priceStr];
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:priceTotal];
    NSRange range = [priceTotal rangeOfString:[NSString stringWithFormat:@"%@",priceStr]];
    if (range.location!=NSNotFound) {
        [attr addAttributes:@{NSForegroundColorAttributeName:JCBaseColor,NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(18)]} range:range];
        
    }
//    NSRange hbRange = [priceTotal rangeOfString:@"红币"];
//    if (hbRange.location!=NSNotFound) {
//        [attr addAttributes:@{NSForegroundColorAttributeName:COLOR_333333} range:hbRange];
//    }
    self.priceLab.attributedText = attr;
    self.serviceLab.text = [NSString stringWithFormat:@"大数据报告包月服务（%@天）",productModel.day];
    
    
    
    if ([productModel.user_count integerValue]>0) {
        NSString *buyCount = [NSString stringWithFormat:@"%@人购买",productModel.user_count];
        NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:buyCount];
        NSRange range = [buyCount rangeOfString:productModel.user_count];
        if (range.location!=NSNotFound) {
            [attr addAttributes:@{NSForegroundColorAttributeName:JCBaseColor} range:range];
        }
        self.countLab.text = buyCount;
    }else{
        self.countLab.text = @"";
    }
    [self layoutIfNeeded];
    NSArray *userArray = self.productModel.user_img;
    for (int i=0; i<userArray.count; i++) {
             NSString *user_img = userArray[i];
              UIImageView *imgView = [UIImageView new];
              [imgView hg_setAllCornerWithCornerRadius:AUTO(15)];
             imgView.frame = CGRectMake(self.countLab.right+AUTO(15)*i, AUTO(4), AUTO(22), AUTO(22));
            imgView.image = JCIMAGE(@"userImg_default");
             [imgView sd_setImageWithURL:[NSURL URLWithString:user_img] placeholderImage:JCIMAGE(@"userImg_default")];
              [self.buyBgView addSubview:imgView];
      }

}


- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(12.5) andWeight:1 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:0];
        _titleLab.numberOfLines = 0;
    }
    return _titleLab;
}

- (UILabel *)infoLab {
    if (!_infoLab) {
        _infoLab = [UILabel initWithTitle:@"注：本服务为数据订阅服务，不包含方案！" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _infoLab;
}

- (UILabel *)countLab {
    if (!_countLab) {
        _countLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _countLab;
}

- (UIView *)buyBgView {
    if (!_buyBgView) {
        _buyBgView = [UIView new];
    }
    return _buyBgView;
}

- (UILabel *)serviceLab {
    if (!_serviceLab) {
        _serviceLab = [UILabel initWithTitle:@"大数据报告包月服务（30天）" andFont:AUTO(15) andWeight:2 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _serviceLab;
}

- (UILabel *)priceLab {
    if (!_priceLab) {
        _priceLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _priceLab;
}
@end
