//
//  JCWTjInfoMatchBall.h
//  Jingcai
//
//  Created by Rain on 2018/11/7.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"
#import "JCWTjInfoOddsBall.h"
//1主胜 2平 3客胜 如果是让球 则为让胜 让平 让负 下同

NS_ASSUME_NONNULL_BEGIN
@interface JCWTjInfoMatchBall : JCWBaseBall
@property (strong, nonatomic) NSString * homeName;
@property (strong, nonatomic) NSString * awayName;
@property (strong, nonatomic) NSString * leagueName;
@property (assign, nonatomic) NSInteger is_rq;//是否让球 1不让球  2让球  3 亚盘  4 混搭（2条）
@property (strong, nonatomic) NSString * matchName;
@property (strong, nonatomic) NSArray <JCWTjInfoOddsBall *> * now_pl;
//@property (strong, nonatomic) JCWTjInfoOddsBall * now_pl;
@property (strong, nonatomic) NSArray <JCWTjInfoOddsBall *> * old_pl;
//@property (strong, nonatomic) JCWTjInfoOddsBall * old_pl;
@property (strong, nonatomic) NSString * spf;
@property (strong, nonatomic) NSString * spf_result;
@property (strong, nonatomic) NSString * spf_result2;
@property (strong, nonatomic) NSString * rq;

#pragma mark - 扩展
//@property (assign, readonly, nonatomic) BOOL hasSpfResult; //是否有结果
@property (strong, readonly, nonatomic) NSString * spfStr; //预测
@property (strong, readonly, nonatomic) NSString * tjPlStr; //推荐赔率
@property (strong, readonly, nonatomic) NSString * rqtjPlStr; //让球推荐赔率
@property (strong, readonly, nonatomic) NSString * jsPlStr; //即时赔率
@property (strong, readonly, nonatomic) NSString * rqjsPlStr; //让球即使赔率
@property (strong, readonly, nonatomic) NSString * spfResultStr; //结果
@property (assign, readonly, nonatomic) BOOL isMulti; //是否为混合类型(is_rq==4)
@property (assign, readonly, nonatomic) BOOL isShowRq; //是否显示让球
@property (strong, readonly, nonatomic) NSString * rqStr;
@end
NS_ASSUME_NONNULL_END
