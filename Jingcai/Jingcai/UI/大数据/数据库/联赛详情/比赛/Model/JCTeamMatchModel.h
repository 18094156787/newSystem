//
//  JCTeamMatchModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/12.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"
#import "JCMatchTeamBall.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCTeamMatchModel : JCWBaseBall

@property (nonatomic,strong) NSString *group;

@property (nonatomic,strong) NSString *match_status;

@property (nonatomic,assign) NSInteger status_id;

@property (nonatomic,strong) NSString *fangan_count;

@property (nonatomic,strong) NSString *homeName;

@property (nonatomic,strong) NSString *awayName;

@property (nonatomic,strong) NSString *homeLogo;

@property (nonatomic,strong) NSString *awayLogo;

@property (nonatomic,strong) NSString *homeScore;

@property (nonatomic,strong) NSString *awayScore;

@property (nonatomic,strong) NSString *home_half_score;

@property (nonatomic,strong) NSString *away_half_score;;

@property (nonatomic,strong) NSString *match_status_color;

@property (nonatomic,strong) NSString *match_score;

//
@property (nonatomic,strong) NSString *event_name;

@property (nonatomic,strong) NSString *event_id;

@property (nonatomic,strong) NSString *event_logo;

@property (nonatomic,strong) NSString *status_desc;

@property (nonatomic,strong) NSString *team_status;

#pragma mark //新版本接口

@property (nonatomic,strong) NSString *match_id;

@property (nonatomic,strong) NSString *match_time;

@property (nonatomic,strong) JCMatchTeamBall *home_team_info;

@property (nonatomic,strong) JCMatchTeamBall *away_team_info;

//球队

@property (nonatomic,strong) NSString *compeition_name;

@property (nonatomic,strong) NSString *home_team_logo;
//
@property (nonatomic,strong) NSString *away_team_logo;
//
@property (nonatomic,strong) NSString *home_team_name;

@property (nonatomic,strong) NSString *away_team_name;

@property (strong, nonatomic) NSString *group_num;//第几组

@property (strong, nonatomic) NSString *round_num;//第几轮

@property (strong, nonatomic) NSString *half_score;

@property (strong, nonatomic) NSString *score;

@property (strong, nonatomic) NSString *plan_num;

@property (nonatomic,copy) NSString *group_num_new;//空字符串 或者 A组/B组..

@property (nonatomic,copy) NSString *round_num_one;//空字符串 或者 周几001

@property (nonatomic,copy) NSString *round_num_two;//空字符串 或者 第几轮
@end

NS_ASSUME_NONNULL_END
