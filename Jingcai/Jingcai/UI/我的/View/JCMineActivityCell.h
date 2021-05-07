//
//  JCMineActivityCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/3/18.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCMineActivityCell : JCBaseTableViewCell_New<SDCycleScrollViewDelegate>

@property (nonatomic,strong) SDCycleScrollView *cycleScrollView;//轮播

@property (nonatomic,strong) NSArray *bannerArray;

@end

NS_ASSUME_NONNULL_END
