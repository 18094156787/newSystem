//
//  JCBasketBallMatchBall.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/7.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCBasketBallMatchBall : JCWBaseBall


@property (strong, nonatomic) NSString  * competition_name;

@property (strong, nonatomic) NSString  * home_name;

@property (strong, nonatomic) NSString  * away_name;

@property (strong, nonatomic) NSString  * home_logo;

@property (strong, nonatomic) NSString  * away_logo;

@property (strong, nonatomic) NSString  * is_show_half_score;

@property (strong, nonatomic) NSString  * home_half_score;

@property (strong, nonatomic) NSString  * away_half_score;

@property (strong, nonatomic) NSString  * match_name;

@property (strong, nonatomic) NSString  * match_time_desc;

@property (strong, nonatomic) NSArray  * home_score_array;

@property (strong, nonatomic) NSArray  *away_score_array;

@property (strong, nonatomic) NSString  *home_odds;//封盘 or 赔率 or 空字符串

@property (strong, nonatomic) NSString  *away_odds;//封盘 or 赔率 or 空字符串

@property (strong, nonatomic) NSString  *daytime;

@property (strong, nonatomic) NSString  *mmdd;////进行中的比赛专用

@property (strong, nonatomic) NSString  *tuijian_count;//推荐个数

@property (strong, nonatomic) NSString  *trend_count;//比赛节数

@property (strong, nonatomic) NSString  *round_num;

//@property (strong, nonatomic) NSString  *is_subscribe;

#pragma mark//新版本接口

//status_id
//
//| 状态码 |
//
//0 | 比赛异常，说明：暂未判断具体原因的异常比赛，可能但不限于：腰斩、取消等等，建议隐藏处理 |
//
//1 | 未开赛 |
//
//2 | 第一节 |
//
//3 | 第一节完 |
//
//4 | 第二节 |
//
//5 | 第二节完 |
//
//6 | 第三节 |
//
//7 | 第三节完 |
//
//8 | 第四节 |
//
//9 | 加时 |
//
//10 | 完场 |
//
//11 | 中断 |
//
//12 | 取消 |
//
//13 | 延期 |
//
//14 | 腰斩 |
//
//15 | 待定

@property (strong, nonatomic) NSString  * status_id;

@property (strong, nonatomic) NSString  *id;

@property (strong, nonatomic) NSString  *competition_id;

@property (strong, nonatomic) NSString  *home_team_id;

@property (strong, nonatomic) NSString  *away_team_id;

@property (strong, nonatomic) NSString  * match_time;

@property (strong, nonatomic) NSString  *get_match_time;//时间戳

@property (strong, nonatomic) NSString  *surplus_seconds;

@property (strong, nonatomic) NSString  *neutral;

@property (assign, nonatomic) NSInteger  kind;

@property (strong, nonatomic) NSString  *kindType;

@property (strong, nonatomic) NSString  *count;//推荐个数

@property (strong, nonatomic) NSArray  *home_scores;

@property (strong, nonatomic) NSArray  *away_scores;

@property (strong, nonatomic) NSArray  * home_scores_array;

@property (strong, nonatomic) NSArray  *away_scores_array;

@property (strong, nonatomic) NSString  *period_count;

@property (strong, nonatomic) NSString  *mlive;

@property (strong, nonatomic) NSString  *intelligence;

@property (strong, nonatomic) NSString  *venue_id;

@property (strong, nonatomic) NSString  *match_id;

@property (strong, nonatomic) NSString  *home_team_name;

@property (strong, nonatomic) NSString  *away_team_name;

@property (strong, nonatomic) NSString  *status_cn;

@property (strong, nonatomic) NSString  *use_seconds_gm_date;

@property (strong, nonatomic) NSString  *plan_num;

@property (strong, nonatomic) NSString  *is_subscribe;

@property (strong, nonatomic) NSString  *basketball_short_name_zh;

@property (strong, nonatomic) NSString  *home_team_logo;

@property (strong, nonatomic) NSString  *away_team_logo;

@property (strong, nonatomic) NSString  *home_scores_half_sum;//主队半场比分

@property (strong, nonatomic) NSString  *away_scores_half_sum;//客队半场比分

@property (strong, nonatomic) NSString  *home_scores_sum;//主队总分

@property (strong, nonatomic) NSString  *away_scores_sum;//客队队总分


@end

NS_ASSUME_NONNULL_END
