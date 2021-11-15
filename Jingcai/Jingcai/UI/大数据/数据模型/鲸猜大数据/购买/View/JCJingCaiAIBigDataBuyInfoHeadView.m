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
    self.bgView.frame = CGRectMake(0,0,SCREEN_WIDTH,AUTO(155));
    
    UILabel *titleLab = [UILabel initWithTitle:@"鲸猜大数据服务" andFont:18 andWeight:1 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:0];
    [self.bgView addSubview:titleLab];
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(15);
        make.top.offset(0);
    }];

    
    
    
    UIImageView *imgView = [UIImageView new];
    imgView.image = JCIMAGE(@"ic_bigdata_homeTop");
    [self.bgView addSubview:imgView];
    [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-15);
        make.top.offset(8);
        make.size.mas_equalTo(CGSizeMake(AUTO(163), AUTO(118)));
    }];
    
    [self.bgView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(15);
        make.top.equalTo(titleLab.mas_bottom).offset(4);
        make.right.equalTo(imgView.mas_left).offset(15);
    }];
    
    [self.bgView addSubview:self.infoLab];
    [self.infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(15);
        make.top.equalTo(self.titleLab.mas_bottom).offset(8);
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
        make.centerY.equalTo(bottomView);
        make.right.offset(AUTO(-15));
        make.height.mas_equalTo(AUTO(22));
    }];
    

    
    [bottomView addSubview:self.priceLab];
    [self.priceLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-15));
        make.centerY.equalTo(bottomView);
    }];
    
    self.titleLab.text = @"根据对阵双方的实力、状态、交战、战绩、指数等数据进行分析，给出各种玩法的预测概率。可包月，也可单场订阅（单场订阅可在比分-对应比赛的数据模块中进行购买）";
 
}



- (void)setProductModel:(JCBigDataMonthProduceModel *)productModel {
    _productModel = productModel;
    NSString *dayStr =  [NSString stringWithFormat:@"有效期%@天",productModel.day];

    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:dayStr];
    NSRange range = [dayStr rangeOfString:productModel.day];
    if (range.location!=NSNotFound) {
        [attr addAttributes:@{NSForegroundColorAttributeName:JCBaseColor,NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(16)]} range:range];
        
    }

    self.priceLab.attributedText = attr;


    
    



}


- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
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
        _serviceLab = [UILabel initWithTitle:@"大数据报告包月服务" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
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
