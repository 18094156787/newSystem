//
//  JNMatchZJBall.h
//  Jingcai
//
//  Created by Administrator on 2019/6/25.
//  Copyright © 2019 jingcai. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN
@interface JNMatchZJBall : JCWBaseBall
@property (strong, nonatomic) NSString * home_name;
@property (strong, nonatomic) NSString * away_name;
@property (strong, nonatomic) NSString * full;
#pragma mark 新版本接口
@property (strong, nonatomic) NSString * match_time;
@property (strong, nonatomic) NSString * match_home_team_name;
@property (strong, nonatomic) NSString * match_away_team_name;
@property (strong, nonatomic) NSString * match_home_goal_nums;
@property (strong, nonatomic) NSString * match_away_goal_nums;

@property (strong, nonatomic) NSString *get_time;

@property (strong, nonatomic) NSString *score;


@end
NS_ASSUME_NONNULL_END
