//
//  JCPoissonDataModelOpenCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/10.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCPoissonDataModelOpenCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UIView *bgView;

@property (nonatomic, strong) UILabel *matchNameLab;//联赛名称

@property (nonatomic, strong) UILabel *matchTimeLab;//比赛时间

@property (nonatomic, strong) UILabel *matchStatusLab;//比赛状态

@property (nonatomic, strong) UIImageView *homeTeamImgView;//

@property (nonatomic, strong) UIImageView *awayTeamImgView;//

@property (nonatomic, strong) UILabel *homeTeamLab;

@property (nonatomic, strong) UILabel *awayTeamLab;

@property (nonatomic, strong) UILabel *scoreLab;//比分

@property (nonatomic, strong) UILabel *homeLab;

@property (nonatomic, strong) UILabel *awayLab;

@property (nonatomic, strong) UIView *homeView;

@property (nonatomic, strong) UIView *awaiView;

@property (nonatomic, strong) UILabel *homeWinLab;

@property (nonatomic, strong) UILabel *homeEqualLab;

@property (nonatomic, strong) UILabel *homeLoseLab;

@property (nonatomic, strong) UILabel *awayWinLab;

@property (nonatomic, strong) UILabel *awayEqualLab;

@property (nonatomic, strong) UILabel *awayLoseLab;



//@property (nonatomic, strong) UIButton *lockBtn;

@end

NS_ASSUME_NONNULL_END
