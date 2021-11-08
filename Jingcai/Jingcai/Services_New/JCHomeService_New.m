//
//  JCHomeService_New.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/25.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCHomeService_New.h"

@implementation JCHomeService_New
- (void)getAppBannerWithType:(NSString *)type success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary * param = @{
                            @"type":type};
    
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"banner" paramDic:param ignoreArray:@[]];

    [manager GET:urlString parameters:param headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
}
//
- (void)getHomeTabWithsuccess:(successBlock)successBlock failure:(failureBlock)failureBlock {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary * param = @{};
    
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"version_info" paramDic:param ignoreArray:@[]];

    [manager GET:urlString parameters:param headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
}

- (void)getHomeDataWithType:(NSString *)article_type page:(NSInteger)page success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary * param = @{
                            @"article_type":article_type,
                            @"page":Integet_ToString(page),
                            @"page_size":@"10"
    };
    
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"home" paramDic:param ignoreArray:@[]];

    [manager GET:urlString parameters:param headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
}

//首页红包数据弹窗判断
- (void)getHomeCommonDataWithsuccess:(successBlock)successBlock failure:(failureBlock)failureBlock {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary * param = @{};
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"app_home_in_for" paramDic:param ignoreArray:@[]];

    [manager GET:urlString parameters:param headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
}

//二维码弹窗
- (void)getHomeGZH_QrCodeWithSuccess:(successBlock)successBlock failure:(failureBlock)failureBlock {
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    NSDictionary * param = @{};
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"qr_code_popup" paramDic:param ignoreArray:@[]];
    [manager POST:urlString parameters:param headers:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
    }];
}

//新人红包
- (void)getNewPeoplePrizeWithSuccess:(successBlock)successBlock failure:(failureBlock)failureBlock {
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    NSDictionary * param = @{};
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"new_people_gift" paramDic:param ignoreArray:@[]];
    [manager POST:urlString parameters:param headers:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
    }];
}
//用户首登红包
- (void)getUserFirstLgoinPrizeWithSuccess:(successBlock)successBlock failure:(failureBlock)failureBlock {

    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    NSDictionary * param = @{};
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"first_login_gift" paramDic:param ignoreArray:@[]];
    
    [manager POST:urlString parameters:param headers:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
    }];
}
//获取热门搜索配置
- (void)getHomeSearchHotWordWithSuccess:(successBlock)successBlock failure:(failureBlock)failureBlock {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary * param = @{};

    
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"popular_search_configuration" paramDic:param ignoreArray:@[]];

    [manager GET:urlString parameters:param headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
    
}

- (void)getHomeSearchDataWithContent:(NSString *)content page:(NSInteger)page success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary * param = @{
                            @"keyword":content,
                            @"page":Integet_ToString(page),
                            @"page_size":@"10"
    };

    
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"home_search" paramDic:param ignoreArray:@[]];

    [manager GET:urlString parameters:param headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
    
}




- (void)getExpertListWithType:(NSString *)type page:(NSInteger)page Success:(successBlock)successBlock failure:(failureBlock)failureBlock {

    
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    
    NSDictionary * param = @{
                            @"type":type,
                            @"page":Integet_ToString(page),
                            @"page_size":@"10"
    };


    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"talent_expert" paramDic:param ignoreArray:@[]];

    [manager GET:urlString parameters:param headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
}

