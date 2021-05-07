//
//  SmsManager.m
//  Jingcai
//
//  Created by Rain on 2018/11/19.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "SmsManager.h"
#import "JCWStringTool.h"
#import "JCWJsonTool.h"
#import "JCWToastTool.h"

@implementation SmsManager
+ (instancetype)sharedManager {
    static dispatch_once_t onceToken;
    static SmsManager *instance;
    dispatch_once(&onceToken, ^{
        instance = [[SmsManager alloc] init];
    });
    return instance;
}
- (void)getCodeWithTel:(NSString *)tel type:(SMSCodeType)type isDebug:(BOOL)isDebug callback:(void(^)(BOOL isSucceed, NSString * code))callback {
    if (![JCWStringTool isValidateMobile:tel]) {
        [JCWToastTool showHint:@"手机号码有误，请重填"];
        callback(NO, nil);
        return ;
    }
    NSLog(@"self.smsCodeType == %ld", type);
    JCUserService_New *service = [JCUserService_New service];
    [service getSmsCodeWithTelNum:tel type:type success:^(id  _Nullable object) {
        if ([JCWJsonTool isSuccessResponse:object]) {
            [JCWToastTool showHint:@"验证码发送成功"];
            callback(YES, object[@"data"]);
            return ;
        }
        [JCWToastTool showHint:object[@"msg"]];
        callback(NO, nil);
    } failure:^(NSError * _Nonnull error) {
        [JCWToastTool showHint:@"验证码发送失败"];
        callback(NO, nil);
    }];
}

@end
