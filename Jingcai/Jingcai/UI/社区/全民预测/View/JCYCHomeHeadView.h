//
//  JCYCHomeHeadView.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/3/27.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCYCHomeHeadView : JCBaseView<SDCycleScrollViewDelegate,UIScrollViewDelegate>

@property (nonatomic,strong) UIView *bottomColorView;

@property (nonatomic,strong) CAGradientLayer *gl;

@property (nonatomic,strong) UIView *bgView;

@property (nonatomic,strong) UIView *contentBgView;

@property (nonatomic,strong) UIImageView *cycleBgView;

@property (nonatomic,strong) SDCycleScrollView *jingcaiCycleScrollView;//中奖轮播

@property (nonatomic,strong) UIView *bottomView;

@property (nonatomic,strong) void(^JCColorBlock)(UIColor *color);

@property (nonatomic,strong) NSArray *bannerArray;

@property (nonatomic,strong) NSArray *titleArray;

@end

NS_ASSUME_NONNULL_END
