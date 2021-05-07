//
//  JCPayMethodManager.m
//  Jingcai
//
//  Created by Administrator on 2018/12/26.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "JCPayMethodManager.h"
#import <PassKit/PassKit.h>
#import "WXApi.h"
#import "JCWSettingBall.h"

@implementation JCPayMethodManager
+ (BOOL)isApplePayAvailable {
    if (![JCWSettingBall currentSetting].isApplePayAvailable) {
        return NO;
    }
    // 判断设备是否支持ApplePay
    if (![PKPaymentAuthorizationViewController class]) {
        NSLog(@"不支持ApplePay");
        return NO;
    }
    if (![PKPaymentAuthorizationViewController canMakePayments]) {
        NSLog(@"不支持ApplePay");
        return NO;
    }
    // 展示苹果支付图标
    return YES;
}
+ (BOOL)isChinaUnionCardAdd {
    if (![PKPaymentAuthorizationViewController canMakePaymentsUsingNetworks:@[PKPaymentNetworkChinaUnionPay]] )
    {
        NSLog(@"无法使用银联卡支付,或者没有添加相应的卡片");
        return NO;
    }
    return YES;
}

@end
