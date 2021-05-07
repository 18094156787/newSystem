//
//  JCBasketBallMatchGoalDistributionTrendCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/4.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCWMatchBall.h"
#import "JCZBIncidentModel.h"
#import "JCBasketMatchDetailTrendModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCBasketBallMatchGoalDistributionTrendCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UIScrollView *bgScrollow;

@property (nonatomic,strong) UIImageView *homeImgView;

@property (nonatomic,strong) UIImageView *awayImgView;

@property (nonatomic,strong) UIView *homeView;

@property (nonatomic,strong) UIView *awayView;

@property (nonatomic,strong) UIView *homeActionView;

@property (nonatomic,strong) UIView *awayActionView;

@property (nonatomic,strong) UIView *homeActionColorView;

@property (nonatomic,strong) UIView *awayActionColorView;

@property (nonatomic,strong) UIView *endLineView;

@property (nonatomic,strong) UILabel *endTimeLab;//当前进行到分钟数

@property (nonatomic,strong) NSArray *timeArray;

@property (nonatomic,strong) UILabel *htArray;//中场时间

@property (nonatomic,strong) UILabel *homeScoreLab;//主队分差

@property (nonatomic,strong) UILabel *middleScoreLab;//

@property (nonatomic,strong) UILabel *awayScoreLab;//客队分差

//@property (nonatomic,strong) NSArray *timeArray;

@property (nonatomic,strong) NSMutableArray *goalArray;

@property (nonatomic,strong) NSMutableArray *halfGoalArray;//半场

@property (nonatomic,strong) NSString *firstValue;

@property (nonatomic,strong) NSString *lastValue;

@property (nonatomic,strong) JCBasketBallMatchBall *matchBall;

@property (strong, nonatomic) JCBasketMatchDetailTrendModel *trendModel;

@property (nonatomic,strong) NSArray *incidentArray;

@property (nonatomic,strong) NSArray *dataArray;

@property (nonatomic,strong) NSMutableArray *timeViewArray;

@property (nonatomic,assign) float singleWidth;//每一格子的宽度

@property (nonatomic,assign) BOOL isLoadTime;

@property (nonatomic,assign) float maxValue;//y轴最大值

@property (nonatomic,assign) NSInteger trend_count;//一共多少节,正常是4节

@property (nonatomic,assign) NSInteger trend_per;//每节多少分钟

@end

NS_ASSUME_NONNULL_END
