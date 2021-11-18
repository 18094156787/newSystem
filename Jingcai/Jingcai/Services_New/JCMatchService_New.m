//
//  JCMatchService_New.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/12/29.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCMatchService_New.h"

@implementation JCMatchService_New

//获取日期列表
//type 1赛程 2已完场 不传 默认1
- (void)getMatchTimeListWithType:(NSString *)type success:(successBlock)successBlock failure:(failureBlock)failureBlock {

    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    NSDictionary * param = @{
                            @"type":type
    };
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"get_the_match_time" paramDic:param ignoreArray:@[]];

    [manager GET:urlString parameters:param headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
}
//筛选类别 1首页重要 等于 重要+筛选+北单 并集 2筛选-重要 3筛选-全部 4筛选-竟足 5筛选-北单 默认3
- (void)getMatchListWithType:(NSString *)type EventID:(NSString *)eventID Time:(NSString *)time screening:(NSString *)screening Page:(NSInteger)page Success:(successBlock)successBlock failure:(failureBlock)failureBlock {

    
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    
    NSDictionary * param = @{
                            @"type":type,
                            @"screening":screening,
                            @"page":Integet_ToString(page),
                            @"page_size":@"10",
                            @"date":time,
    };
    if (eventID.length>0) {
         param = @{
                                   @"type":type,
                                   @"competition_id":eventID,
                                   @"screening":screening,
                                   @"page":Integet_ToString(page),
                                   @"page_size":@"10",
                                   @"date":time,
         };

    }

    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"match_list" paramDic:param ignoreArray:@[]];

    [manager GET:urlString parameters:param headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
}

//足球比赛搜索
- (void)getFootBallMatchListWithSearchWord:(NSString *)key_word Page:(NSInteger)page Success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    NSDictionary * param = @{
                            @"key_word":key_word,
                            @"page":Integet_ToString(page),
                            @"page_size":@"10",
    };
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"make_recently_match_of_end" paramDic:param ignoreArray:@[]];

    [manager GET:urlString parameters:param headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
}



//预测的比赛
//type 1 带上搜索 2 不带上搜索 默认2
//key_word ype 等于 一 需要带上
- (void)getPredictedMatchListWithType:(NSString *)type date:(NSString *)date Key_word:(NSString *)key_word Page:(NSInteger)page Success:(successBlock)successBlock failure:(failureBlock)failureBlock {

    
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    
    NSDictionary * param = @{
                            @"type":type,
                            @"date":date,
                            @"key_word":key_word,
                            @"page":Integet_ToString(page),
                            @"page_size":@"10",
    };

    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"predicted_match" paramDic:param ignoreArray:@[]];

    [manager GET:urlString parameters:param headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
}

- (void)getMatchEventListWithTime:(NSString *)time type:(NSString *)type Success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    NSDictionary * param = @{@"date":NonNil(time),@"type":type};

    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"screen_list" paramDic:param ignoreArray:@[]];
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

//赛程详情-头部
- (void)getFootBallMatchDetailTopWithMatchnum:(NSString *)matchnum success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    
    NSDictionary * param = @{
                            @"match_id":matchnum,
    };

    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"get_match_info" paramDic:param ignoreArray:@[]];

    [manager GET:urlString parameters:param headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
}

//赛程详情-直播
- (void)getMatchLiveWithMatchnum:(NSString *)matchnum success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    
    NSDictionary * param = @{
                            @"match_id":matchnum,
    };

    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"match_live" paramDic:param ignoreArray:@[]];

    [manager GET:urlString parameters:param headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
}
//赛程详情-情报
- (void)getMatchQingBaoWithMatchnum:(NSString *)matchnum success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    
    NSDictionary * param = @{
                            @"match_id":matchnum,
    };

    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"intelligence_info" paramDic:param ignoreArray:@[]];

    [manager GET:urlString parameters:param headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
}
//赛程详情-竞足指数
- (void)getJZZhishuWithMatch_id:(NSString *)matchnum success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    
    NSDictionary * param = @{
                            @"match_id":matchnum,
    };

    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"jcodds" paramDic:param ignoreArray:@[]];

    [manager GET:urlString parameters:param headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
}
//赛程详情-北单指数
- (void)getBDZhishuWithMatch_id:(NSString *)matchnum success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    
    NSDictionary * param = @{
                            @"match_id":matchnum,
    };

    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"bdodds" paramDic:param ignoreArray:@[]];

    [manager GET:urlString parameters:param headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
}

