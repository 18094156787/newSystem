//
//  JCDataBaseService_New.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/12/28.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCDataBaseService_New.h"

@implementation JCDataBaseService_New

- (void)getDataBaseHomeDataWithSuccess:(successBlock)successBlock failure:(failureBlock)failureBlock {
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    
    NSDictionary * param = @{};

    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"database" paramDic:param ignoreArray:@[]];

    [manager GET:urlString parameters:param headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
}

- (void)getDataBaseAreaListWithSuccess:(successBlock)successBlock failure:(failureBlock)failureBlock {
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    NSDictionary * param = @{};
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"competition_list" paramDic:param ignoreArray:@[]];
    [manager GET:urlString parameters:param headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
    
}

- (void)getDataBaseEventInfoWithCompetition_id:(NSString *)competition_id type:(NSString *)type success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    NSDictionary * param = @{@"id":competition_id,@"type":type};
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"nav_tab" paramDic:param ignoreArray:@[]];
    [manager GET:urlString parameters:param headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
    
}

- (void)getDataBaseEventBaseInfoWithCompetiton_id:(NSString *)competiton_id season_id:(NSString *)season_id best_lineup_id:(NSString *)best_lineup_id success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    NSDictionary * param = @{@"competiton_id":competiton_id,@"season_id":season_id};
    if (best_lineup_id.length>0) {
        param = @{@"competiton_id":competiton_id,@"best_lineup_id":NonNil(best_lineup_id)};
    }
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"competition_info" paramDic:param ignoreArray:@[]];
    [manager GET:urlString parameters:param headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
    
}
//刷新基本信息-阵容数据
/*
 competiton_id 赛事ID
 best_lineup_id 最佳阵容ID
 **/
- (void)getDataBaseEventBaseInfo_ZhenRongWithCompetiton_id:(NSString *)competiton_id best_lineup_id:(NSString *)best_lineup_id success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    NSDictionary * param = @{@"competiton_id":competiton_id,@"best_lineup_id":best_lineup_id};
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"competition_group" paramDic:param ignoreArray:@[]];
    [manager GET:urlString parameters:param headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
    
}


- (void)getDataBaseScoreRankWithType:(NSString *)type competiton_id:(NSString *)competiton_id Season_id:(NSString *)season_id stage_id:(NSString *)stage_id Success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    NSDictionary * param = @{@"type":type,@"id":competiton_id,@"season_id":season_id,@"stage_id":stage_id};
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"score_rank" paramDic:param ignoreArray:@[]];
    [manager GET:urlString parameters:param headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
    
}

- (void)getDataBaseMatchListWithCompetiton_id:(NSString *)competiton_id Season_id:(NSString *)season_id stage_id:(NSString *)stage_id Success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    NSDictionary * param = @{@"competiton_id":competiton_id,@"season_id":season_id,@"stage_id":stage_id};
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"competiton_match" paramDic:param ignoreArray:@[]];
    [manager GET:urlString parameters:param headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
    
}



- (void)getDataBaseStage_listWithSeason_id:(NSString *)season_id Success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    NSDictionary * param = @{@"season_id":season_id};
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"stage_list" paramDic:param ignoreArray:@[]];
    [manager GET:urlString parameters:param headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
    
}

- (void)getDataBaseEventPlayerOrTeamLeftInfoWithType:(NSString *)type success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    NSDictionary * param = @{@"type":type};
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"get_stats_params" paramDic:param ignoreArray:@[]];
    [manager GET:urlString parameters:param headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
    
}

- (void)getDataBaseEventPlayerListInfoWithCompetiton_id:(NSString *)competiton_id type:(NSString *)type season_id:(NSString *)season_id Page:(NSInteger)page success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    NSDictionary * param = @{@"competiton_id":competiton_id,@"type":type,@"season_id":NonNil(season_id),                            @"page":Integet_ToString(page),
                             @"page_size":@"100"};
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"competiton_player_ranking" paramDic:param ignoreArray:@[]];
    [manager GET:urlString parameters:param headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
    
}

- (void)getDataBaseEventTeamListInfoWithCompetiton_id:(NSString *)competiton_id type:(NSString *)type season_id:(NSString *)season_id success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    NSDictionary * param = @{@"competiton_id":competiton_id,@"type":type,@"season_id":NonNil(season_id)};
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"team_stats_ranking" paramDic:param ignoreArray:@[]];
    [manager GET:urlString parameters:param headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
    
}

- (void)getDataBaseSeasonListWithType:(NSString *)type teamID:(NSString *)teamID success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    NSDictionary * param = @{@"type":type,@"id":teamID};
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"season_list" paramDic:param ignoreArray:@[]];
    [manager GET:urlString parameters:param headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
    
}

