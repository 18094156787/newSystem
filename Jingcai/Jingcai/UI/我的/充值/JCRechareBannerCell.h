//
//  JCRechareBannerCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/5/27.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCRechargeTextBannerView.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCRechareBannerCell : JCBaseTableViewCell_New<SDCycleScrollViewDelegate>

@property (nonatomic,strong) SDCycleScrollView *cycleScrollView;//图片轮播

@property (nonatomic,strong) JCRechargeTextBannerView *textBannerView;//文字轮播

@property (nonatomic,strong) NSArray *bannerArray;

@property (nonatomic,strong) NSArray *tipArray;

@end

NS_ASSUME_NONNULL_END
