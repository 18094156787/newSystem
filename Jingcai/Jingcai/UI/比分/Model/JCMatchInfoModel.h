//
//  JCMatchInfoModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/6/18.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCMatchInfoModel : JCWBaseBall

@property (nonatomic,copy) NSString *id;

@property (nonatomic,copy) NSString *leagueName;//联赛名称

@property (nonatomic,copy) NSString *matchCount;//推荐数

@property (nonatomic,copy) NSString *match_competition;

@property (nonatomic,copy) NSString *daytime;

@property (nonatomic,copy) NSString *homeLogo;

@property (nonatomic,copy) NSString *awayLogo;

@property (nonatomic,copy) NSString *js_jc;

@property (nonatomic,copy) NSString *js_bd;

@property (nonatomic,copy) NSString *event_id;

@property (nonatomic,copy) NSString *homeId;

@property (nonatomic,copy) NSString *matchNum;

@property (nonatomic,copy) NSString *matchName;//比赛说明

@property (nonatomic,copy) NSString *kickoffTime;//开始时间

@property (nonatomic,copy) NSString *matchStatus;//1未开始，2是进行中，3已结束 4 推迟 5取消

@property (nonatomic,copy) NSString *homeName;

@property (nonatomic,copy) NSString *awayName;

@property (nonatomic,copy) NSString *awayId;

@property (nonatomic,copy) NSString *fullScore;//比分

@property (nonatomic,copy) NSString *halfScore;//半场比分

@property (nonatomic,copy) NSString *type;

@property (nonatomic,copy) NSString *dev;

@property (nonatomic,copy) NSString *matchType;

@property (nonatomic,copy) NSString *match_collect;//1已收藏 0 未收藏

@property (nonatomic,copy) NSString *homeScore;

@property (nonatomic,copy) NSString *awayScore;//1已收藏 0 未收藏

@property (nonatomic,copy) NSString *hi;

@property (nonatomic,copy) NSString *animation;

#pragma mark //新

//status_id
//
//| 状态码 | 描述
//| ------ | ------------------------------------------------------------------------------
//|0 | 比赛异常，说明:暂未判断具体原因的异常比赛，可能但不限于:腰斩、取消等等，建议隐藏处 理
//|1 | 未开赛
//|2 | 上半场
//|3 |中场
//|4 | 下半场
//|5 | 加时赛
//|6 | 加时赛(弃用)
//|7 | 点球决战
//|8 | 完场
//|9 | 推迟
//|10 |中断
//|11 |腰斩
//|12 |取消
//|13 |待定

@property (strong, nonatomic) NSString  * status_id;

@property (nonatomic,copy) NSString *is_subscribe;//0是未关注,1是已关注

@property (nonatomic,copy) NSString *match_id;//比赛ID

@property (nonatomic,copy) NSString *status_cn;//比赛状态中文

@property (nonatomic,copy) NSString *begin_time;//比赛开始时间

@property (nonatomic,copy) NSString *match_time;////比赛开始时间(关注列表中用)

@property (nonatomic,copy) NSString *first_half_time;//上半场开球时间

@property (nonatomic,copy) NSString *second_half_time;//下半场开球时间

@property (nonatomic,copy) NSString *score;//全场比分

@property (nonatomic,copy) NSString *half_score;//半场比分

@property (nonatomic,copy) NSString *plan_num;//方案个数

@property (nonatomic,copy) NSString *is_live;//是否关注，1是，0否

@property (nonatomic,copy) NSString *round_num;//轮次

@property (nonatomic,copy) NSString *competition_name;//联赛名称

@property (nonatomic,copy) NSString *short_name_zh;//联赛名称(关注列表中用)

@property (nonatomic,copy) NSString *home_team_name;//主队名称

@property (nonatomic,copy) NSString *home_team_logo;//主队球队LOG

@property (nonatomic,copy) NSString *home_team_country_logo;//主队国家对LOGO，有可能为空

@property (nonatomic,copy) NSString *away_team_name;

@property (nonatomic,copy) NSString *away_team_logo;

@property (nonatomic,copy) NSString *away_team_country_logo;

@property (nonatomic,copy) NSString *group_num_new;//空字符串 或者 A组/B组..

@property (nonatomic,copy) NSString *round_num_one;//空字符串 或者 周几001

@property (nonatomic,copy) NSString *round_num_two;//空字符串 或者 第几轮

@property (nonatomic,assign) NSInteger is_have_big_data;//是否有鲸猜大数据 1是 2否

@property (nonatomic,copy) NSString *neutral;//是否中立场，1-是、0-否

@property (nonatomic,copy) NSString *note;//中立场名称 可能为空字符串

@property (nonatomic,copy) NSString *home_corner;//主队角球

@property (nonatomic,copy) NSString *away_corner;//客队角球

@property (nonatomic,copy) NSString *corner_score;//角球比分

@property (nonatomic,copy) NSString *overtime_score;//加时比分

@property (nonatomic,copy) NSString *penalty_score;//点球比分

@property (nonatomic,copy) NSString *winning_team;//胜出队伍名称

@property (nonatomic,copy) NSString *home_red_card;//主队红牌

@property (nonatomic,copy) NSString *away_red_card;//客队红牌

@property (nonatomic,copy) NSString *home_yellow_card;//主队黄牌

@property (nonatomic,copy) NSString *away_yellow_card;//客队黄牌

@property (nonatomic,copy) NSString *is_have_overtime;//是否有 加时赛   1 是 2否

@property (nonatomic,copy) NSString *is_have_penalty;//是否有 点球    1 是 2否

@end

NS_ASSUME_NONNULL_END
