//
//  JCCommomBannerHeadView.h
//  Jingcai
//
//  Created by 陈继伟 on 2019/8/8.
//  Copyright © 2019年 blockstar. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JCCommomBannerHeadView : UIView<SDCycleScrollViewDelegate>

@property (nonatomic,strong) SDCycleScrollView *cycleScrollView;//轮播

@property (nonatomic,strong) NSArray *bannerArray;


@end

NS_ASSUME_NONNULL_END
