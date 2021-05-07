//
//  JCWMatchPLBall.h
//  Jingcai
//
//  Created by Administrator on 2019/5/13.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN
@interface JCWMatchPLBall : JCWBaseBall
@property (strong, nonatomic) NSString * id;
@property (strong, nonatomic) NSString * match_num;
@property (strong, nonatomic) NSString * company_id;
@property (strong, nonatomic) NSString * company_name;
@property (strong, nonatomic) NSString * condition;
@property (strong, nonatomic) NSString * win;
@property (strong, nonatomic) NSString * lose;
@property (strong, nonatomic) NSString * equal;
@property (assign, nonatomic) NSInteger rq;
@property (strong, nonatomic) NSString * lrq;
@property (assign, nonatomic) NSInteger type;
@property (assign, nonatomic) NSInteger status;
@property (strong, nonatomic) NSDate * created_at;
@property (strong, nonatomic) NSDate * updated_at;
//{
//    "id": "412526",
//    "match_num": "118957",
//    "company_id": "-2",
//    "company_name": "竞彩网",
//    "win": "1.94",
//    "lose": "2.82",
//    "equal": "3.45",
//    "rq": "0",
//    "lrq": "",
//    "type": "0",
//    "status": "1",
//    "created_at": "2019-05-10 21:31:04",
//    "updated_at": "2019-05-10 21:31:04"
//},z
@end
NS_ASSUME_NONNULL_END
