//
//  JCWJsonTool.m
//  CoinWay
//
//  Created by Rain on 2018/7/11.
//  Copyright © 2018年 rain. All rights reserved.
//

#import "JCWJsonTool.h"
#import <YYModel/YYModel.h>

//成功返回时的code状态码
/*
200 正常
9999 正常的业务逻辑异常
10001 用户登录 token 错误或者失效 10002 需要重定向
 */
typedef NS_ENUM(NSInteger, ResponseCode) {
    ResponseCodeSuccess = 200,
    ResponseCodeNotLogin  = 10001,//用户登录 token 错误或者失效
    ResponseCodeNeedPay = 202,//需要支付
//    ResponseCodeNotLogin = 404, // 没有登录
    ResponseCodeSmsSuccess = 10000
};

@implementation JCWJsonTool
+ (BOOL)isSuccessResponse:(id)json {
//    NSLog(@"返回的数据:%@",json);
    NSInteger code = [json[@"code"] integerValue];
    return code == ResponseCodeSuccess;
}

+ (BOOL)isNeedPay:(id)json {
    NSInteger code = [json[@"code"] integerValue];
    return code == ResponseCodeNeedPay;
}

+ (BOOL)isSuccessSendSms:(id)json {
    NSInteger code = [json[@"code"] integerValue];
    return code == ResponseCodeSmsSuccess;
}
+ (BOOL)isNotLoginResponse:(id)json {
    NSInteger code = [json[@"code"] integerValue];
    return code == ResponseCodeNotLogin;
}
+ (instancetype)entityWithJson:(id)json class:(Class)class {
    @try {
        [class yy_modelWithJSON:json];

    } @catch (NSException *exception) {
        NSLog(@"捕获到异常");
    } @finally {
        //
        if (![json isKindOfClass:[NSDictionary class]]) {
            return nil;
        }
        
    }
    return [class yy_modelWithJSON:json];
}
+ (NSArray *)arrayWithJson:(id)json class:(Class)class {
    return [NSArray yy_modelArrayWithClass:class json:json];
}
@end
