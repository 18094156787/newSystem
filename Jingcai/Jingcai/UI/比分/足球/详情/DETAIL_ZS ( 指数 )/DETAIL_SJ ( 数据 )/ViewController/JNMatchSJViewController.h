//
//  JNMatchSJViewController.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/17.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewController.h"
#import "JNMatchTableBall.h"
#import "JCWMatchBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JNMatchSJViewController : JCBaseTableViewController

@property (strong, nonatomic) NSString *type;//1主队，2客队 默认为1

@property (strong, nonatomic) NSArray * injuryArr;              //伤停情况
@property (strong, nonatomic) NSArray * homeGoalArr;            //进球分布
@property (strong, nonatomic) NSArray * awayGoalArr;            //进球分布
@property (strong, nonatomic) NSArray *lianSaiScoreArray;//联赛积分
//@property (strong, nonatomic) JNMatchTableBall * homeTableBall; //联赛积分
//@property (strong, nonatomic) JNMatchTableBall * awayTableBall; //联赛积分
@property (strong, nonatomic) NSArray * recentArr;              //近期战绩
@property (strong, nonatomic) NSArray * historyArr;             //历史交锋
@property (strong, nonatomic) JCMatchBall * matchBall;         //主队名

@end

NS_ASSUME_NONNULL_END
