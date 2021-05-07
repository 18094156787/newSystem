//
//  JCPayService_New.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/29.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "BaseService.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCPayService_New : BaseService
//充值价格列表
- (void)getChargeListWithType:(NSString *)type success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//用户充值,获得订单id
- (void)getUserRechareWithRecharge_id:(NSString *)recharge_id success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//充值回调
- (void)getUserRechareSuccessWithOrder_id:(NSString *)order_id receipt_data:(NSString *)receipt_data success:(successBlock)successBlock failure:(failureBlock)failureBlock;

@end

NS_ASSUME_NONNULL_END
