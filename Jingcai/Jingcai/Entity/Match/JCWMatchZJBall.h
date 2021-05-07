//
//  JCWMatchZJBall.h
//  Jingcai
//
//  Created by Rain on 2018/11/8.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN
@interface JCWMatchZJBall : JCWBaseBall
@property (strong, nonatomic) NSString * home_team;
@property (strong, nonatomic) NSString * guest_team;
@property (strong, nonatomic) NSString * league;
@property (strong, nonatomic) NSString * score;
@property (strong, nonatomic) NSString * game_start_time;
@end
NS_ASSUME_NONNULL_END