//赛程详情-指数 通过比赛id获取欧指/亚赔/大小球列表
- (void)getOPZhishuWithMatch_id:(NSString *)match_id type:(NSString *)type Page:(NSInteger)page Success:(successBlock)successBlock failure:(failureBlock)failureBlock {

    
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    
    NSDictionary * param = @{
                            @"type":type,
                            @"match_id":match_id,
                            @"page":Integet_ToString(page),
                            @"page_size":@"100"
    };


    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"odds" paramDic:param ignoreArray:@[]];

    [manager GET:urlString parameters:param headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
}
//通过比赛id公司ID类型 获取欧指/亚赔/大小球指数详情
//类型 3欧指，4亚指，5大小球
- (void)getOPZhishuDetailWithMatch_id:(NSString *)match_id company_id:(NSString *)company_id type:(NSString *)type Success:(successBlock)successBlock failure:(failureBlock)failureBlock {

    
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    
    NSDictionary * param = @{
                            @"type":type,
                            @"match_id":match_id,
                            @"company_id":company_id,
    };


    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"odds_info" paramDic:param ignoreArray:@[]];

    [manager GET:urlString parameters:param headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
}
//赛程详情-阵容
- (void)getMatchZhenrongWithMatchnum:(NSString *)matchnum success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    
    NSDictionary * param = @{
                            @"match_id":matchnum,
    };

    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"match_lineup" paramDic:param ignoreArray:@[]];

    [manager GET:urlString parameters:param headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
}
- (void)getMatchHaveBigDataWithMatchnum:(NSString *)matchnum success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    
    NSDictionary * param = @{
                            @"match_id":matchnum
    };

    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"is_have_ai_big_tab" paramDic:param ignoreArray:@[]];

    [manager GET:urlString parameters:param headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
}
//比分详情模型下的具体模分类
- (void)getMatchDataModelItemWithMatch_id:(NSString *)match_id success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    
    NSDictionary * param = @{
                            @"match_id":match_id
    };

    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"match_data_model" paramDic:param ignoreArray:@[]];

    [manager GET:urlString parameters:param headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
}
//赛程详情-数据-鲸猜
- (void)getMatchBigDataDetailWithMatchnum:(NSString *)matchnum success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    
    NSDictionary * param = @{
                            @"match_id":matchnum
    };

    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"get_ai_big_data" paramDic:param ignoreArray:@[]];

    [manager GET:urlString parameters:param headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
}

//赛程详情-数据
- (void)getMatchDataWithMatchnum:(NSString *)matchnum success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    
    NSDictionary * param = @{
                            @"match_id":matchnum
    };

    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"get_home_and_away_info" paramDic:param ignoreArray:@[]];

    [manager GET:urlString parameters:param headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
}

- (void)getMatchConcernWithMatchnum:(NSString *)matchnum match_time:(NSString *)match_time category:(NSString *)category success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    NSString *token = [JCWUserBall currentUser].token;
    NSDictionary * param = @{
                            @"token":token,
                            @"match_id":matchnum,
                            @"type":category,
                            @"match_time":match_time
    };

    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"subscribe_match" paramDic:param ignoreArray:@[]];

    [manager GET:urlString parameters:param headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
}
//足球关注列表
- (void)getFootBallMatchConcernListWithPage:(NSInteger)page pageSize:(NSInteger)page_size Success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    NSDictionary * param = @{
                            @"page":Integet_ToString(page),
                            @"page_size":Integet_ToString(page_size),
    };


    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"get_subscribe_match" paramDic:param ignoreArray:@[]];

    [manager GET:urlString parameters:param headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
}

- (void)getFootBallMatchPlanListWithMatch_id:(NSString *)match_id Page:(NSInteger)page Success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    
    NSDictionary * param = @{
                            @"match_id":match_id,
                            @"page":Integet_ToString(page),
                            @"page_size":@"10",
    };


    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"match_plan_list" paramDic:param ignoreArray:@[]];

    [manager GET:urlString parameters:param headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
}
//获取我关注比赛列表--足球 全部但不包含结束的
- (void)getMyConcernMatchNotEndWithSuccess:(successBlock)successBlock failure:(failureBlock)failureBlock {
    
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    NSDictionary * param = @{};
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"get_subscribe_match_not_end" paramDic:param ignoreArray:@[]];
    [manager GET:urlString parameters:param headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
}
//进球提醒设置
- (void)getMatchEnterBallTipsWithOP:(NSString *)op Value:(NSString *)value Success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    NSDictionary * param = @{
                            @"op":op,
                            @"val":value
    };
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"user_match_tips" paramDic:param ignoreArray:@[]];
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
