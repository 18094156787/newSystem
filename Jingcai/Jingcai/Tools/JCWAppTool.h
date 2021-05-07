//
//  JCWAppTool.h
//  Jingcai
//
//  Created by Rain on 2018/11/19.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface JCWAppTool : NSObject
+ (void)openUrl:(NSString *)url;//跳转链接
+ (void)isUserNotificationEnable:(void(^)(BOOL isEnabled))callback;
+ (void)goToAppSystemSetting;//跳转系统设置

+ (BOOL)isPureInt:(NSString*)string;//整形
+ (BOOL)isPureFloat:(NSString*)string;//浮点型
//纯数字
+ (BOOL)isDigitWithStr:(NSString *)str;
//英文或者数字
+ (BOOL)isEnglishOrNumberWithStr:(NSString *)str;
//纯中文
+ (BOOL)isChineseCharacter:(NSString*)source;
//rsa加密
+ (NSString *)getRSA_String:(NSString*)string;
//NSData转NSDictionary
+ (NSDictionary *)dictionaryForJsonData:(NSData *)jsonData;
@end
NS_ASSUME_NONNULL_END
