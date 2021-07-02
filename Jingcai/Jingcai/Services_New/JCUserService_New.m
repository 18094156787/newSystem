//
//  JCUserService_New.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/12/29.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCUserService_New.h"

@implementation JCUserService_New
//发送短信验证码
- (void)getSmsCodeWithTelNum:(NSString *)telNum type:(NSInteger)type success:(successBlock)successBlock failure:(failureBlock)failureBlock {
//0注册，1登录，2绑定手机，3忘记密码 默认为0
    NSString *phone = [JCWAppTool getRSA_String:telNum];

    // POST方式
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary * param = @{
                            @"mobile":phone,
                            @"type":[NSString stringWithFormat:@"%ld",type]};
    
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"sendsms" paramDic:param ignoreArray:@[]];

    [manager GET:urlString parameters:param headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
        NSLog(@"验证码%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];

}

- (void)registerWithTel:(NSString *)tel pass:(NSString *)pass code:(NSString *)code success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary *param = @{
                            @"mobile":tel,
                            @"password":pass,
                            @"code":code,
    };
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"register" paramDic:param ignoreArray:@[]];
    [manager GET:urlString parameters:param headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
}

- (void)loginWithTel:(NSString *)tel pass:(NSString *)pass success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    NSDictionary *param = @{
                            @"mobile":tel,
                            @"password":pass
    };
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"password_login" paramDic:param ignoreArray:@[]];

    [manager GET:urlString parameters:param headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
}
//微信登录
- (void)wxLoginWithParam:(NSDictionary *)param success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"iosWechatLogin" paramDic:param ignoreArray:@[]];
//    NSString * urlString = @"http://106.75.32.127:9503/wechat_app_login";

    [manager GET:urlString parameters:param headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
}

//微信绑定手机
- (void)bindTel:(NSString *)tel code:(NSString *)code pass:(NSString *)pass oauth_id:(NSString *)oauth_id success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    NSDictionary *param = @{
        @"mobile":tel,
        @"code":code,
        @"password":pass,
        @"oauth_id":oauth_id
    };
//    if (pass.length>0) {
//        param = @{
//            @"mobile":tel,
//            @"password":pass,
//            @"code":code,
//        };
//    }
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"wechat_bind" paramDic:param ignoreArray:@[]];
//    NSString * urlString = @"http://106.75.32.127:9503/wechat_app_login";

    [manager GET:urlString parameters:param headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
}

//换绑手机-校验旧手机号
- (void)VerifyPhone:(NSString *)phone code:(NSString *)code success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    NSDictionary *param = @{
        @"mobile":phone,
        @"code":code,
    };
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"bind_phone_check" paramDic:param ignoreArray:@[]];
//    NSString * urlString = @"http://106.75.32.127:9503/wechat_app_login";

    [manager GET:urlString parameters:param headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
}

- (void)loginWithTel:(NSString *)tel code:(NSString *)code success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    NSDictionary *param = @{
                            @"mobile":tel,
                            @"code":code
    };
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"sms_login" paramDic:param ignoreArray:@[]];
    [manager GET:urlString parameters:param headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
}

- (void)getMyUserInfoWithSuccess:(successBlock)successBlock failure:(failureBlock)failureBlock {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSString *token = [JCWUserBall currentUser].token;

    NSDictionary *param = @{@"token":token};
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"userinfo" paramDic:param ignoreArray:@[]];
    [manager GET:urlString parameters:param headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];

}

- (void)forgetPwdWithTel:(NSString *)tel pass:(NSString *)pass code:(NSString *)code success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary *param = @{

                            @"mobile":tel,
                            @"password":pass,
                            @"code":code,
                            };
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"forget_password" paramDic:param ignoreArray:@[]];
    [manager GET:urlString parameters:param headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
}

- (void)changePwdWithOldPass:(NSString *)oldPass newPass:(NSString *)newPass newPassT:(NSString *)newPassT success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary *param = @{
        @"token":NonNil([JCWUserBall currentUser].token),
                            @"old_password":oldPass,
                            @"new_password":newPass,
                            @"confirm_password":newPassT};
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"change_password" paramDic:param ignoreArray:@[]];
    [manager GET:urlString parameters:param headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
}

