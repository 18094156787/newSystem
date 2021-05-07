//
//  JCWStringTool.h
//  AutumnFinance
//
//  Created by Rain on 2018/7/9.
//  Copyright © 2018年 rain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface JCWStringTool : NSObject

//判断字符串是否为空
+ (BOOL)isEmptyStr:(NSString *)str;
//验证手机号是否合法
+ (BOOL)isValidateMobile:(NSString *)mobile;
//判断是否为网址
+ (BOOL)isUrlAddress:(NSString *)url;
//判断是否是邮箱
+ (BOOL)isEmailAddress:(NSString *)email;

@end
