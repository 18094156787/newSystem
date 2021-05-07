//
//  SmsManager.h
//  Jingcai
//
//  Created by Rain on 2018/11/19.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import <Foundation/Foundation.h>

// 类型
typedef NS_ENUM(NSInteger, SMSCodeType) {
//    SMSCodeTypeUnknown = 0,
    SMSCodeTypeRegister = 0,
    SMSCodeTypeLogin = 1,
    SMSCodeTypeBind = 2,
    SMSCodeTypeChange = 3,
    SMSCodeTypeAccontDisable = 4,
    SMSCodeTypeWechatBind = 5,//微信绑定手机
    SMSCodeTypeCheckOldBind = 6,//校验绑定的旧手机,
    
};

NS_ASSUME_NONNULL_BEGIN
@interface SmsManager : NSObject
//@property (assign, nonatomic) SMSCodeType smsCodeType;
+ (instancetype)sharedManager;
- (void)getCodeWithTel:(NSString *)tel type:(SMSCodeType)type isDebug:(BOOL)isDebug callback:(void(^)(BOOL isSucceed, NSString * code))callback;
@end
NS_ASSUME_NONNULL_END
