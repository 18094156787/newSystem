//
//  JCMatchGoalDistributionTrendCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/18.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCWMatchBall.h"
#import "JCZBIncidentModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCMatchGoalDistributionTrendCell : JCBaseTableViewCell_New

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

@property (nonatomic,strong) NSArray *timeArray;

@property (nonatomic,strong) UILabel *htArray;//中场时间

//@property (nonatomic,strong) NSArray *timeArray;

@property (nonatomic,strong) NSMutableArray *goalArray;

@property (nonatomic,strong) NSMutableArray *halfGoalArray;//半场

@property (nonatomic,strong) NSString *firstValue;

@property (nonatomic,strong) NSString *lastValue;

@property (nonatomic,strong) JCMatchBall *matchBall;

@property (nonatomic,strong) NSArray *incidentArray;

@property (nonatomic,strong) NSArray *dataArray;

@property (nonatomic,strong) NSMutableArray *timeViewArray;

@property (nonatomic,assign) BOOL isLoadTime;

@end

NS_ASSUME_NONNULL_END
