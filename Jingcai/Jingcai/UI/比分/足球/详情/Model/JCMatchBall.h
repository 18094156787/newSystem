//
//  JCMatchBall.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/19.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"
#import "JCMatchTeamBall.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCMatchBall : JCWBaseBall

@property (nonatomic,copy) NSString *id;//比赛id

@property (nonatomic,copy) NSString *season_id;//赛季id

@property (nonatomic,copy) NSString *competition_id;//赛事id

@property (nonatomic,copy) NSString *home_team_id;

@property (nonatomic,copy) NSString *away_team_id;

//0:比赛异常1:未开赛2:上半场3:中场4:下半场5:加时赛6:加时赛(弃用)7:点球决战8:完场9:推迟10:中断11:腰斩12:取消13:待定
@property (nonatomic,assign) NSInteger status_id;//

@property (nonatomic,copy) NSString *match_time;//比赛时间

@property (nonatomic,copy) NSString *neutral;//是否中立场，1-是、0-否

@property (nonatomic,strong) NSArray *home_scores;

@property (nonatomic,strong) NSArray *away_scores;

@property (nonatomic,copy) NSString *home_position;//主队排名

@property (nonatomic,copy) NSString *away_position;//客队排名

@property (nonatomic,copy) NSString *coverage_mlive;//是否有动画1-是、0-否

@property (nonatomic,copy) NSString *coverage_intelligence;//是否有情报1-是、0-否

@property (nonatomic,copy) NSString *coverage_lineup;//是否有阵容1-是、0-否

@property (nonatomic,copy) NSString *venue_id;//场馆id

@property (nonatomic,copy) NSString *referee_id;//裁判id

@property (nonatomic,copy) NSString *stage_id;//阶段id

@property (nonatomic,copy) NSString *group_num;//第几组，1-A、2-B以此类推

@property (nonatomic,copy) NSString *round_num;//第几轮

@property (nonatomic,assign) NSInteger is_guess;//是否竞彩:101竞彩足球

@property (nonatomic,assign) NSInteger is_bd;//是否北单：301-北单胜负过关，404-北单让球胜平负

@property (nonatomic,copy) NSString *first_half_time;//上半场开始时间

@property (nonatomic,copy) NSString *second_half_time;//下半场开始时间

@property (nonatomic,copy) NSString *cur_time;//当前时间

@property (nonatomic,copy) NSString *is_plan_index;//是否在方案首页显示 0不显示 1显示

@property (nonatomic,copy) NSString *get_match_time;//比赛时间

@property (nonatomic,copy) NSString *home_half_score;//主队半场得分

@property (nonatomic,copy) NSString *away_half_score;//客队半场得分

@property (nonatomic,copy) NSString *home_all_score;//主队全场得分

@property (nonatomic,copy) NSString *away_all_score;//客队全场得分

@property (nonatomic,copy) NSString *animation_url;//直播链接

@property (nonatomic,copy) NSString *live_url;

@property (nonatomic,strong) JCMatchTeamBall *competition;

@property (nonatomic,strong) JCMatchTeamBall *home_team;

@property (nonatomic,strong) JCMatchTeamBall *away_team;

@property (nonatomic,copy) NSString *status_cn;

@property (nonatomic,assign) NSInteger is_have_ai_big_tab;//是否有鲸猜大数据 1有 2没有

@property (nonatomic,assign) NSInteger type;//1 本场比赛延期 2 本场比赛取消 3 没有查看权限  4 显示全部数据 type 5 本场比赛已结束

@property (nonatomic,copy) NSString *group_num_new;//空字符串 或者 A组/B组..

@property (nonatomic,copy) NSString *round_num_one;//空字符串 或者 周几001

@property (nonatomic,copy) NSString *round_num_two;//空字符串 或者 第几轮


 +(NSString *)getMatchStatus:(NSInteger)status_id;

@end

NS_ASSUME_NONNULL_END
