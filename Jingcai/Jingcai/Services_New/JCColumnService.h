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

//获取专栏详情
//column_id 专栏id
- (void)getColumnInfoWithID:(NSString *)column_id success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//关注专栏
- (void)getConcernColumnWithID:(NSString *)column_id success:(successBlock)successBlock failure:(failureBlock)failureBlock;

@end

NS_ASSUME_NONNULL_END
