//
//  JCRechareHeadView.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/5/27.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCRechareHeadView : JCBaseView<SDCycleScrollViewDelegate>

@property (nonatomic,strong) SDCycleScrollView *cycleScrollView;//轮播

@property (nonatomic,strong) NSArray *bannerArray;

@end

NS_ASSUME_NONNULL_END
