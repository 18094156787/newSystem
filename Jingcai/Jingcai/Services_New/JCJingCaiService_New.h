//
//  JCJingCaiService_New.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/28.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "BaseService.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCJingCaiService_New : BaseService
//首页
- (void)getJingcaiHomeDataWithCompetition_id:(NSString *)competition_id page:(NSInteger)page success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//全名预测-预测结果
- (void)getJingcaiUserYC_ResultWithsuccess:(successBlock)successBlock failure:(failureBlock)failureBlock;
//参与预测
- (void)creatYucewithMatch_id:(NSString *)match_id  home_select:(NSString *)home_select  away_select:(NSString *)away_select success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//参与预测配置参数
- (void)getYuceSettingWithSuccess:(successBlock)successBlock failure:(failureBlock)failureBlock;
//排行榜-我的预测信息
- (void)getJingcaiMyYuceInfoWithSuccess:(successBlock)successBlock failure:(failureBlock)failureBlock;
//排行榜-上周入围
- (void)getJingcaiRankList_LastWeekWithpage:(NSInteger)page success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//排行榜-本周入围
- (void)getJingcaiRankList_ThisWeekWithpage:(NSInteger)page success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//排行榜-10连红入围
- (void)getJingcaiRankList_TenRedWeekWithpage:(NSInteger)page success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//用户的预测列表/我的预测列表
- (void)getUserYuCeListWithUserID:(NSString *)user_id page:(NSInteger)page success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//用户的预测战绩列表/他人的战绩列表
- (void)getUserZhanjiListWithType:(NSString *)type userID:(NSString *)user_id page:(NSInteger)page success:(successBlock)successBlock failure:(failureBlock)failureBlock;
@end

NS_ASSUME_NONNULL_END