- (void)updateUserInfoWithType:(NSString *)type value:(NSString *)value code:(NSString *)code success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary *param = @{
                            @"type":type,
                            @"value":value,
                            @"code":code};
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"edit_profile" paramDic:param ignoreArray:@[]];
    [manager GET:urlString parameters:param headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
}
//获取审核达人信息
//type 类型 1昵称 2头像 4简介
- (void)getUserCheckInfoWithType:(NSString *)type success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary *param = @{
                            @"type":type
    };
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"get_user_info" paramDic:param ignoreArray:@[]];
    [manager GET:urlString parameters:param headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
}


- (void)getUserLogOutWithSuccess:(successBlock)successBlock failure:(failureBlock)failureBlock {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    NSString *token = [JCWUserBall currentUser].token;
//    NSDictionary *param = @{@"token":token};
    NSDictionary *param = @{};
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"logout" paramDic:param ignoreArray:@[]];
    [manager GET:urlString parameters:param headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];

}
/*
 注销账号
 op 操作, 1确认, 2确认身份, 3确定
 mobile 手机号, op为2时必传, 其他非必传
 code 手机验证码, op为2时必传,其他非必传
 **/
- (void)disableAccountTextWithoperation:(NSString *)op mobile:(NSString *)mobile code:(NSString *)code Success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary *param = @{
                            @"op":op,
                            @"mobile":mobile,
                            @"code":code};
    
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"account_cancel" paramDic:param ignoreArray:@[]];
    [manager GET:urlString parameters:param headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];

}


//绑定银行卡
- (void)getUserBindBankCardWithBankcard_number:(NSString *)bankcard_number  Bank_name:(NSString *)bank_name Nickname:(NSString *)nickname success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    NSDictionary *param = @{@"bank_name":bank_name,@"nick_name":nickname,@"card_number":bankcard_number};
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"bind_card" paramDic:param ignoreArray:@[]];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:urlString parameters:param headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
}
//获取用户绑定的银行卡信息
- (void)getMyBindCardInfoWithsuccess:(successBlock)successBlock failure:(failureBlock)failureBlock {
    NSDictionary *param = @{};
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"get_bind_card_info" paramDic:param ignoreArray:@[]];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:urlString parameters:param headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
}
//解绑银行卡
- (void)getUserUnbundlingBankCardWithBankcard_id:(NSString *)bankcard_id success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    NSDictionary *param = @{@"id":bankcard_id};
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"un_bind_card" paramDic:param ignoreArray:@[]];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:urlString parameters:param headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
}
//获取用户的专注列表
- (void)getMyConcernExpertkLsitWithType:(NSString *)type Page:(NSInteger)page  success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    NSDictionary *param = @{@"type":type,
                            @"page":Integet_ToString(page),
                            @"page_size":@"10"};
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"my_subscribe" paramDic:param ignoreArray:@[]];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:urlString parameters:param headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
}
//红币消费记录
- (void)getCoinRecordWithPage:(NSInteger)page Success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    NSDictionary *param = @{@"page":Integet_ToString(page),
                            @"page_size":@"10"};
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"redcoin_record" paramDic:param ignoreArray:@[]];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:urlString parameters:param headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
}
//红包列表-优惠券
- (void)getUserHongbaoLsitWithType:(NSString *)type Page:(NSInteger)page success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    NSDictionary *param = @{@"page":Integet_ToString(page),
                            @"page_size":@"10"};
//   type 竞猜的红包列表 type不传是全部 1是现金红包 2免单券 3是优惠券
    NSString *route = @"coupon";//默认是优惠券
    if ([type integerValue]==1) {
        route = @"cash_coupon";
    }
    if ([type integerValue]==2) {
        route = @"free_coupon";
    }
    if ([type integerValue]==3) {
        route = @"coupon";
    }
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:route paramDic:param ignoreArray:@[]];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:urlString parameters:param headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
}

//单个小额提现
/*
 type 操作类型,1获取单个红包提现信息,2获取全部红包提现信息(红包id不必传),3提现单个现金红包,4提现全部现金红包(红包id不必传)
 id 提现的红包id
 ali_account 支付宝账号
 **/
- (void)getHongbaoSubmitWithType:(NSString *)type hongbao_id:(NSString *)hongbao_id Email:(NSString *)email name:(NSString *)name success:(successBlock)successBlock failure:(failureBlock)failureBlock {
//    NSDictionary *param = @{
//        @"type":type,
//        @"id":hongbao_id,
//                            @"ali_account":email};
    NSMutableDictionary *param = [NSMutableDictionary dictionaryWithObject:type forKey:@"type"];
    if (hongbao_id.length>0) {
        [param setValue:hongbao_id forKey:@"id"];
    }
    if (email.length>0) {
        [param setValue:email forKey:@"ali_account"];
    }
    if (name.length>0) {
        [param setValue:name forKey:@"name"];
    }
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"cash_withdraw" paramDic:param ignoreArray:@[]];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:urlString parameters:param headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
}



