//
//  JCBasketBallMatchService_New.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/20.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBasketBallMatchService_New.h"

@implementation JCBasketBallMatchService_New


//筛选类别 1首页重要 等于 重要+筛选+北单 并集 2筛选-重要 3筛选-全部 4筛选-竟足 5筛选-北单 默认3
- (void)getMatchListWithType:(NSString *)type EventID:(NSString *)eventID Time:(NSString *)time screening:(NSString *)screening Page:(NSInteger)page Success:(successBlock)successBlock failure:(failureBlock)failureBlock {


    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    NSDictionary * param = @{
                            @"type":type,
                            @"screening":screening,
                            @"page":Integet_ToString(page),
                            @"page_size":@"20",
                            @"date":time,
    };
    if (eventID.length>0) {
         param = @{
                                   @"type":type,
                                   @"competition_id":eventID,
                                   @"screening":screening,
                                   @"page":Integet_ToString(page),
                                   @"page_size":@"20",
                                   @"date":time,
         };
    }
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"match_basketball_list" paramDic:param ignoreArray:@[]];
    NSLog(@"%@",param);
    [manager GET:urlString parameters:param headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSLog(@"%@",responseObject);
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
}
//篮球比赛搜索
- (void)getBasketBallMatchListWithSearchWord:(NSString *)key_word Page:(NSInteger)page Success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    NSDictionary * param = @{
                            @"key_word":key_word,
                            @"page":Integet_ToString(page),
                            @"page_size":@"10",
    };
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"basketball_list_of_end" paramDic:param ignoreArray:@[]];

    [manager GET:urlString parameters:param headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
}
//篮球关注列表
- (void)getbBasketBallMatchConcernListWithPage:(NSInteger)page Success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    NSDictionary * param = @{
                            @"page":Integet_ToString(page),
                            @"page_size":@"10"
    };


    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"get_basketball_subscribe_match" paramDic:param ignoreArray:@[]];

    [manager GET:urlString parameters:param headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
}

- (void)getMatchEventListWithTime:(NSString *)time type:(NSString *)type  Success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    NSDictionary * param = @{@"date":NonNil(time),@"type":type};

    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"screen_basketball_list" paramDic:param ignoreArray:@[]];
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    [manager GET:urlString parameters:param headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
}

- (void)getMatchtDetailWithMatch_id:(NSString *)match_id success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    NSDictionary * param = @{@"match_id":match_id};

    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"get_basketball_match_info" paramDic:param ignoreArray:@[]];
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    [manager GET:urlString parameters:param headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
}

- (void)getBasketBallMatchPlanListWithMatch_id:(NSString *)match_id Page:(NSInteger)page Success:(successBlock)successBlock failure:(failureBlock)failureBlock {

    
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    
    NSDictionary * param = @{
                            @"match_id":match_id,
                            @"page":Integet_ToString(page),
                            @"page_size":@"10",
    };


    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"match_basketball_plan_list" paramDic:param ignoreArray:@[]];

    [manager GET:urlString parameters:param headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
}

- (void)getBasketBallMatchtDetailZhiboWithMatch_id:(NSString *)match_id success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary *param = @{
        @"match_id":match_id,
    };
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"get_basketball_match_live" paramDic:param ignoreArray:@[]];
    [manager GET:urlString parameters:param headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
    }];
}

- (void)getMatchBiFenWithMatchNum:(NSString *)matchNum type:(NSString *)type Page:(NSInteger)page success:(successBlock)successBlock failure:(failureBlock)failureBlock {

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary *param = @{
                            @"match_id":matchNum,
                            @"type":type,
                            @"page":Integet_ToString(page),
                            @"page_size":@"10",
                            
    };
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"get_basketball_odds_index" paramDic:param ignoreArray:@[]];
    [manager GET:urlString parameters:param headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
    }];

}

- (void)getBasketBallZhishuDetailWithMatch_id:(NSString *)match_id company_id:(NSString *)company_id type:(NSString *)type Success:(successBlock)successBlock failure:(failureBlock)failureBlock {

    
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    
    NSDictionary * param = @{
                            @"type":type,
                            @"match_id":match_id,
                            @"company_id":company_id
    };


    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"get_basketball_index_detail" paramDic:param ignoreArray:@[]];

    [manager GET:urlString parameters:param headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
}
- (void)getBasketBalltMatchtDetailTongjiWithMatch_id:(NSString *)match_id success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    
    NSDictionary * param = @{
                            @"match_id":match_id,
    };

    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"get_basketball_match_statistics" paramDic:param ignoreArray:@[]];

    [manager GET:urlString parameters:param headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
    
}

//

@end
