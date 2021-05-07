//
//  JCYCFriendHeadView.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/3/30.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseView.h"
#import "JCYuceShareInfoModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCYCFriendHeadView : JCBaseView<SDCycleScrollViewDelegate>


@property (nonatomic,strong) UIImageView *cycleBgView;

@property (nonatomic,strong) SDCycleScrollView *jingcaiCycleScrollView;//中奖轮播

@property (nonatomic,strong) UIView *bottomView;

@property (nonatomic,strong) UILabel *totalLab;

@property (nonatomic,strong) UILabel *haveChaiLab;

@property (nonatomic,strong)  UILabel *noChaiLab;

@property (nonatomic,strong) JCYuceShareInfoModel *model;

@property (nonatomic,strong) NSArray *titleArray;

@property (nonatomic,copy) void(^JCInviteBlock)(void);

@property (nonatomic,copy) void(^JCChaiBlock)(void);

@end

NS_ASSUME_NONNULL_END
