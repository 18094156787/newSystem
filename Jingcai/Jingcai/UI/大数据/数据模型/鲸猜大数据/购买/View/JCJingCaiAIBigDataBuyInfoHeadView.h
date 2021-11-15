//
//  JCJingCaiAIBigDataBuyInfoHeadView.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/27.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseView.h"
#import "JCBigDataMonthProduceModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCJingCaiAIBigDataBuyInfoHeadView : JCBaseView

@property (nonatomic,strong) UIView *bgView;

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UILabel *infoLab;

@property (nonatomic,strong) UILabel *countLab;

@property (nonatomic,strong)UIView *buyBgView;

@property (nonatomic,strong) UILabel *serviceLab;

@property (nonatomic,strong) UILabel *priceLab;

@property (nonatomic,strong) JCBigDataMonthProduceModel *productModel;

@end

NS_ASSUME_NONNULL_END
