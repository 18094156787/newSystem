//
//  JCMatchGoalDistributionTrendView.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/11.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCMatchGoalDistributionTrendView : JCBaseView

@property (nonatomic,strong) UIScrollView *bgScrollow;

@property (nonatomic,strong) UIView *homeView;

@property (nonatomic,strong) UIView *awayView;

@property (nonatomic,strong) UIView *endLineView;

@property (nonatomic,strong) NSArray *dataArray;

@property (nonatomic,strong) NSMutableArray *homeGoalArray;

@property (nonatomic,strong) NSMutableArray *awayGoalArray;

@property (nonatomic,strong) NSString *firstValue;

@property (nonatomic,strong) NSString *lastValue;

@end

NS_ASSUME_NONNULL_END
