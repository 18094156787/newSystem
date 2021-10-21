//
//  JCColumnDetailIntroduceHeadView.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/10/18.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCColumnDetailIntroduceHeadView : JCBaseView<SDCycleScrollViewDelegate>

@property (nonatomic,strong) SDCycleScrollView *noticeCycleScrollView;//中奖轮播

@property (nonatomic,strong) NSArray *titleArray;

@end

NS_ASSUME_NONNULL_END
