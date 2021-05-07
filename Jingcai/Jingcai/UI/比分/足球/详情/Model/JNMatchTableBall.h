//
//  JNMatchTableBall.h
//  Jingcai
//
//  Created by Administrator on 2019/6/25.
//  Copyright © 2019 jingcai. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN
@interface JNMatchTableBall : JCWBaseBall
@property (strong, nonatomic) NSString * title;
@property (strong, nonatomic) NSString * position;
@property (strong, nonatomic) NSString * pts;
@property (strong, nonatomic) NSString * played;
@property (strong, nonatomic) NSString * won;
@property (strong, nonatomic) NSString * drawn;
@property (strong, nonatomic) NSString * lost;
@property (strong, nonatomic) NSString * goals;
@property (strong, nonatomic) NSString * away_goals;
@property (strong, nonatomic) NSString * against;
@property (strong, nonatomic) NSString * diff;
@property (strong, nonatomic) NSString * team_id;
//"home": {
//    "position": 3,
//    "pts": 14,
//    "played": 6,
//    "won": 4,
//    "drawn": 2,
//    "lost": 0,
//    "goals": 14,
//    "away_goals": 0,
//    "against": 5,
//    "diff": 9,
//    "team_id": 10153
//},
@end
NS_ASSUME_NONNULL_END
