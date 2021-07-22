//
//  JCMatchHomeListTableViewCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/6/16.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCMatchInfoModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCMatchHomeListTableViewCell : JCBaseTableViewCell_New

@property (nonatomic, strong) UILabel *matchNameLab;//联赛名称

@property (nonatomic, strong) UILabel *matchTimeLab;//比赛时间

@property (nonatomic, strong) UILabel *matchWeekLab;//周一001

@property (nonatomic, strong) UILabel *matchStatusLab;//比赛状态

//@property (nonatomic, strong) UILabel *ongoingTimeLab;//比赛进行时间

@property (nonatomic, strong) UIButton *collectionBtn;//收藏

@property (nonatomic, strong) UIImageView *vsImgView;

@property (nonatomic, strong) UILabel *scoreLab;//比分

@property (nonatomic, strong) UIImageView *zbImgView;//直播标识

@property (nonatomic, strong) UIImageView *bigDataImgView;//鲸猜大数据标识

@property (nonatomic, strong) UILabel *homeTeamLab;

@property (nonatomic, strong) UILabel *awayTeamLab;

//@property (nonatomic, strong) UIImageView *homeTeamImgView;
//
//@property (nonatomic, strong) UIImageView *awayTeamImgView;

@property (nonatomic, strong) UILabel *halfScoreLab;//半场比分

@property (nonatomic, strong) UILabel *planCountLab;//方案数量

@property (nonatomic, strong) UILabel *neutralLab;//中立场

@property (nonatomic, strong) UILabel *home_red_Lab;

@property (nonatomic, strong) UILabel *home_yellow_Lab;

@property (nonatomic, strong) UILabel *away_red_Lab;

@property (nonatomic, strong) UILabel *away_yellow_Lab;

@property (nonatomic, strong) JCMatchInfoModel *model;

@property (nonatomic, copy) void(^JCConcernBlock)(void);

@end

NS_ASSUME_NONNULL_END
