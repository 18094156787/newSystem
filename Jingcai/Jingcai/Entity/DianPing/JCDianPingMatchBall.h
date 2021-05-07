//
//  JCDianPingMatchBall.h
//  Jingcai
//
//  Created by Administrator on 2019/2/19.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN
@interface JCDianPingMatchBall : JCWBaseBall

@property (strong, nonatomic) NSString * match_num;

@property (strong, nonatomic) NSString * match_name;

@property (strong, nonatomic) NSString * type_desc;

@property (strong, nonatomic) NSString * league_name;

@property (strong, nonatomic) NSString * home_name;

@property (strong, nonatomic) NSString * away_name;

@property (strong, nonatomic) NSString *away_logo;

@property (strong, nonatomic) NSString *homo_logo;

@property (strong, nonatomic) NSString *matchStatus;

@property (strong, nonatomic) NSString *full_home;

@property (strong, nonatomic) NSString *full_away;

@property (strong, nonatomic) NSString *home_score;

@property (strong, nonatomic) NSString *away_score;

@property (assign, nonatomic) NSInteger classfly;

@property (strong, nonatomic) NSString *ymd;

#pragma mark //新版本接口

@property (strong, nonatomic) NSString *round_num;

@property (strong, nonatomic) NSString *match_time;

@property (strong, nonatomic) NSString *match_time_two;

@property (strong, nonatomic) NSString *home_team_name;

@property (strong, nonatomic) NSString *away_team_name;

@property (strong, nonatomic) NSString *home_team_logo;

@property (strong, nonatomic) NSString *away_team_logo;

@property (strong, nonatomic) NSString *status_cn;

@property (strong, nonatomic) NSString *wl;

@property (strong, nonatomic) NSString *match_id;

@property (strong, nonatomic) NSString *status_id;

@property (strong, nonatomic) NSString *competition_name;

@property (strong, nonatomic) NSString *home_scores;

@property (strong, nonatomic) NSString *away_scores;





@end
NS_ASSUME_NONNULL_END
