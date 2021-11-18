//
//  JCHistoryPayDataModelOpenCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/9.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCHistoryPayDataModelRateView.h"
#import "JCKellyDataModelModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCHistoryPayDataModelOpenCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UIView *bgView;

@property (nonatomic, strong) UILabel *matchNameLab;//联赛名称

@property (nonatomic, strong) UILabel *matchTimeLab;//比赛时间

@property (nonatomic, strong) UILabel *matchStatusLab;//比赛状态

@property (nonatomic, strong) UIImageView *homeTeamImgView;//

@property (nonatomic, strong) UIImageView *awayTeamImgView;//

@property (nonatomic, strong) UILabel *homeTeamLab;

@property (nonatomic, strong) UILabel *awayTeamLab;

@property (nonatomic, strong) UILabel *scoreLab;//比分

@property (nonatomic, strong) UILabel *chuLab;//初赔

@property (nonatomic, strong) UILabel *jiLab;//即赔

@property (nonatomic, strong) UIButton *lockBtn;

@property (nonatomic, strong) JCHistoryPayDataModelRateView *homeWinView;

@property (nonatomic, strong) JCHistoryPayDataModelRateView *homeEqualView;

@property (nonatomic, strong) JCHistoryPayDataModelRateView *homeLoseView;

@property (nonatomic, strong) JCHistoryPayDataModelRateView *awayWinView;

@property (nonatomic, strong) JCHistoryPayDataModelRateView *awayEqualView;

@property (nonatomic, strong) JCHistoryPayDataModelRateView *awayLoseView;

@property (nonatomic,strong) UIImageView *resultImgView;

@property (nonatomic,strong) UILabel *historyLab;

@property (nonatomic,strong) UIView *bottomView;

@property (nonatomic,strong) UILabel *resultLab;

@property (nonatomic,strong) UILabel *tipLab;

@property (nonatomic, strong) JCKellyDataModelModel *model;

@end

NS_ASSUME_NONNULL_END