#pragma mark//球队

- (void)getDataBaseTeamInfoWithTeam_id:(NSString *)team_id Success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    NSDictionary * param = @{@"team_id":team_id};
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"team_info" paramDic:param ignoreArray:@[]];
    [manager GET:urlString parameters:param headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
}

- (void)getDataBaseTeam_MatchListWithTeam_id:(NSString *)team_id page:(NSInteger)page Success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    NSDictionary * param = @{@"team_id":NonNil(team_id),
                             @"page":Integet_ToString(page),
                             @"page_size":@"10"};
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"team_match_list" paramDic:param ignoreArray:@[]];
    [manager GET:urlString parameters:param headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
}

- (void)getDataBaseTeamPlayerListInfoWithTeam_id:(NSString *)team_id type:(NSString *)type season_id:(NSString *)season_id Page:(NSInteger)page success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    NSDictionary * param = @{@"team_id":team_id,@"type":type,@"season_id":NonNil(season_id),                            @"page":Integet_ToString(page),
                             @"page_size":@"100"};
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"team_player_ranking" paramDic:param ignoreArray:@[]];
    [manager GET:urlString parameters:param headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
    
}
//转会记录
//type 1表示转入 2表示转出 默认为1
- (void)getDataBaseTeam_ZhuanHuiRecordWithTeam_id:(NSString *)team_id type:(NSString *)type page:(NSInteger)page Success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    NSDictionary * param = @{@"team_id":team_id,
                             @"type":type,
                             @"page":Integet_ToString(page),
                             @"page_size":@"10"};
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"player_transfer_list" paramDic:param ignoreArray:@[]];
    [manager GET:urlString parameters:param headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
}
//球队阵容
- (void)getDataBaseTeam_ZhenRongWithTeam_id:(NSString *)team_id Success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    NSDictionary * param = @{@"team_id":team_id };
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"team_lineup" paramDic:param ignoreArray:@[]];
    [manager GET:urlString parameters:param headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
}


#pragma mark 鲸猜大数据
- (void)getBigDataTopInfoWithsuccess:(successBlock)successBlock failure:(failureBlock)failureBlock {
    
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    
    NSDictionary * param = @{};

    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"big_data_info" paramDic:param ignoreArray:@[]];

    [manager GET:urlString parameters:param headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
    }];
        
}
//大数据购买页信息,有传match_id是单场,没有传是包月
- (void)getBigDataBuyInfooWithMatch_id:(NSString *)match_id success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    
    NSDictionary * param = @{@"match_id":match_id};

    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"big_data_info_buy" paramDic:param ignoreArray:@[]];

    [manager GET:urlString parameters:param headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
    }];
    
}


#pragma mark 鲸猜AI
// 鲸猜AI-顶部信息(不包含轮播)
- (void)getJingCaiAiTopInfoDataWithsuccess:(successBlock)successBlock failure:(failureBlock)failureBlock {
    
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    
    NSDictionary * param = @{};

    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"ai_user_head" paramDic:param ignoreArray:@[]];

    [manager GET:urlString parameters:param headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
    }];
}
// 鲸猜AI-顶部轮播
- (void)getJingCaiAiTopCycleDataWithsuccess:(successBlock)successBlock failure:(failureBlock)failureBlock {
    
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    
    NSDictionary * param = @{};

    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"ai_user_head_ten" paramDic:param ignoreArray:@[]];

    [manager GET:urlString parameters:param headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
    }];
}

- (void)getJingCaiAiTuiJianListWithType:(NSString *)type classfly:(NSString *)classfly Page:(NSInteger)page success:(successBlock)successBlock failure:(failureBlock)failureBlock {
 

    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    NSDictionary * param = @{
                            @"type":type,
                             @"page":Integet_ToString(page),
                             @"page_size":@"10"
                             };
    if (classfly.length>0) {
                param = @{
                                @"type":type,
                                @"classfly":classfly,
                                 @"page":Integet_ToString(page),
                                 @"page_size":@"10"
                                 };
    }
    
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"get_ai_program" paramDic:param ignoreArray:@[]];
    [manager GET:urlString parameters:param headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
    }];
}

#pragma mark 数据模型

//数据模型首页
- (void)getHomeDataModelWithSuccess:(successBlock)successBlock failure:(failureBlock)failureBlock {
 

    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    NSDictionary * param = @{};
    
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"data_model_index" paramDic:param ignoreArray:@[]];
    [manager GET:urlString parameters:param headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
    }];
}

