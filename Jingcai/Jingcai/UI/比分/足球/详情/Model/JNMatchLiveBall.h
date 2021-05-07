//
//  JNMatchLiveBall.h
//  Jingcai
//
//  Created by Administrator on 2019/6/19.
//  Copyright © 2019 jingcai. All rights reserved.
//

#import "JCWBaseBall.h"
//| 1 | 进球 | 2 | 角球 | 3 | 黄牌 | 4 | 红牌 | 5 | 界外球 | 6 | 任意球 | 7 | 球门球 | 8 | 点球 | 9 | 换人 | 10 | 比赛开始 | 11 | 中场 | 12 | 结束 | 13 | 半场比分 | 15 | 两黄变红 | 16 | 点球未进 | 17 | 乌龙球 | 19 | 伤停补时 | 21 | 射正 | 22 | 射偏 | 23 | 进攻 | 24 | 危险进攻 | 25 | 控球率 | 26 | 加时赛结束 | 27 | 点球大战结束
NS_ASSUME_NONNULL_BEGIN
@interface JNMatchLiveBall : JCWBaseBall
@property (strong, nonatomic) NSString * id;
@property (strong, nonatomic) NSString * match_id;
@property (strong, nonatomic) NSString * title;
@property (assign, nonatomic) NSInteger main;
@property (strong, nonatomic) NSString * data;
@property (assign, nonatomic) NSInteger type;
@property (strong, nonatomic) NSString * position;
@property (strong, nonatomic) NSString * time;
@property (strong, nonatomic) NSString * status;
@property (strong, nonatomic) NSDate * created_at;
@property (strong, nonatomic) NSDate * updated_at;

//篮球
@property (strong, nonatomic) NSString *per;
@property (strong, nonatomic) NSString *score;
@property (strong, nonatomic) NSString *desc;
@end
NS_ASSUME_NONNULL_END
