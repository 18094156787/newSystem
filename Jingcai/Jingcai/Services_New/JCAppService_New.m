//
//  JCAppService_New.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/3/9.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCAppService_New.h"

@implementation JCAppService_New
//获取客服微信
- (void)getKefuWXWithsuccess:(successBlock)successBlock failure:(failureBlock)failureBlock {
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    NSDictionary * param = @{};
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"system_info" paramDic:param ignoreArray:@[]];
    [manager GET:urlString parameters:param headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
}

@end