//获取我所有的可提现的小额红包金额
- (void)getMyAllSmallMoneyWithSuccess:(successBlock)successBlock failure:(failureBlock)failureBlock {
    
}
//购买记录
//type 1是公众号方案,2是达人方案,3是ai方案,4是数据订阅
- (void)getMyBuyPlanListWithType:(NSString *)type WithPage:(NSInteger)page DataSuccess:(successBlock)successBlock failure:(failureBlock)failureBlock {
    NSDictionary *param = @{@"page":Integet_ToString(page),
                            @"page_size":@"10"};
    NSString *route = @"";
    if ([type intValue]==1) {
        route = @"purchase_record_public";
    }
    if ([type intValue]==2) {
        route = @"purchase_record_master";
    }
    if ([type intValue]==3) {
        route = @"purchase_record_ai";
    }
    if ([type intValue]==4) {
        route = @"purchase_record_data";
    }
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:route paramDic:param ignoreArray:@[]];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:urlString parameters:param headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
    }];
}

//订单详情(红榜和公众号是同一个)
/*
 zucai_order_id 订单ID 订单表的ID 不是 订单号
 all_wl 达人、AI方案、数据订阅（单场） 三种类型下 才需要传 且只有一个 方案结果 1红2 黑 5 走水 6延迟  7取消
 wl 达人、AI方案、数据订阅（单场）三种类型下 才需要传 有可能多个 多个用逗号隔开 比赛结果 1红2 黑 5 走水 6延迟  7取消
 **/
- (void)getOrderDetailWithOrder_id:(NSString *)zucai_order_id all_wl:(NSString *)all_wl wl:(NSString *)wl Success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    NSDictionary *param = @{@"zucai_order_id":zucai_order_id,
                            @"all_wl":all_wl,
                            @"wl":wl
    };
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"order_detail" paramDic:param ignoreArray:@[]];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:urlString parameters:param headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
}
//意见反馈
- (void)getSubmitSuggestionWithContent:(NSString *)content image:(NSString *)image phone:(NSString *)phone email:(NSString  *)email success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    NSDictionary *param = @{@"content":content,
                            @"image":image,
                            @"phone":phone,
                            @"email":email
    };

    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"feedback_submit" paramDic:param ignoreArray:@[]];
    NSString *requestUrl = urlString;

    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];

    //如果你不需要将通过body传 那就参数放入parameters里面

    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] requestWithMethod:@"POST" URLString:requestUrl parameters:nil error:nil];

    NSLog(@"requestURL:%@",requestUrl);

    request.timeoutInterval= 10;

    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];

    // 设置body 在这里将参数放入到body
    NSData *body = [NSJSONSerialization dataWithJSONObject:param options:NSUTF8StringEncoding error:nil];


    [request setHTTPBody:body];

    AFHTTPResponseSerializer *responseSerializer = [AFHTTPResponseSerializer serializer];

    responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/html",@"text/json",@"text/javascript",@"text/plain",nil];

    manager.responseSerializer = responseSerializer;
    

    [[manager dataTaskWithRequest:request uploadProgress:nil downloadProgress:nil completionHandler:^(NSURLResponse *response,id responseObject,NSError *error){

    if(responseObject!=nil){
        NSDictionary *resultDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];//解析

//    success(responseObject);
        [self deathWithSuccessInfo:resultDic];
        successBlock(resultDic);

    }
    if (error) {

        failureBlock(error);
        [self dealWithError:error];
    }
    }]resume];
}
//消息列表
- (void)getPersonCenterMessageListWithPage:(NSInteger)page success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    NSDictionary *param = @{@"page":Integet_ToString(page),
                            @"page_size":@"10"};
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"message" paramDic:param ignoreArray:@[]];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:urlString parameters:param headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
}

//邀请好友列表
- (void)getMyInviteFriendListWithPage_size:(NSString *)page_size success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    NSDictionary *param = @{
                            @"page_size":page_size};
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"refer_list" paramDic:param ignoreArray:@[]];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:urlString parameters:param headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
}
//邀请好友-拆红包
- (void)getMyInviteFriendChaiHongbaoWithsuccess:(successBlock)successBlock failure:(failureBlock)failureBlock {
    NSDictionary *param = @{};
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"open_red_packets" paramDic:param ignoreArray:@[]];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:urlString parameters:param headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
}

