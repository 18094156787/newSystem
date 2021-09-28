//
//  JCFanganSaleOut_BuyCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/9/27.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCFanganSaleOut_BuyCell.h"

@implementation JCFanganSaleOut_BuyCell

- (void)initViews {
    
    [self.contentView addSubview:self.introduceLab];
    [self.introduceLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.offset(AUTO(8));
        make.right.offset(AUTO(-15));
//        make.bottom.offset(-15);
//        make.height.mas_equalTo(100);
    }];
    
    UIImageView *imgView = [UIImageView new];
    imgView.image = JCIMAGE(@"jc_fangan_saleOut");
    [self.contentView addSubview:imgView];
    [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(AUTO(220), AUTO(144)));
        make.top.equalTo(self.introduceLab.mas_bottom).offset(20);
    }];
    
    UILabel *infoLab = [UILabel initWithTitle:@"免责声明：鲸猜足球仅为信息发布平台，并不对第三方发布的信息真实性及准确性负责，且不提供彩票售卖服务，请您注意投资风险，理性购买！" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:0];
    infoLab.numberOfLines= 0;
    [self.contentView addSubview:infoLab];
    [infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.top.equalTo(imgView.mas_bottom).offset(AUTO(20));
        make.bottom.offset(AUTO(-15));
    }];
    
}
- (void)setPayInfoModel:(JCWTjInfoBall *)payInfoModel {
    _payInfoModel = payInfoModel;
    self.introduceLab.text = payInfoModel.subtitle;
}
- (UILabel *)introduceLab {
    if (!_introduceLab) {
        _introduceLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:[COLOR_2F2F2F colorWithAlphaComponent:0.6] andBackgroundColor:JCClearColor andTextAlignment:0];
        _introduceLab.numberOfLines = 0;
    }
    return _introduceLab;
}
@end
