//
//  JCActivityNewsHeadView.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/3/4.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCActivityNewsHeadView : JCBaseView<SDCycleScrollViewDelegate>

@property (nonatomic,strong) SDCycleScrollView *cycleScrollView;//轮播

@property (nonatomic,strong) NSArray *bannerArray;

@property (nonatomic,strong) NSArray *titleArray;

@end

NS_ASSUME_NONNULL_END
