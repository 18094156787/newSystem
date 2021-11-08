//
//  JCWVerTjInfoMatchBall.h
//  Jingcai
//
//  Created by Administrator on 2019/3/13.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"
#import "JCWVerTjInfoPlBall.h"
typedef NS_ENUM(NSInteger, JCWVerTjInfoMatchResult) {
    JCWVerTjInfoMatchResultUnknown,     //未知
    JCWVerTjInfoMatchResultHomeWin,     //(主队)主胜
    JCWVerTjInfoMatchResultHomeEqual,   //(主队)平
    JCWVerTjInfoMatchResultHomeLose,    //(主队)客胜
    JCWVerTjInfoMatchResultAwayWin,     //(客队)主胜
    JCWVerTjInfoMatchResultAwayEqual,   //(客队)平
    JCWVerTjInfoMatchResultAwayLose,    //(客队)客胜
};

NS_ASSUME_NONNULL_BEGIN
@interface JCWVerTjInfoMatchBall : JCWBaseBall
@property (nonatomic, strong) NSString * full_home_score;
@property (nonatomic, strong) NSString * full_away_score;
@property (nonatomic, strong) NSString * matchTime;
@property (nonatomic, strong) NSString * matchName;
@property (nonatomic, strong) NSString * homeName;
@property (nonatomic, strong) NSString * awayName;
@property (nonatomic, strong) NSString * spf;
@property (nonatomic, strong) NSString * spf_new;//专家推荐的第一个结果
@property (nonatomic, strong) NSString * spf_new2;//专家推荐的第二个结果
@property (nonatomic, strong) NSString * is_rq;//如果==2,则spf_result只返回123,表示让球,相当于456
@property (nonatomic, strong) NSString * rq;
@property (nonatomic, strong) NSString * spf_result;//开奖第一个结果
@property (nonatomic, strong) NSString * spf_result2;//开奖第二个结果
@property (nonatomic, strong) NSString * leagueName;
@property (nonatomic, strong) NSString * match_num;
@property (nonatomic, strong) NSString * fx_number;//分享次数
@property (nonatomic, strong) NSString * dz_number;//点赞次数
@property (assign, nonatomic) NSInteger wl;// 0未开始 1红 2黑 3赢半 4输半 5走水 6延迟 7取消
@property (assign, readonly, nonatomic) BOOL isResultWin;//红

@property (assign, readonly, nonatomic) BOOL isResultLose;//黑

@property (assign, readonly, nonatomic) BOOL isResultWater;//走水

@property (assign, readonly, nonatomic) BOOL isYanqi;//延期

@property (assign, readonly, nonatomic) BOOL isQuXiao;//取消
@property (nonatomic, strong) NSDictionary * old_pl;
@property (nonatomic, strong) NSDictionary * rold_pl;



@property (nonatomic, strong) JCWVerTjInfoPlBall * no_rq_odds;
@property (nonatomic, strong) JCWVerTjInfoPlBall * rq_odds;


#pragma mark - 扩展
@property (nonatomic, readonly, strong) JCWVerTjInfoPlBall * old_plBall;
@property (nonatomic, readonly, strong) JCWVerTjInfoPlBall * rold_plBall;
//@property (nonatomic, readonly, strong) NSArray * ycArr;
//@property (nonatomic, readonly, strong) NSArray * resArr;
@property (nonatomic, readonly, assign) JCWVerTjInfoMatchResult res_yc;
@property (nonatomic, readonly, assign) JCWVerTjInfoMatchResult res_ycRQ;
@property (nonatomic, readonly, assign) JCWVerTjInfoMatchResult res_end;
@property (nonatomic, readonly, assign) JCWVerTjInfoMatchResult res_endRQ;

#pragma mark cjw

@property (nonatomic, strong) NSString *name;

@property (nonatomic, strong) NSString *option;

@property (nonatomic, strong) NSString *spf_name;

@property (nonatomic, strong) NSString *matchInfo;

@property (nonatomic, strong) NSString *homeLogo;

@property (nonatomic, strong) NSString *awayLogo;

@property (nonatomic, strong) NSString *classfly_name;

@property (nonatomic, assign) NSInteger classfly;//玩法 1欧指 2 让球 3进球数 4 竟足 999 自定义 101 胜负 102让分 103 总分
@property (nonatomic, assign) NSInteger matchStatus;////0:比赛异常1:未开赛2:上半场3:中场4:下半场5:加时赛6:加时赛(弃用)7:点球决战8:完场9:推迟10:中断11:腰斩12:取消13:待定

@property (nonatomic, strong) NSString *matchStatus_desc;

@property (nonatomic, strong) NSString *type_desc;

@property (nonatomic, strong) NSString *classfly_desc;

@property (nonatomic, strong) NSString *column_id;//1足球 2篮球 3电竞

@property (nonatomic, strong) NSString *issue_num;

@property (nonatomic, strong) NSString *event_name;

@property (nonatomic, strong) NSString *home_name;

@property (nonatomic, strong) NSString *away_name;

@property (nonatomic, strong) NSString *match_time;

@property (nonatomic,copy) NSString *group_num_new;//空字符串 或者 A组/B组..

@property (nonatomic,copy) NSString *round_num_one;//空字符串 或者 周几001

@property (nonatomic,copy) NSString *round_num_two;//空字符串 或者 第几轮

@end
NS_ASSUME_NONNULL_END
