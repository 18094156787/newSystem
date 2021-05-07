//
//  JCPayService_New.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/29.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCPayService_New.h"

@implementation JCPayService_New
//充值价格列表
- (void)getChargeListWithType:(NSString *)type success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    NSDictionary * param = @{
                            @"type":type
    };
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"recharge_price_list" paramDic:param ignoreArray:@[]];
    [manager GET:urlString parameters:param headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
}

//用户充值,获得订单id
- (void)getUserRechareWithRecharge_id:(NSString *)recharge_id success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    NSDictionary * param = @{
                            @"recharge_id":recharge_id,
                            @"pay_type":@"4",
                            @"source":@"1"
    };
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"recharge" paramDic:param ignoreArray:@[]];
    [manager GET:urlString parameters:param headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
}

//充值回调
- (void)getUserRechareSuccessWithOrder_id:(NSString *)order_id receipt_data:(NSString *)receipt_data success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    NSDictionary * param = @{
                            @"order_id":order_id,
                            @"receipt_data":receipt_data
    };
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"applepaynotify" paramDic:param ignoreArray:@[]];
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
