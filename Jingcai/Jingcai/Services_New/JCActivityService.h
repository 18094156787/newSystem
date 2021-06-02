//
//  JCActivityService.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/3/8.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "BaseService.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCActivityService : BaseService
//获取日期列表
- (void)getMatchTimeListWithSuccess:(successBlock)successBlock failure:(failureBlock)failureBlock;
//资讯
- (void)getHomeDataWithPage:(NSInteger)page success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//方案
- (void)getPlanListWithPage:(NSInteger)page success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//活动广场
- (void)getActivitySquareWithsuccess:(successBlock)successBlock failure:(failureBlock)failureBlock;
//活动列表
//1正在进行中的活动 2历史活动
- (void)getActivityListWithType:(NSString *)type page:(NSInteger)page success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//position 1首页 2赛程3社区4大数据
- (void)getActivityPresentWithPosition:(NSString *)position actIDs:(NSString *)actIDs success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//活动详情
//ID 活动id
- (void)getActivityDetailWithActID:(NSString *)ID success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//领取活动奖励
- (void)getActivityPrizeWithActID:(NSString *)ID success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//提交竞猜
//options 选项 列入 1,2,3  id  活动ID
- (void)getSubmitJingCaiUserWithActID:(NSString *)ID options:(NSString *)options success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//充值界面奖励信息
- (void)getRechargeBannerInfoWithsuccess:(successBlock)successBlock failure:(failureBlock)failureBlock;

#pragma mark  慈善活动相关
//慈善活动详情
- (void)getKindActivityDetailWithActID:(NSString *)ID success:(successBlock)successBlock failure:(failureBlock)failureBlock;

//活动签到
//type 1签到 2分享转发
- (void)getKindActivitySignWithActID:(NSString *)ID type:(NSString *)type success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//签到活动内部详情
//type 1活动完成用户 2用户积分明细 3我的奖励 4返回全部列表 默认为4
- (void)getKindActivityDetailContentWithActID:(NSString *)ID  type:(NSString *)type Page:(NSInteger)page success:(successBlock)successBlock failure:(failureBlock)failureBlock;
@end

NS_ASSUME_NONNULL_END
