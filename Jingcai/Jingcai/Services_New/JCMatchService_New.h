//
//  JCMatchService_New.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/12/29.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "BaseService.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCMatchService_New : BaseService

#pragma mark 足球
//获取日期列表
//type 1赛程 2已完场 不传 默认1
- (void)getMatchTimeListWithType:(NSString *)type success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//获取比赛列表数据
- (void)getMatchListWithType:(NSString *)type EventID:(NSString *)eventID Time:(NSString *)time screening:(NSString *)screening Page:(NSInteger)page Success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//预测的比赛
//type 1 带上搜索 2 不带上搜索 默认2
//key_word ype 等于 一 需要带上
- (void)getPredictedMatchListWithType:(NSString *)type Key_word:(NSString *)key_word Page:(NSInteger)page Success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//足球比赛搜索
- (void)getFootBallMatchListWithSearchWord:(NSString *)key_word Page:(NSInteger)page Success:(successBlock)successBlock failure:(failureBlock)failureBlock;

//筛选列表
- (void)getMatchEventListWithTime:(NSString *)time type:(NSString *)type Success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//关注,取消关注比赛
//category 类型 1足球 2篮球 3电竞 不传 默认 1
- (void)getMatchConcernWithMatchnum:(NSString *)matchnum match_time:(NSString *)match_time category:(NSString *)category success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//足球关注比赛列表
- (void)getFootBallMatchConcernListWithPage:(NSInteger)page pageSize:(NSInteger)page_size Success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//赛程详情-头部
- (void)getFootBallMatchDetailTopWithMatchnum:(NSString *)matchnum success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//赛程详情-方案列表
- (void)getFootBallMatchPlanListWithMatch_id:(NSString *)match_id Page:(NSInteger)page Success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//赛程详情-直播
- (void)getMatchLiveWithMatchnum:(NSString *)matchnum success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//赛程详情-情报
- (void)getMatchQingBaoWithMatchnum:(NSString *)matchnum success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//赛程详情-竞足指数
- (void)getJZZhishuWithMatch_id:(NSString *)matchnum success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//赛程详情-北单指数
- (void)getBDZhishuWithMatch_id:(NSString *)matchnum success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//赛程详情-指数 通过比赛id获取欧指/亚赔/大小球列表
//类型 3欧指，4亚指，5大小球
- (void)getOPZhishuWithMatch_id:(NSString *)match_id type:(NSString *)type Page:(NSInteger)page Success:(successBlock)successBlock failure:(failureBlock)failureBlock;

//通过比赛id公司ID类型 获取欧指/亚赔/大小球指数详情
//类型 3欧指，4亚指，5大小球
- (void)getOPZhishuDetailWithMatch_id:(NSString *)match_id company_id:(NSString *)company_id type:(NSString *)type Success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//赛程详情-阵容
- (void)getMatchZhenrongWithMatchnum:(NSString *)matchnum success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//赛程详情-数据
- (void)getMatchDataWithMatchnum:(NSString *)matchnum success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//是否有鲸猜大数据
- (void)getMatchHaveBigDataWithMatchnum:(NSString *)matchnum success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//赛程详情-数据-鲸猜
- (void)getMatchBigDataDetailWithMatchnum:(NSString *)matchnum success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//比分详情模型下的具体模分类
- (void)getMatchDataModelItemWithMatch_id:(NSString *)match_id success:(successBlock)successBlock failure:(failureBlock)failureBlock;


#pragma mark 通用
//获取我关注比赛列表--足球 全部但不包含结束的
- (void)getMyConcernMatchNotEndWithSuccess:(successBlock)successBlock failure:(failureBlock)failureBlock;
//进球提醒设置
- (void)getMatchEnterBallTipsWithOP:(NSString *)op Value:(NSString *)value Success:(successBlock)successBlock failure:(failureBlock)failureBlock;

@end

NS_ASSUME_NONNULL_END
