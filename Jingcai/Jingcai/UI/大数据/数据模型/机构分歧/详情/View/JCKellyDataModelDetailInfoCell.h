//
//  JCKellyDataModelDetailInfoCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/12.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCKellyDataModelOpenRateView.h"
#import "JCKellyDataModelTrackView.h"
#import "JCKellyDataDetailModel.h"
#import "JCKellyDataModelOpenView.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCKellyDataModelDetailInfoCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UIView *bgView;

@property (nonatomic, strong) UILabel *matchNameLab;//联赛名称

@property (nonatomic, strong) UILabel *matchTimeLab;//比赛时间

@property (nonatomic, strong) UILabel *matchStatusLab;//比赛状态

@property (nonatomic, strong) UIImageView *homeTeamImgView;//

@property (nonatomic, strong) UIImageView *awayTeamImgView;//

@property (nonatomic, strong) UILabel *homeTeamLab;

@property (nonatomic, strong) UILabel *awayTeamLab;

@property (nonatomic, strong) UILabel *scoreLab;//比分

@property (nonatomic, strong) JCKellyDataModelOpenView *zhishuView;

@property (nonatomic, strong) JCKellyDataModelOpenView *fenqiView;//分歧

@property (nonatomic, strong) JCKellyDataModelOpenView *fangchaView;//方差

@property (nonatomic, strong) UILabel *homeRateLab;

@property (nonatomic, strong) UILabel *awayRateLab;

@property (nonatomic,strong) KKPaddingLabel *historyLab;

@property (nonatomic, strong) NSString *homeWinValue;

@property (nonatomic, strong) NSString *homeEqualValue;

@property (nonatomic, strong) NSString *homeLoseValue;

@property (nonatomic, strong) NSString *awayWinValue;

@property (nonatomic, strong) NSString *awayEqualValue;

@property (nonatomic, strong) NSString *awayLoseValue;

@property (nonatomic, strong) JCKellyDataDetailModel *model;

@end

NS_ASSUME_NONNULL_END
