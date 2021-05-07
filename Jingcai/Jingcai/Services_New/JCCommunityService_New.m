//
//  JCCommunityService_New.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/25.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCCommunityService_New.h"

@implementation JCCommunityService_New

- (void)getDakaExpertLsitWithPage:(NSInteger)page success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    
    NSDictionary * param = @{
                            @"page":Integet_ToString(page),
                            @"page_size":@"10",
    };


    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"expert" paramDic:param ignoreArray:@[]];

    [manager GET:urlString parameters:param headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
}

- (void)getCommunity_HongbangExpertLsitWithSuccess:(successBlock)successBlock failure:(failureBlock)failureBlock {
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    NSDictionary * param = @{};
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"talent_recom" paramDic:param ignoreArray:@[]];
    [manager GET:urlString parameters:param headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
}

- (void)getCommunity_HongbangTuijianLsitWithType:(NSString *)type page:(NSInteger)page success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    NSDictionary * param = @{
                            @"type":type,
                            @"page":Integet_ToString(page),
                            @"page_size":@"10",
    };
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"talent" paramDic:param ignoreArray:@[]];
    [manager GET:urlString parameters:param headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
}

- (void)getHongbangExpertLsitWithType:(NSString *)type page:(NSInteger)page success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    NSDictionary * param = @{
                            @"type":type,
                            @"page":Integet_ToString(page),
                            @"page_size":@"10",
    };
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"talent_top" paramDic:param ignoreArray:@[]];
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