#pragma mark//方案相关
//发布记录
/*
 type  1 待审核 2已发布 3全部 默认3
 **/
- (void)getMyPostTuiJianListWithType:(NSString *)type Page:(NSInteger)page success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    NSDictionary *param = @{
                            @"type":type,
                            @"page":Integet_ToString(page),
                            @"page_size":@"10"};
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"get_my_hb_plan" paramDic:param ignoreArray:@[]];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:urlString parameters:param headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
}

//方案收入顶部信息
- (void)getMyIncomeDetailTopInfoWithsuccess:(successBlock)successBlock failure:(failureBlock)failureBlock {
    NSDictionary *param = @{};
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"project_income" paramDic:param ignoreArray:@[]];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:urlString parameters:param headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
}
//方案收入-收益明细
- (void)getMyIncomeDetailLsitWithPage:(NSInteger)page  success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    NSDictionary *param = @{
                            @"page":Integet_ToString(page),
                            @"page_size":@"10"};
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"project_income_detail" paramDic:param ignoreArray:@[]];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:urlString parameters:param headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
}

//方案收入-提现记录
- (void)getMyWithDrawDetailLsitWithPage:(NSInteger)page  success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    NSDictionary *param = @{
                            @"page":Integet_ToString(page),
                            @"page_size":@"10"};
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"withdrawal_record" paramDic:param ignoreArray:@[]];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:urlString parameters:param headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
}
//方案收入-稿酬详情
- (void)getMyIncomeGaoChouDetaillWithsuccess:(successBlock)successBlock failure:(failureBlock)failureBlock {
    NSDictionary *param = @{};
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"income_withdrawal_page" paramDic:param ignoreArray:@[]];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:urlString parameters:param headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
}
//方案收入-稿酬提现
- (void)getUserWithdrawalActionWithsuccess:(successBlock)successBlock failure:(failureBlock)failureBlock {
    NSDictionary *param = @{};
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"income_withdrawal" paramDic:param ignoreArray:@[]];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:urlString parameters:param headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
    
}

#pragma mark//通用
//上传图片
- (void)uploadAvatarWithImage:(UIImage *)image type:(NSString *)type success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    [SVProgressHUD show];
    NSData *imageData = UIImageJPEGRepresentation(image, 0.1);
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary *param = @{};
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"upload" paramDic:param ignoreArray:@[]];
    [manager POST:urlString parameters:param headers:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"yyyyMMddHHmmssfff";
        NSString *fileName = [NSString stringWithFormat:@"%@.png",[formatter stringFromDate:[NSDate date]]];
        [formData appendPartWithFileData:imageData name:@"image_name" fileName:fileName mimeType:@"image/jpg/png/jpeg"];
        [formData appendPartWithFormData:[type dataUsingEncoding:NSUTF8StringEncoding] name:@"type"];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [SVProgressHUD dismiss];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD dismiss];
        failureBlock(error);
    }];
}
//上传图片带宽高
- (void)uploadAvatarWithImage:(UIImage *)image type:(NSString *)type width:(NSString *)width height:(NSString *)height success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    [SVProgressHUD show];
    NSData *imageData = UIImageJPEGRepresentation(image, 0.1);
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary *param = @{@"width":width,height:height};
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"upload" paramDic:param ignoreArray:@[]];
    [manager POST:urlString parameters:param headers:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"yyyyMMddHHmmssfff";
        NSString *fileName = [NSString stringWithFormat:@"%@.png",[formatter stringFromDate:[NSDate date]]];
        [formData appendPartWithFileData:imageData name:@"image_name" fileName:fileName mimeType:@"image/jpg/png/jpeg"];
        [formData appendPartWithFormData:[type dataUsingEncoding:NSUTF8StringEncoding] name:@"type"];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [SVProgressHUD dismiss];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD dismiss];
        failureBlock(error);
    }];
}
//版本更新
- (void)getAppUpdateWithsuccess:(successBlock)successBlock failure:(failureBlock)failureBlock {
    NSDictionary *param = @{};
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"app_download" paramDic:param ignoreArray:@[]];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:urlString parameters:param headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
}
//推送开关
- (void)openPushWithSuccess:(successBlock)successBlock failure:(failureBlock)failureBlock {
    NSDictionary *param = @{};
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"change_tuisong" paramDic:param ignoreArray:@[]];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:urlString parameters:param headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
}
#pragma mark//申请签约相关