- (void)gzUserWithId:(NSString *)userId type:(NSString *)type success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    //is_gz = 1是关注 2 是取消关注
    //type 1红榜达人 2公众号专家 必填

    NSDictionary *param = @{
                            @"p_user_id":userId,
                            @"type":type};
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"behavior_subscribe" paramDic:param ignoreArray:@[]];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager POST:urlString parameters:param headers:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
    }];
}
//特别关注(关注专家发布的方案)
- (void)getConcernExpertTuiJianWithpage:(NSInteger)page success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary * param = @{
                            @"page":Integet_ToString(page),
                            @"page_size":@"10"
    };
    
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"my_special_attention" paramDic:param ignoreArray:@[]];

    [manager GET:urlString parameters:param headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
}
#pragma mark 公众号推荐相关
- (void)getGZHT_TuijianExpertDetailWithExpert_id:(NSString *)expert_id type:(NSString *)type page:(NSInteger)page Success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    
    NSDictionary * param = @{
                            @"expert_id":expert_id,
                            @"type":type,
                            @"page":Integet_ToString(page),
                            @"page_size":@"10"
    };
    if ([type integerValue]==1) {
        param = @{
                                @"expert_id":expert_id,
                                @"type":type,
                                @"page":Integet_ToString(page),
                                @"page_size":@"100"
        };
    }


    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"expert_info" paramDic:param ignoreArray:@[]];

    [manager GET:urlString parameters:param headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
}

//公众号推荐-推荐查看人数
- (void)getPlanLookWithTuijian_id:(NSString *)tuijian_id Page:(NSInteger)page success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    
    NSDictionary * param = @{
                            @"new_tuiJian_id":tuijian_id,
                            @"page":Integet_ToString(page),
                            @"page_size":@"24"
    };


    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"expert_browse" paramDic:param ignoreArray:@[]];

    [manager GET:urlString parameters:param headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
}
//公众号详情
- (void)getGZHT_TuijianDetailWithTuijian_id:(NSString *)tuijian_id orderID:(NSString *)order_id type:(NSString *)type Success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    NSMutableDictionary *param= [NSMutableDictionary dictionary];
    if (tuijian_id.length>0) {
        [param setValue:tuijian_id forKey:@"new_tuiJian_id"];
    }
    if (order_id.length>0) {
        [param setValue:order_id forKey:@"order_id"];
    }
    if (type.length>0) {
        [param setValue:type forKey:@"type"];
    }
//    NSDictionary * param = @{
//                            @"new_tuiJian_id":tuijian_id,
//                            @"order_id":order_id,
//                            @"type":type
//    };

    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"expert_detail" paramDic:param ignoreArray:@[]];

    [manager GET:urlString parameters:param headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
}
//社区-方案详情关联比赛
- (void)getGZHT_TuijianDetailMatchListWithTuijian_id:(NSString *)tuijian_id Success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    NSDictionary * param = @{
                            @"id":tuijian_id,
    };

    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"expert_match" paramDic:param ignoreArray:@[]];

    [manager GET:urlString parameters:param headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
}
//公众号详情底部热门方案推荐(只有已截止的比赛才有)
- (void)getGZHT_TuijianListWithUserid:(NSString *)userid Success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    NSDictionary * param = @{
                            @"author_user_id":userid,
    };

    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"popular_solutions_recommended" paramDic:param ignoreArray:@[]];

    [manager GET:urlString parameters:param headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
}
#pragma mark 红榜推荐相关
- (void)getHongbang_TuijianExpertDetailWithExpert_id:(NSString *)expert_id type:(NSString *)type page:(NSInteger)page Success:(successBlock)successBlock failure:(failureBlock)failureBlock {

    
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    
    NSDictionary * param = @{
                            @"talent_id":expert_id,
                            @"type":type,
                            @"page":Integet_ToString(page),
                            @"page_size":@"10"
    };


    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"talent_detail" paramDic:param ignoreArray:@[]];

    [manager GET:urlString parameters:param headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
}
//红榜详情
- (void)getHongbang_TuijianDetailWithTuijian_id:(NSString *)tuijian_id orderID:(NSString *)order_id type:(NSString *)type  Success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    if (tuijian_id.length>0) {
        [param setValue:tuijian_id forKey:@"tuijian_id"];
    }
    if (order_id.length>0) {
        [param setValue:order_id forKey:@"order_id"];
    }
    if (type.length>0) {
        [param setValue:type forKey:@"type"];
    }

    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"talent_plan" paramDic:param ignoreArray:@[]];

    [manager GET:urlString parameters:param headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
}
//红榜详情底部的方案
- (void)getHongbangDetail_Bottom_HotTj_WithTuijian_id:(NSString *)tuijian_id Success:(successBlock)successBlock failure:(failureBlock)failureBlock {

    
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    
    NSDictionary * param = @{
                            @"tuijian_id":tuijian_id,
    };

    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"talent_hot" paramDic:param ignoreArray:@[]];

    [manager GET:urlString parameters:param headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
}
//获取我的可使用的红包列表
/*
 type 可使用的红包类型(1红榜方案可使用红包, 2专家方案可使用红包)
 **/
