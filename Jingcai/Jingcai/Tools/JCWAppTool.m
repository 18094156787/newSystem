//
//  JCWAppTool.m
//  Jingcai
//
//  Created by Rain on 2018/11/19.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "JCWAppTool.h"
#import <UIKit/UIKit.h>
#import <UserNotifications/UserNotifications.h>
#import "RSA.h"

@implementation JCWAppTool
+ (void)openUrl:(NSString *)url {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url] options:@{} completionHandler:nil];
}
+ (void)isUserNotificationEnable:(void(^)(BOOL isEnabled))callback { // 判断用户是否允许接收通知
    [[UNUserNotificationCenter currentNotificationCenter] getNotificationSettingsWithCompletionHandler:^(UNNotificationSettings * _Nonnull settings) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (settings.authorizationStatus == UNAuthorizationStatusAuthorized) {
                callback(YES);
            } else {
                callback(NO);
            }
        });
    }];
}
// 如果用户关闭了接收通知功能，该方法可以跳转到APP设置页面进行修改
+ (void)goToAppSystemSetting {
    UIApplication *application = [UIApplication sharedApplication];
    NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
    if ([application canOpenURL:url]) {
        [application openURL:url options:@{} completionHandler:nil];
    }
}
//判断是否为整形
+ (BOOL)isPureInt:(NSString*)string {
    NSScanner* scan = [NSScanner scannerWithString:string];
    int val;
    return[scan scanInt:&val] && [scan isAtEnd];
}
//判断是否为浮点形：

+ (BOOL)isPureFloat:(NSString*)string {
    NSScanner* scan = [NSScanner scannerWithString:string];
    float val;
    return[scan scanFloat:&val] && [scan isAtEnd];
}
//判断纯数字
+ (BOOL)isDigitWithStr:(NSString *)str {
    NSCharacterSet *alphaNums = [NSCharacterSet decimalDigitCharacterSet];
    NSCharacterSet *inStringSet = [NSCharacterSet characterSetWithCharactersInString:str];
    return [alphaNums isSupersetOfSet:inStringSet];
}

+ (BOOL)isEnglishOrNumberWithStr:(NSString *)str {
    NSString * regex = @"^[A-Za-z0-9]+$";

    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];

    BOOL isMatch = [pred evaluateWithObject:str];
    return isMatch;
}
+ (BOOL)isChineseCharacter:(NSString*)source {

    NSString *regex = @"^[\\u4E00-\\u9FEA]+$";

    return ([source rangeOfString:regex options:NSRegularExpressionSearch].length>0);

}

+ (NSString *)getRSA_String:(NSString*)string {

    NSString *pubkey = @"-----BEGIN PUBLIC KEY-----\nMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCufOiINi6Kcp5AX1cBBvyQfLbbDTeH1UNtHQXHU53SBGjjQ4q3TbDrWkgTiqroMERpZy1hC/tJDw/JRdnCx3RUcMqGfKpDWalFeHxXGnyOuJjTv3RTeWvLerGCFYUCShExoa+GWC7Oq/zQnakW5QAaZJl3+wGKmUpnpkWoQaX/iQIDAQAB\n-----END PUBLIC KEY-----";
    NSString *value = [RSA encryptString:string publicKey:pubkey];
    return value;

}

+ (NSDictionary *)dictionaryForJsonData:(NSData *)jsonData

{

    if (![jsonData isKindOfClass:[NSData class]] || jsonData.length < 1) {

        return nil;

    }

    id jsonObj = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:nil];

    if (![jsonObj isKindOfClass:[NSDictionary class]]) {

        return nil;

    }

    return [NSDictionary dictionaryWithDictionary:(NSDictionary *)jsonObj];

}

@end
