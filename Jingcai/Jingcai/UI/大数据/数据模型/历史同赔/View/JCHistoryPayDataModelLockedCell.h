//
//  JCHistoryPayDataModelLockedCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/9.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCHistoryPayDataModelLockedCell : JCBaseTableViewCell_New

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

@property (nonatomic, strong) UILabel *homeWindLab;

@property (nonatomic, strong) UILabel *homeEqualLab;

@property (nonatomic, strong) UILabel *homeLoseLab;

@property (nonatomic, strong) UILabel *awayWindLab;

@property (nonatomic, strong) UILabel *awayEqualLab;

@property (nonatomic, strong) UILabel *awayLoseLab;

@property (nonatomic,strong) KKPaddingLabel *historyLab;

@end

NS_ASSUME_NONNULL_END
