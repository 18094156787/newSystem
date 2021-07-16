//
//  JCAppService_New.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/3/9.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "BaseService.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCAppService_New : BaseService

//获取客户端唯一标识
- (void)getAppSignXWithsuccess:(successBlock)successBlock failure:(failureBlock)failureBlock;

- (void)getKefuWXWithsuccess:(successBlock)successBlock failure:(failureBlock)failureBlock;

@end

NS_ASSUME_NONNULL_END
