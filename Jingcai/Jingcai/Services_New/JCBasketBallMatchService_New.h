//
//  JCBasketBallMatchService_New.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/20.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "BaseService.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCBasketBallMatchService_New : BaseService
//获取某天的比赛数据--篮球
- (void)getMatchListWithType:(NSString *)type EventID:(NSString *)eventID Time:(NSString *)time screening:(NSString *)screening Page:(NSInteger)page Success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//篮球关注列表
- (void)getbBasketBallMatchConcernListWithPage:(NSInteger)page Success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//筛选列表
- (void)getMatchEventListWithTime:(NSString *)time type:(NSString *)type  Success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//篮球比赛搜索
- (void)getBasketBallMatchListWithSearchWord:(NSString *)key_word Page:(NSInteger)page Success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//篮球详情
- (void)getMatchtDetailWithMatch_id:(NSString *)match_id success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//篮球详情-直播
- (void)getBasketBallMatchtDetailZhiboWithMatch_id:(NSString *)match_id success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//篮球详情-方案列表
- (void)getBasketBallMatchPlanListWithMatch_id:(NSString *)match_id Page:(NSInteger)page Success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//篮球详情-统计
- (void)getBasketBalltMatchtDetailTongjiWithMatch_id:(NSString *)match_id success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//篮球详情-指数
//4是让分,3是胜负,5是总分
- (void)getMatchBiFenWithMatchNum:(NSString *)matchNum type:(NSString *)type Page:(NSInteger)page success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//篮球详情-指数详情
//4是让分,3是胜负,5是总分
- (void)getBasketBallZhishuDetailWithMatch_id:(NSString *)match_id company_id:(NSString *)company_id type:(NSString *)type Success:(successBlock)successBlock failure:(failureBlock)failureBlock;


@end

NS_ASSUME_NONNULL_END
