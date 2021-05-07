//
//  WXApiManager.h
//  Jingcai
//
//  Created by Rain on 2018/11/16.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WXApi.h"
#import "WXPaymentBall.h"

typedef void (^WXLoginSuccessBlock)(void); // 微信登录成功
typedef void (^WXLoginFailureBlock)(void); // 微信登录失败
typedef void (^WXPaySuccessBlock)(void); // 微信支付成功
typedef void (^WXPayFailureBlock)(void); // 微信支付失败

NS_ASSUME_NONNULL_BEGIN

@interface WXApiManager : NSObject
@property (copy, nonatomic) WXLoginSuccessBlock loginSuccessBlock;
@property (copy, nonatomic) WXLoginFailureBlock loginFailureBlock;
@property (copy, nonatomic) WXPaySuccessBlock wxPaySuccessBlock;
@property (copy, nonatomic) WXPayFailureBlock wxPayFailureBlock;
+ (instancetype)sharedManager;
- (void)wxLogin;
- (void)wxPayWithPayment:(WXPaymentBall *)wxPaymentBall;
//跳转微信公众号
- (void)jumpWXSubscribeWithUrl:(NSString *)url;
//打开微信内置网页浏览器
- (void)openWebWithUrl:(NSString *)url;
//发送订阅消息
- (void)sendSubscribe;
@end

NS_ASSUME_NONNULL_END
