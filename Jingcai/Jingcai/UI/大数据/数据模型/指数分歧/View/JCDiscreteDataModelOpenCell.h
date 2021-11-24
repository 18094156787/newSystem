//
//  JCDiscreteDataModelOpenCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/11.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCDiscreteDataModelLockedRateView.h"
#import "JCDiscreteDataModelTrackView.h"
#import "JCKellyDataModelModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCDiscreteDataModelOpenCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UIView *bgView;

@property (nonatomic, strong) UILabel *matchNameLab;//联赛名称

@property (nonatomic, strong) UILabel *matchTimeLab;//比赛时间

@property (nonatomic, strong) UILabel *matchStatusLab;//比赛状态

@property (nonatomic, strong) UIImageView *homeTeamImgView;//

@property (nonatomic, strong) UIImageView *awayTeamImgView;//

@property (nonatomic, strong) UILabel *homeTeamLab;

@property (nonatomic, strong) UILabel *awayTeamLab;

@property (nonatomic, strong) UILabel *scoreLab;//比分

@property (nonatomic, strong) UILabel *chuLab;//初指

@property (nonatomic, strong) UILabel *jiLab;//即指

@property (nonatomic, strong) UIButton *lockBtn;

@property (nonatomic,strong) KKPaddingLabel *historyLab;

@property (nonatomic, strong) JCDiscreteDataModelLockedRateView *homeWinView;

@property (nonatomic, strong) JCDiscreteDataModelLockedRateView *homeEqualView;

@property (nonatomic, strong) JCDiscreteDataModelLockedRateView *homeLoseView;

@property (nonatomic, strong) JCDiscreteDataModelLockedRateView *awayWinView;

@property (nonatomic, strong) JCDiscreteDataModelLockedRateView *awayEqualView;

@property (nonatomic, strong) JCDiscreteDataModelLockedRateView *awayLoseView;

@property (nonatomic, strong) UILabel *homeDiscreteLab;

@property (nonatomic, strong) UILabel *awayDiscreteLab;

@property (nonatomic, strong) UILabel *homeWinLab;

@property (nonatomic, strong) UILabel *homeEqualLab;

@property (nonatomic, strong) UILabel *homeLoseLab;

@property (nonatomic, strong) UILabel *awayWinLab;

@property (nonatomic, strong) UILabel *awayEqualLab;

@property (nonatomic, strong) UILabel *awayLoseLab;

@property (nonatomic, strong) UILabel *winRateLab;

@property (nonatomic, strong) UILabel *equalRateLab;

@property (nonatomic, strong) UILabel *loseRateLab;

@property (nonatomic, strong) UILabel *zhishuLab;

@property (nonatomic, strong) JCDiscreteDataModelTrackView *trajectoryView;

@property (nonatomic, strong) NSString *homeWinValue;
@property (nonatomic, strong)NSString *homeEqualValue;
@property (nonatomic, strong)NSString *homeLoseValue;

@property (nonatomic, strong)NSString *awayWinValue;
@property (nonatomic, strong)NSString *awayEqualValue;
@property (nonatomic, strong)NSString *awayLoseValue;

@property (nonatomic, strong) JCKellyDataModelModel *model;




@end

NS_ASSUME_NONNULL_END
