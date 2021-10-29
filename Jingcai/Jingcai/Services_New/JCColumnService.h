//
//  JCColumnService.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/10/21.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "BaseService.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCColumnService : BaseService

//社区首页专栏模块数据
- (void)getHomeColumnListWithSuccess:(successBlock)successBlock failure:(failureBlock)failureBlock;
//社区首页更多专栏
- (void)getHomeMoreColumnListWithPge:(NSInteger)page success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//专栏顶部详情,用在订单,购买的专栏
- (void)getColumnDetailTopInfoWithID:(NSString *)column_id WithSuccess:(successBlock)successBlock failure:(failureBlock)failureBlock;
//获取专栏详情
//column_id 专栏id
- (void)getColumnInfoWithID:(NSString *)column_id success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//获取专栏方案列表
- (void)getColumnPlanListWithcolumn_id:(NSString *)column_id page:(NSInteger)page success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//关注专栏
- (void)getConcernColumnWithID:(NSString *)column_id success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//专栏确认订单页面
//period_id 周期id
- (void)getColumnCheckOrderInfoWithPeriod_id:(NSString *)period_id success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//获取购买的专栏记录
- (void)getMyBuyColumnPlanListWithPage:(NSInteger)page success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//获取已购买的某期专栏关联的方案列表
//column_id 专栏id
//period_id 周期id
- (void)getColumn_periodPlanListWithcolumn_id:(NSString *)column_id period_id:(NSString *)period_id Page:(NSInteger)page success:(successBlock)successBlock failure:(failureBlock)failureBlock;
@end

NS_ASSUME_NONNULL_END
