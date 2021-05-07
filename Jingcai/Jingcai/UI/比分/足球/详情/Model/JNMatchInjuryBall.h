//
//  JNMatchInjuryBall.h
//  Jingcai
//
//  Created by Administrator on 2019/6/25.
//  Copyright © 2019 jingcai. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN
@interface JNMatchInjuryBall : JCWBaseBall
@property (strong, nonatomic) NSString * id;
@property (strong, nonatomic) NSString * name;
@property (strong, nonatomic) NSString * position;
@property (strong, nonatomic) NSString * logo;
@property (strong, nonatomic) NSString * reason;
@property (strong, nonatomic) NSString * missed_matches;
@property (strong, nonatomic) NSString * start_time;
@property (strong, nonatomic) NSString * end_time;
@property (assign, nonatomic) NSInteger type;
//{
//    "id": 68368,
//    "name": "加斯帕尼霍姆",
//    "position": "D",
//    "logo": "a4469b5c6b90711847243aa9f7af0716.png",
//    "reason": "胫骨和腓骨骨折",
//    "missed_matches": 41,
//    "start_time": 1520870400,
//    "end_time": 0,
//    "type": 1
//},
@end
NS_ASSUME_NONNULL_END
