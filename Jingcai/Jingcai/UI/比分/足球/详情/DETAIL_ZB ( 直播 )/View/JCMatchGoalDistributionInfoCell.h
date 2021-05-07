//
//  JCMatchGoalDistributionInfoCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/21.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCMatchGoalDistributionInfoCirCleView.h"
#import "JCMatchGoalDistributionInfoProgressView.h"
#import "JCWMatchBall.h"
#import "JCLiveDistributionModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCMatchGoalDistributionInfoCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UIView *teamBgView;

@property (nonatomic,strong) UIView *homeView;

@property (nonatomic,strong) UIView *awayView;

@property (nonatomic,strong) UILabel *homeNameLab;

@property (nonatomic,strong) UILabel *awayNameLab;

@property (nonatomic,strong) JCMatchGoalDistributionInfoCirCleView *attackCircleView;

@property (nonatomic,strong) JCMatchGoalDistributionInfoCirCleView *dangerousCircleView;

@property (nonatomic,strong) JCMatchGoalDistributionInfoCirCleView *controlCircleView;

@property (nonatomic,strong) JCMatchGoalDistributionInfoProgressView *shezhengProgressView;//射正

@property (nonatomic,strong) JCMatchGoalDistributionInfoProgressView *shepianProgressView;//射偏

@property (nonatomic,strong) UIImageView *homeJiaoImgView;

@property (nonatomic,strong) UIImageView *homeYellowImgView;

@property (nonatomic,strong) UIImageView *homeRedImgView;

@property (nonatomic,strong) UILabel *homeJiaoLab;

@property (nonatomic,strong) UILabel *homeYellowLab;

@property (nonatomic,strong) UILabel *homeRedLab;

//
@property (nonatomic,strong) UIImageView *awayJiaoImgView;

@property (nonatomic,strong) UIImageView *awayYellowImgView;

@property (nonatomic,strong) UIImageView *awayRedImgView;

@property (nonatomic,strong) UILabel *awayJiaoLab;

@property (nonatomic,strong) UILabel *awayYellowLab;

@property (nonatomic,strong) UILabel *awayRedLab;

@property (nonatomic,strong) JCLiveDistributionModel *liveStatsModel;

@property (nonatomic,strong) NSDictionary *statusDic;

@property (nonatomic,strong) JCMatchBall *matchBall;
@end

NS_ASSUME_NONNULL_END
