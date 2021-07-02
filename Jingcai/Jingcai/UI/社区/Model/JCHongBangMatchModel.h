//
//  JCHongBangMatchModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/25.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCHongBangMatchModel : JCWBaseBall

@property (strong, nonatomic) NSString *match_id;//方案ID

@property (strong, nonatomic) NSString *match_time;

@property (strong, nonatomic) NSString *match_future_time;

@property (strong, nonatomic) NSString *match_long_time;

@property (strong, nonatomic) NSString *competition_name;

@property (strong, nonatomic) NSString *home_team_name;

@property (strong, nonatomic) NSString *home_team_logo;

@property (strong, nonatomic) NSString *away_team_name;

@property (strong, nonatomic) NSString *away_team_logo;

@property (strong, nonatomic) NSString *group_num;//第几组

@property (strong, nonatomic) NSString *round_num;//第几轮

@property (strong, nonatomic) NSString *is_guess;//是否为竞彩

@property (strong, nonatomic) NSString *issue_num;//序号,周几00几

@property (strong, nonatomic) NSString *issue_week;

@property (strong, nonatomic) NSString *matchStatus_desc;

//0:比赛异常1:未开赛2:上半场3:中场4:下半场5:加时赛6:加时赛(弃用)7:点球决战8:完场9:推迟10:中断11:腰斩12:取消13:待定
@property (assign, nonatomic) NSInteger matchStatus;

@property (strong, nonatomic) NSArray *home_scores;

@property (strong, nonatomic) NSArray *away_scores;

#pragma mark//新版本接口

//0:比赛异常1:未开赛2:上半场3:中场4:下半场5:加时赛6:加时赛(弃用)7:点球决战8:完场9:推迟10:中断11:腰斩12:取消13:待定
@property (assign, nonatomic) NSInteger match_status;

@property (strong, nonatomic) NSString * match_status_desc;

@property (nonatomic,copy) NSString *group_num_new;//空字符串 或者 A组/B组..

@property (nonatomic,copy) NSString *round_num_one;//空字符串 或者 周几001

@property (nonatomic,copy) NSString *round_num_two;//空字符串 或者 第几轮

@property (nonatomic,assign) NSInteger is_reverse;//字段，表示比赛是否主客相反，0否，1是


@end

NS_ASSUME_NONNULL_END
