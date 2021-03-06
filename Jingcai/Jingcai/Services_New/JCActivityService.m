//
//  JCActivityService.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/3/8.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCActivityService.h"

@implementation JCActivityService

//获取日期列表
- (void)getMatchTimeListWithSuccess:(successBlock)successBlock failure:(failureBlock)failureBlock {

    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    NSDictionary * param = @{};
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"get_eurcup_match_time" paramDic:param ignoreArray:@[]];

    [manager GET:urlString parameters:param headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
}

- (void)getHomeDataWithPage:(NSInteger)page success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    NSDictionary * param = @{
                            @"page":Integet_ToString(page),
                            @"page_size":@"10",
    };
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"eur_cup_homeinfo" paramDic:param ignoreArray:@[]];
    [manager GET:urlString parameters:param headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
}
//方案
- (void)getPlanListWithPage:(NSInteger)page success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    NSDictionary * param = @{
                            @"page":Integet_ToString(page),
                            @"page_size":@"10",
    };
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"eur_cup_planlist" paramDic:param ignoreArray:@[]];
    [manager GET:urlString parameters:param headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
}
//活动广场
- (void)getActivitySquareWithsuccess:(successBlock)successBlock failure:(failureBlock)failureBlock {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary * param = @{};
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"event_square_picture" paramDic:param ignoreArray:@[]];

    [manager GET:urlString parameters:param headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
    
}
//活动广场
//1正在进行中的活动 2历史活动
- (void)getActivityListWithType:(NSString *)type page:(NSInteger)page success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary * param = @{
                            @"type":type,
                            @"page":Integet_ToString(page),
                            @"page_size":@"10"
    };
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"ongoing_activities" paramDic:param ignoreArray:@[]];

    [manager GET:urlString parameters:param headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
    
}

//活动弹窗
//position 1首页 2赛程3社区4大数据
- (void)getActivityPresentWithPosition:(NSString *)position actIDs:(NSString *)actIDs success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary * param = @{
                            @"show_position":position,
                            @"ids":NonNil(actIDs)
    };
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"popup_event_pictures" paramDic:param ignoreArray:@[]];

    [manager GET:urlString parameters:param headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
    
}

//活动详情
//ID 活动id
- (void)getActivityDetailWithActID:(NSString *)ID success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary * param = @{
                            @"id":ID
    };
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"get_event_detail" paramDic:param ignoreArray:@[]];

    [manager GET:urlString parameters:param headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
    
}
//领取活动奖励
- (void)getActivityPrizeWithActID:(NSString *)ID success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary * param = @{@"id":ID};
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"get_the_rewards" paramDic:param ignoreArray:@[]];

    [manager GET:urlString parameters:param headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
    
}
//提交竞猜
//options 选项 列入 1,2,3  id  活动ID
- (void)getSubmitJingCaiUserWithActID:(NSString *)ID options:(NSString *)options success:(successBlock)successBlock failure:(failureBlock)failureBlock {


    NSDictionary *param = @{
                            @"id":ID,
                            @"options":options};
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"submit_the_quiz" paramDic:param ignoreArray:@[]];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager POST:urlString parameters:param headers:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
    }];
}

//充值界面奖励信息
- (void)getRechargeBannerInfoWithsuccess:(successBlock)successBlock failure:(failureBlock)failureBlock {
    NSDictionary *param = @{};
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"recharge_reward_information" paramDic:param ignoreArray:@[]];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:urlString parameters:param headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
}

#pragma mark  慈善活动相关
//慈善活动详情
- (void)getKindActivityDetailWithActID:(NSString *)ID success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary * param = @{
                            @"activity_id":ID
    };
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"charity_info" paramDic:param ignoreArray:@[]];

    [manager GET:urlString parameters:param headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
    
}
//慈善活动分享统计
- (void)getAddActivityShareInfoWithActID:(NSString *)ID success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary * param = @{
                            @"activity_id":ID
    };
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"activity_share" paramDic:param ignoreArray:@[]];

    [manager GET:urlString parameters:param headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
    
}
//活动签到
//type 1签到 2分享转发
- (void)getKindActivitySignWithActID:(NSString *)ID type:(NSString *)type success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary * param = @{
                            @"activity_id":ID,
                            @"type":type
    };
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"charity_sign" paramDic:param ignoreArray:@[]];

    [manager GET:urlString parameters:param headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
    
}

//签到活动内部详情
//type 1活动完成用户 2用户积分明细 3我的奖励 4返回全部列表 默认为4
- (void)getKindActivityDetailContentWithActID:(NSString *)ID  type:(NSString *)type Page:(NSInteger)page page_size:(NSString *)pageSize success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary * param = @{
                            @"activity_id":ID,
                            @"type":type,
                            @"page":Integet_ToString(page),
                            @"page_size":pageSize
    };
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"charity_play_info" paramDic:param ignoreArray:@[]];

    [manager GET:urlString parameters:param headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
    
}

//活动邀请好友分享统计
- (void)getActivityAnalysisWithActID:(NSString *)ID success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary * param = @{
                            @"activity_id":ID,
    };
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"activity_register_share" paramDic:param ignoreArray:@[]];

    [manager GET:urlString parameters:param headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
    
}
@end
