//
//  JCWStringTool.m
//  AutumnFinance
//
//  Created by Rain on 2018/7/9.
//  Copyright © 2018年 rain. All rights reserved.
//

#import "JCWStringTool.h"

@implementation JCWStringTool

+ (BOOL)isEmptyStr:(NSString *)str {
    //return [str isEqualToString:@""] || (str == nil);
    if ([str isKindOfClass:[NSNull class]]) {
        return YES;
    }
    return !(str.length > 0);
}
+ (BOOL)isValidateMobile:(NSString *)mobile {
    if ([mobile isKindOfClass:[NSNull class]]) {
        return NO;
    }
    if (mobile.length == 0) {
        return NO;
    }
    //手机号以1开头，共11位
    if ([mobile characterAtIndex:0] == '1' && mobile.length == 11) {
        return YES;
    }
    return NO;
}
+ (BOOL)isUrlAddress:(NSString *)url {
    NSString * reg = @"((http[s]{0,1}|ftp)://[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)|(www.[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)";
    
    NSPredicate * urlPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", reg];
    
    return [urlPredicate evaluateWithObject:url];
}

+ (BOOL)isEmailAddress:(NSString *)email {

    
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}


@end
