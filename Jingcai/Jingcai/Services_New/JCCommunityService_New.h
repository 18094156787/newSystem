//
//  JCCommunityService_New.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/25.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "BaseService.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCCommunityService_New : BaseService
//社区首页-公众号列表
- (void)getDakaExpertLsitWithPage:(NSInteger)page success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//社区首页-红榜专家列表
- (void)getCommunity_HongbangExpertLsitWithSuccess:(successBlock)successBlock failure:(failureBlock)failureBlock;
//社区首页-红榜推荐列表
- (void)getCommunity_HongbangTuijianLsitWithType:(NSString *)type page:(NSInteger)page success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//红榜专家列表
//type 为1时表示为命中率，2表示为盈利率，3表示为盈利率 当type为1，3与2时 返回的字段是不同的 默认为1
- (void)getHongbangExpertLsitWithType:(NSString *)type page:(NSInteger)page success:(successBlock)successBlock failure:(failureBlock)failureBlock;

@end

NS_ASSUME_NONNULL_END
