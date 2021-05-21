//
//  JCAppGuideView.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/5/20.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCAppGuideView : JCBaseView<SDCycleScrollViewDelegate>

@property (nonatomic,strong) SDCycleScrollView *cycleScrollView;//轮播

@end

NS_ASSUME_NONNULL_END