//敏感词检测
- (void)getPlanSensitiveWordWithTitle:(NSString *)title Citation:(NSString *)citation Content:(NSString *)content success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    NSDictionary *param = @{@"title":title,@"citation":citation,@"content":content};
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"filter_words" paramDic:param ignoreArray:@[]];
    NSString *requestUrl = urlString;

    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];

    //如果你不需要将通过body传 那就参数放入parameters里面

    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] requestWithMethod:@"POST" URLString:requestUrl parameters:nil error:nil];

    NSLog(@"requestURL:%@",requestUrl);

    request.timeoutInterval= 10;

    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];

    // 设置body 在这里将参数放入到body
    NSData *body = [NSJSONSerialization dataWithJSONObject:param options:NSUTF8StringEncoding error:nil];


    [request setHTTPBody:body];

    AFHTTPResponseSerializer *responseSerializer = [AFHTTPResponseSerializer serializer];

    responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/html",@"text/json",@"text/javascript",@"text/plain",nil];

    manager.responseSerializer = responseSerializer;
    

    [[manager dataTaskWithRequest:request uploadProgress:nil downloadProgress:nil completionHandler:^(NSURLResponse *response,id responseObject,NSError *error){

    if(responseObject!=nil){
        NSDictionary *resultDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];//解析

//    success(responseObject);
        [self deathWithSuccessInfo:resultDic];
        successBlock(resultDic);

    }
    if (error) {

        failureBlock(error);
        [self dealWithError:error];
    }
    }]resume];
}

//type 类型 1竞彩，2让球，3进球数
- (void)getPostPlan_MatchListWithType:(NSString *)type page:(NSInteger)page  Success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    NSString *token = [JCWUserBall currentUser].token;
//    NSDictionary *param = @{@"token":token};
    NSDictionary *param = @{@"type":type,
                            @"page":Integet_ToString(page),
                            @"page_size":@"100"};
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"get_plan_match_list" paramDic:param ignoreArray:@[]];
    [manager GET:urlString parameters:param headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];

}

- (void)getPostPlan_MatchDetailWithMatch_id:(NSString *)match_id type:(NSString *)type Success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary *param = @{@"type":type,
                            @"match_id":match_id};
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"get_match_odds" paramDic:param ignoreArray:@[]];
    [manager GET:urlString parameters:param headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];

}

- (void)getApplyQy_PostMatchInfoWithParamDic:(NSDictionary *)param success:(successBlock)successBlock failure:(failureBlock)failureBlock {

    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"create_or_update_scheme" paramDic:param ignoreArray:@[]];
    NSString *requestUrl = urlString;

    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];

    //如果你不需要将通过body传 那就参数放入parameters里面

    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] requestWithMethod:@"POST" URLString:requestUrl parameters:nil error:nil];

    NSLog(@"requestURL:%@",requestUrl);

    request.timeoutInterval= 10;

    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];

    // 设置body 在这里将参数放入到body
    NSData *body = [NSJSONSerialization dataWithJSONObject:param options:NSUTF8StringEncoding error:nil];


    [request setHTTPBody:body];

    AFHTTPResponseSerializer *responseSerializer = [AFHTTPResponseSerializer serializer];

    responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/html",@"text/json",@"text/javascript",@"text/plain",nil];

    manager.responseSerializer = responseSerializer;
    

    [[manager dataTaskWithRequest:request uploadProgress:nil downloadProgress:nil completionHandler:^(NSURLResponse *response,id responseObject,NSError *error){

    if(responseObject!=nil){
        NSDictionary *resultDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];//解析

//    success(responseObject);
        [self deathWithSuccessInfo:resultDic];
        successBlock(resultDic);

    }
    if (error) {

        failureBlock(error);
        [self dealWithError:error];
    }
    }]resume];

}

