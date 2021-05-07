//
//  JCJingCaiAIBigDataBuyPriceView.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/27.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseView.h"
#import "JCBigDataMonthProduceModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCJingCaiAIBigDataBuyPriceView : JCBaseView

@property (nonatomic, strong) UILabel *priceLab;

@property (nonatomic, strong) UILabel *oriPriceLab;//原价

@property (nonatomic, strong) UIImageView *thIconImgView;//特价标签

@property (nonatomic, strong) UIButton *sureBtn;

@property (nonatomic, copy) void(^JCSureBtnClickBlock)(void);

@property (nonatomic,strong) JCBigDataMonthProduceModel *productModel;

@property (nonatomic,assign) BOOL is_dc;//是否单场

@end

NS_ASSUME_NONNULL_END
