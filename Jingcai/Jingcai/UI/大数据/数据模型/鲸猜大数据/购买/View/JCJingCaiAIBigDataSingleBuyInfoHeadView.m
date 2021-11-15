//
//  JCJingCaiAIBigDataSingleBuyInfoHeadView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/29.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCJingCaiAIBigDataSingleBuyInfoHeadView.h"

@implementation JCJingCaiAIBigDataSingleBuyInfoHeadView

- (void)initViews {
    self.backgroundColor = COLOR_F4F6F9;
    [self addSubview:self.bgView];
    self.bgView.frame = CGRectMake(AUTO(15),AUTO(8),SCREEN_WIDTH-AUTO(30),AUTO(145));
    self.bgView.backgroundColor = JCWhiteColor;
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(0, 0, AUTO(8), 0));
    }];

    
    [self.bgView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.height.mas_equalTo(AUTO(25));
    }];

    [self.bgView addSubview:self.infoLab];
    [self.infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.equalTo(self.titleLab.mas_bottom).offset(AUTO(10));
        make.right.offset(AUTO(-15));
//        make.height.mas_equalTo(AUTO(25));
    }];

    
    UIView *lineView = [UIView new];
    lineView.backgroundColor = COLOR_DDDDDD;
    [self.bgView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.top.equalTo(self.infoLab.mas_bottom).offset(AUTO(10));
        make.height.mas_equalTo(0.5);
    }];
    
    [self.bgView addSubview:self.priceLab];
    [self.priceLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView.mas_bottom).offset(AUTO(8));
        make.right.offset(AUTO(-15));
        make.height.mas_equalTo(AUTO(25));
    }];
    

 
}



- (void)setProductModel:(JCBigDataMonthProduceModel *)productModel {
    _productModel = productModel;
    self.titleLab.text = [NSString stringWithFormat:@"%@ VS %@",productModel.home_team_name,productModel.away_team_name];
    
    
    float price = [productModel.one_total integerValue]/100.0f;
    NSNumber *number = [[NSNumber alloc] initWithFloat:price];
    NSString *priceStr =  [NSString stringWithFormat:@"%@",number];
    NSString *priceTotal =  [NSString stringWithFormat:@"订单金额 %@ 红币",priceStr];
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:priceTotal];
    NSRange range = [priceTotal rangeOfString:priceStr];
    if (range.location!=NSNotFound) {
        [attr addAttributes:@{NSForegroundColorAttributeName:JCBaseColor,NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(18)]} range:range];
        
    }

    self.priceLab.attributedText = attr;
   
    self.infoLab.text = [NSString stringWithFormat:@"%@ 发布  %@  ",productModel.created_at,productModel.click];
    if ([productModel.click integerValue]==0) {
            self.infoLab.text = [NSString stringWithFormat:@"%@ 发布",productModel.created_at];
        }

}


- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [UIView new];
    }
    return _bgView;
}


- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(15) andWeight:2 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:0];
        _titleLab.numberOfLines = 0;
    }
    return _titleLab;
}


- (UILabel *)priceLab {
    if (!_priceLab) {
        _priceLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _priceLab;
}

- (UILabel *)infoLab {
    if (!_infoLab) {
        _infoLab = [UILabel initWithTitle:@"" andFont:AUTO(13) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _infoLab;
}

@end