- (void)getMyHongbaoListWithType:(NSString *)type ID:(NSString *)ID Success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    
    NSDictionary * param = @{
                            @"type":type,
                            @"id":ID
    };

    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"order_my_hongbao" paramDic:param ignoreArray:@[]];

    [manager GET:urlString parameters:param headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
    
}

//获取我可使用的免单券
//type 1红榜方案可使用免单券, 2专家方案可使用免单券
- (void)getMyFreeCouponWithType:(NSString *)type ID:(NSString *)ID Success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    
    NSDictionary * param = @{@"type":type,
                             @"id":ID
    };

    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"order_my_coupon" paramDic:param ignoreArray:@[]];

    [manager GET:urlString parameters:param headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
    
}
//确认订单
/*
 unique 不同购买场景下的关键值(scene=1时, unique为充值金额;scene=2时, unique为专家方案id;scene=3时, 0为包月,非0为单场比赛方案id;scene=4时, unique为红榜达人方案id;scene=5时, unique为ai发布到红榜达人的方案id)
 scene 下单购买场景(1充值, 2购买专家方案, 3购买大数据订阅, 4购买红榜方案, 5购买ai方案, 6订阅专栏周期,7购买数据模型,8打赏专家方案,9打赏红榜方案,10打赏文章)
 source 客户端,订单来源(1 ios app,2 android app,3 (微信h5),5 公众号单独链接支付,6 PC,7 销售,8 订阅号,9 朋友圈,10 服务号,11 非微信h5浏览器(h5))
 price 打赏金额
 
 **/
- (void)getConfirmOrderWithUnique:(NSString *)unique scene:(NSString *)scene source:(NSString *)source price:(NSString *)price Success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    NSDictionary * param = @{
                            @"unique":unique,
                            @"scene":scene,
                            @"source":source,
                            @"price":price
    };

    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"order_confirm" paramDic:param ignoreArray:@[]];

    [manager GET:urlString parameters:param headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
    
}

//下单并支付
/*
 order_key  订单key,唯一,下单凭证,有效期10分钟
 pay_type 支付方式(1支付宝支付, 2微信支付, 3红币支付, 4苹果支付)
 hongbao_id 红包id,默认为0
 coupon_id  免费券id,默认为0
 
 **/
- (void)getPayOrderWithOrder_key:(NSString *)order_key pay_type:(NSString *)pay_type hongbao_id:(NSString *)hongbao_id coupon_id:(NSString *)coupon_id Success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    NSDictionary * param = @{
                            @"order_key":order_key,
                            @"pay_type":pay_type,
                            @"hongbao_id":hongbao_id,
                            @"coupon_id":coupon_id
    };
    
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"order_create" paramDic:param ignoreArray:@[]];

    [manager GET:urlString parameters:param headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
    
}

#pragma mark 文章相关
- (void)getArticleDetailWithId:(NSString *)article_id Success:(successBlock)successBlock failure:(failureBlock)failureBlock{
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    
    NSDictionary * param = @{
                            @"article_id":article_id
    };

    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"article_detail" paramDic:param ignoreArray:@[]];

    [manager GET:urlString parameters:param headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
    
    
}

- (void)getArticleBrowseWithId:(NSString *)article_id article_cate:(NSString *)article_cate type:(NSString *)type success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    
    NSDictionary * param = @{
                            @"article_cate":article_cate,
                            @"article_id":article_id,
                            @"type":type
    };

    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"behavior" paramDic:param ignoreArray:@[]];

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
