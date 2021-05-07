//
//  JCWMatchBall.h
//  Jingcai
//
//  Created by Rain on 2018/11/5.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN
@interface JCWMatchBall : JCWBaseBall
@property (strong, nonatomic) NSString  * matchNum;
@property (strong, nonatomic) NSString  * leagueName;
@property (strong, nonatomic) NSString  * fullScore;
@property (strong, nonatomic) NSString  * halfScore;
@property (strong, nonatomic) NSString  * homeScore;
@property (strong, nonatomic) NSString  * awayScore;
@property (strong, nonatomic) NSString  * homeName;
@property (strong, nonatomic) NSString  * awayId;
@property (strong, nonatomic) NSString  * matchNowScore;
@property (strong, nonatomic) NSString  * awayLogo;
@property (strong, nonatomic) NSString  * homeLogo;
@property (strong, nonatomic) NSString  * kickoffTime;
@property (strong, nonatomic) NSString  * matchTime;
@property (strong, nonatomic) NSString  * matchName;
@property (strong, nonatomic) NSString  * awayName;
@property (strong, nonatomic) NSString  * homeId;
@property (assign, nonatomic) NSInteger matchStatus;//1未开始，2是进行中，3已结束
@property (strong, nonatomic) NSString  * matchFull;
@property (assign, nonatomic) NSInteger matchType; //比赛类型  1足球 2 篮球
@property (assign, nonatomic) NSInteger matchCount;
@property (strong, nonatomic) NSString  * match_competition;
@property (strong, nonatomic) NSString  *animation;// 是否有动画直播
@property (strong, nonatomic) NSString  *animation_url;//动画直播链接
@property (strong, nonatomic) NSString  *live_url;
@property (assign, nonatomic) NSInteger dev;


#pragma mark - 扩展
//@property (strong, readonly, nonatomic) NSString * checked_homeLogo;
//@property (strong, readonly, nonatomic) NSString * checked_awayLogo;
//@property (strong, readonly, nonatomic) NSString * matchStatusString;
//@property (strong, readonly, nonatomic) NSString * introString;
//@property (strong, readonly, nonatomic) NSString * introFullString;
@property (strong, readonly, nonatomic) NSString * matchCountString;
@property (strong, readonly, nonatomic) NSString * listIntroString;
@property (strong, readonly, nonatomic) NSString * detailIntroString;

@property (assign, readonly, nonatomic) BOOL isTypeZQ; //是否为足球
@property (assign, readonly, nonatomic) BOOL isTypeLQ; //是否为篮球
@property (assign, nonatomic) NSInteger is_jc; //是否为竞彩
@property (assign, nonatomic) NSInteger is_bd; //是否为北单
@property (strong, readonly, nonatomic) NSString * statusZQ;
@property (strong, readonly, nonatomic) NSString * statusLQ;
@property (assign, nonatomic) NSInteger is_ai;//is_ai 0没有数据 1有 2取消 3延迟 4过期
- (BOOL)isInProgress;//是否进行中
#pragma mark - 扩展
- (NSString *)numberOfFangAn;   //方案个数
- (NSString *)introOfList;      //列表简介
- (NSString *)introOfDetail;    //详情简介
- (NSString *)introOfService;   //服务简介

#pragma mark //新版本接口

@property (strong, nonatomic) NSString  *match_long_time;

@property (strong, nonatomic) NSString  *match_id;

@property (strong, nonatomic) NSString  * competition_name;

@property (strong, nonatomic) NSString  * home_team_name;

@property (strong, nonatomic) NSString  * away_team_name;

@property (strong, nonatomic) NSString  * home_team_logo;

@property (strong, nonatomic) NSString  * away_team_logo;

@property (strong, nonatomic) NSString  *plan_num;//推荐数

@property (strong, nonatomic) NSString  *round_num;

@property (strong, nonatomic) NSString  *first_half_time;

@property (strong, nonatomic) NSString  *second_half_time;

@property (strong, nonatomic) NSString  *status_id;

@property (strong, nonatomic) NSString  *status_cn;



@end
NS_ASSUME_NONNULL_END
