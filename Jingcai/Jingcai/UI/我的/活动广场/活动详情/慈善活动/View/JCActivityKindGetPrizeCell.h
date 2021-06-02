//
//  JCActivityKindGetPrizeCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/5/31.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCRechargeBannerTextCell.h"
#import "JCSignBannerModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCActivityKindGetPrizeCell : JCBaseTableViewCell_New<SDCycleScrollViewDelegate>

@property (nonatomic,strong) UIView *tipBgView;

@property (nonatomic,strong) SDCycleScrollView *tipCycleScrollView;//轮播

@property (nonatomic,strong) NSArray *tipArray;

@end

NS_ASSUME_NONNULL_END
