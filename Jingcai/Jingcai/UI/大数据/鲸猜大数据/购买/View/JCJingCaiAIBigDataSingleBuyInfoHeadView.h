//
//  JCJingCaiAIBigDataSingleBuyInfoHeadView.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/29.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseView.h"
#import "JCBigDataMonthProduceModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCJingCaiAIBigDataSingleBuyInfoHeadView : JCBaseView

@property (nonatomic,strong) UIView *bgView;

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UILabel *priceLab;

@property (nonatomic,strong) UILabel *infoLab;

@property (nonatomic,strong) JCBigDataMonthProduceModel *productModel;


@end

NS_ASSUME_NONNULL_END