- (void)getApplyQy_PostFinalWithParamDic:(NSDictionary *)param success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"user_application" paramDic:param ignoreArray:@[]];
    NSString *requestUrl = urlString;

    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];

    //如果你不需要将通过body传 那就参数放入parameters里面

    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] requestWithMethod:@"POST" URLString:requestUrl parameters:nil error:nil];

    NSLog(@"requestURL:%@",requestUrl);

    request.timeoutInterval= 10;

    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];

    // 设置body 在这里将参数放入到body
    NSData *body = [NSJSONSerialization dataWithJSONObject:param options:NSUTF8StringEncoding error:nil];


    [request setHTTPBody:body];

    AFHTTPResponseSerializer *responseSerializer = [AFHTTPResponseSerializer serializer];

    responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/html",@"text/json",@"text/javascript",@"text/plain",nil];

    manager.responseSerializer = responseSerializer;
    

    [[manager dataTaskWithRequest:request uploadProgress:nil downloadProgress:nil completionHandler:^(NSURLResponse *response,id responseObject,NSError *error){

    if(responseObject!=nil){
        NSDictionary *resultDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];//解析

//    success(responseObject);
        [self deathWithSuccessInfo:resultDic];
        successBlock(resultDic);

    }
    if (error) {

        failureBlock(error);
        [self dealWithError:error];
    }
    }]resume];

}

- (void)getPostPlan_planDetailWithTuijian_id:(NSString *)tuijian_id Success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary *param = @{@"id":tuijian_id};
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"get_scheme_info" paramDic:param ignoreArray:@[]];
    [manager GET:urlString parameters:param headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];

}

- (void)getPostPlan_postInfoDetailWithSuccess:(successBlock)successBlock failure:(failureBlock)failureBlock {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary *param = @{};
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"user_application_info" paramDic:param ignoreArray:@[]];
    [manager GET:urlString parameters:param headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];

}
//审核被拒-重置签约状态
- (void)changeMyCheckStatusWithsuccess:(successBlock)successBlock failure:(failureBlock)failureBlock {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary *param = @{};
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"reset_the_application" paramDic:param ignoreArray:@[]];
    [manager GET:urlString parameters:param headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];

    
}

//h5邀请签约-稿酬详情
/*
 inviter_id 邀请人id
 config_id 达人稿酬配置ID
 **/
- (void)getInviteExpertWithGaoChouDetaillWithInviter_id:(NSString *)inviter_id Config_id:(NSString *)config_id success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    NSDictionary *param = @{@"inviter_id":NonNil(inviter_id),@"config_id":NonNil(config_id)};
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"get_remuneration" paramDic:param ignoreArray:@[]];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:urlString parameters:param headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
}
#pragma mark//发布方案相关
//发布方案价格
- (void)getPostPlanPriceWithSuccess:(successBlock)successBlock failure:(failureBlock)failureBlock {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary *param = @{};
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"fabu_total" paramDic:param ignoreArray:@[]];
    [manager GET:urlString parameters:param headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
    
}

//发布方案-创建/编辑
- (void)getPostMatchInfoWithPostID:(NSString *)postID Param:(NSDictionary *)param success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    NSMutableDictionary *m_param = [NSMutableDictionary dictionaryWithDictionary:param];
    if (postID.length>0) {
        [m_param setObject:postID forKey:@"id"];
    }
    NSString *route = @"release_plan";
    if (postID.length>0) {
        route = @"edit_my_plan";
    }
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:route paramDic:m_param ignoreArray:@[]];

    NSString *requestUrl = urlString;

    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];

    //如果你不需要将通过body传 那就参数放入parameters里面

    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] requestWithMethod:@"POST" URLString:requestUrl parameters:nil error:nil];

    NSLog(@"requestURL:%@",requestUrl);

    request.timeoutInterval= 10;

    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];

    // 设置body 在这里将参数放入到body
    NSData *body = [NSJSONSerialization dataWithJSONObject:param options:NSUTF8StringEncoding error:nil];


    [request setHTTPBody:body];

    AFHTTPResponseSerializer *responseSerializer = [AFHTTPResponseSerializer serializer];

    responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/html",@"text/json",@"text/javascript",@"text/plain",nil];

    manager.responseSerializer = responseSerializer;
    

    [[manager dataTaskWithRequest:request uploadProgress:nil downloadProgress:nil completionHandler:^(NSURLResponse *response,id responseObject,NSError *error){


    if (error) {

        failureBlock(error);
        [self dealWithError:error];
    }else{
        if(responseObject!=nil){
            NSDictionary *resultDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];//解析

    //    success(responseObject);
            [self deathWithSuccessInfo:resultDic];
            successBlock(resultDic);

        }
    }
    }]resume];

}
//发布方案-查看
- (void)getMyPostMatchDetailWithTuiJianID:(NSString *)tuijian_id  success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary *param = @{@"id":tuijian_id};
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"get_plan_info" paramDic:param ignoreArray:@[]];
    [manager GET:urlString parameters:param headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];

}
@end
