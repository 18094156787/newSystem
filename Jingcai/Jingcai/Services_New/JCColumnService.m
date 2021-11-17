//
//  JCColumnService.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/10/21.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCColumnService.h"

@implementation JCColumnService

//社区首页专栏模块数据
- (void)getHomeColumnListWithSuccess:(successBlock)successBlock failure:(failureBlock)failureBlock {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary * param = @{};
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"special_column_recommend" paramDic:param ignoreArray:@[]];

    [manager GET:urlString parameters:param headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
    
}
//社区首页更多专栏
- (void)getHomeMoreColumnListWithPge:(NSInteger)page success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary * param = @{
                            @"page":Integet_ToString(page),
                            @"page_size":@"10"
    };
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"special_column_recommend_more" paramDic:param ignoreArray:@[]];

    [manager GET:urlString parameters:param headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
    
}
//专栏顶部详情,用在订单,购买的专栏
- (void)getColumnDetailTopInfoWithID:(NSString *)column_id Period_id:(NSString *)period_id WithSuccess:(successBlock)successBlock failure:(failureBlock)failureBlock {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary * param = @{@"id":column_id,
                             @"period":period_id
    };
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"special_column_info" paramDic:param ignoreArray:@[]];

    [manager GET:urlString parameters:param headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
    
}

//获取专栏详情
//column_id 专栏id
- (void)getColumnInfoWithID:(NSString *)column_id success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    NSDictionary * param = @{@"column_id":column_id};
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"column_info" paramDic:param ignoreArray:@[]];
    [manager GET:urlString parameters:param headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
}
//关注专栏
- (void)getConcernColumnWithID:(NSString *)column_id success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    NSDictionary * param = @{@"column_id":column_id};
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"column_subscribe" paramDic:param ignoreArray:@[]];
    [manager POST:urlString parameters:param headers:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
//
    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
    }];
}
//获取专栏方案列表
- (void)getColumnPlanListWithcolumn_id:(NSString *)column_id page:(NSInteger)page success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary * param = @{
                            @"column_id":column_id,
                            @"page":Integet_ToString(page),
                            @"page_size":@"10"
    };
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"get_column_period" paramDic:param ignoreArray:@[]];

    [manager GET:urlString parameters:param headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
    
}

//专栏确认订单页面
//period_id 周期id
- (void)getColumnCheckOrderInfoWithPeriod_id:(NSString *)period_id success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary * param = @{@"period_id":period_id};
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"get_column_info_order" paramDic:param ignoreArray:@[]];

    [manager GET:urlString parameters:param headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
    
}

//获取购买的专栏记录
- (void)getMyBuyColumnPlanListWithPage:(NSInteger)page success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary * param = @{
                            @"page":Integet_ToString(page),
                            @"page_size":@"10"
    };
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"get_user_buy_column" paramDic:param ignoreArray:@[]];

    [manager GET:urlString parameters:param headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
    
}

//获取已购买的某期专栏关联的方案列表
//column_id 专栏id
//period_id 周期id
- (void)getColumn_periodPlanListWithcolumn_id:(NSString *)column_id period_id:(NSString *)period_id Page:(NSInteger)page success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary * param = @{
                            @"id":column_id,
                            @"period":period_id,
                            @"page":Integet_ToString(page),
                            @"page_size":@"10"
    };
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"special_column_list" paramDic:param ignoreArray:@[]];

    [manager GET:urlString parameters:param headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
    
}

@end