//凯利指数模型购买信息
- (void)getDataModelPayInfoWithModel_id:(NSString *)model_id Success:(successBlock)successBlock failure:(failureBlock)failureBlock {
 

    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    NSDictionary * param = @{
        @"model_id":model_id
    };
    
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"data_model_buy_info" paramDic:param ignoreArray:@[]];
    [manager GET:urlString parameters:param headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
    }];
}

//凯利指数模型免费体验
- (void)getKellyDataModeFreeExperienceWithModel_id:(NSString *)model_id Success:(successBlock)successBlock failure:(failureBlock)failureBlock {
 

    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    NSDictionary * param = @{
        @"model_id":model_id,
        @"source":@"1"
    };
    
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"data_model_free_trial" paramDic:param ignoreArray:@[]];
    [manager GET:urlString parameters:param headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
    }];
}
//凯利指数列表
-(void)getKellyDataModeListWithDate:(NSString *)date Page:(NSInteger)page success:(successBlock)successBlock failure:(failureBlock)failureBlock {
 

    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    NSDictionary * param = @{
                             @"page":Integet_ToString(page),
                             @"page_size":@"10",
                             @"date":date
                             };
    
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"kelly_index_list" paramDic:param ignoreArray:@[]];
    [manager GET:urlString parameters:param headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
    }];
}
//凯利指数详情
//match_id 比赛id
- (void)getKellyDataModeDetailWithMatch_id:(NSString *)match_id Success:(successBlock)successBlock failure:(failureBlock)failureBlock {
 

    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    NSDictionary * param = @{
        @"match_id":match_id,
    };
    
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"kelly_index_detail" paramDic:param ignoreArray:@[]];
    [manager GET:urlString parameters:param headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
    }];
}
//凯利指数变化轨迹
//match_id 比赛id
- (void)getKellyDataModeDetailTrackDataWithMatch_id:(NSString *)match_id Success:(successBlock)successBlock failure:(failureBlock)failureBlock {
 

    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    NSDictionary * param = @{
        @"match_id":match_id,
    };
    
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"kelly_index_history" paramDic:param ignoreArray:@[]];
    [manager GET:urlString parameters:param headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
    }];
}
//凯利指数样本数据
//match_id 比赛id
- (void)getKellyDataModeDetailSampleDataWithMatch_id:(NSString *)match_id Success:(successBlock)successBlock failure:(failureBlock)failureBlock {
 

    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    NSDictionary * param = @{
        @"match_id":match_id,
    };
    
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"kelly_simple_data" paramDic:param ignoreArray:@[]];
    [manager GET:urlString parameters:param headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
    }];
}
//凯利指数变化轨迹
//match_id 比赛id
- (void)getKellyDataModelTrackWithMatch_id:(NSString *)match_id Success:(successBlock)successBlock failure:(failureBlock)failureBlock {
 

    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    NSDictionary * param = @{
        @"match_id":match_id,
    };
    
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"kelly_index_history" paramDic:param ignoreArray:@[]];
    [manager GET:urlString parameters:param headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
    }];
}

//泊松分布列表
-(void)getPoissonDataModeListWithDate:(NSString *)date Page:(NSInteger)page success:(successBlock)successBlock failure:(failureBlock)failureBlock {
 

    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    NSDictionary * param = @{
                             @"page":Integet_ToString(page),
                             @"page_size":@"10",
                             @"date":date
                             };
    
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"poisson_index_list" paramDic:param ignoreArray:@[]];
    [manager GET:urlString parameters:param headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
    }];
}

//泊松分布详情
- (void)getPoissonDataModeDetailWithMatch_id:(NSString *)match_id Success:(successBlock)successBlock failure:(failureBlock)failureBlock {
 

    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    NSDictionary * param = @{
        @"match_id":match_id,
    };
    
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"poisson_index_detail" paramDic:param ignoreArray:@[]];
    [manager GET:urlString parameters:param headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
    }];
}
//历史同赔列表
-(void)getHistoryPayDataModeListWithDate:(NSString *)date Page:(NSInteger)page success:(successBlock)successBlock failure:(failureBlock)failureBlock {
 

    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    NSDictionary * param = @{
                             @"page":Integet_ToString(page),
                             @"page_size":@"10",
                             @"date":date
                             };
    
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"history_same_odds_list" paramDic:param ignoreArray:@[]];
    [manager GET:urlString parameters:param headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
    }];
}
//历史同赔详情
- (void)getHistoryPayDataModeDetailWithMatch_id:(NSString *)match_id Success:(successBlock)successBlock failure:(failureBlock)failureBlock {
 

    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    NSDictionary * param = @{
        @"match_id":match_id,
    };
    
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"history_same_odds_detail" paramDic:param ignoreArray:@[]];
    [manager GET:urlString parameters:param headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
    }];
}
@end
