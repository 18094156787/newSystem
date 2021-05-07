//
//  JCWSettingBall.h
//  Jingcai
//
//  Created by Administrator on 2019/2/1.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN
@interface JCWSettingBall : JCWBaseBall <NSCoding>
@property (nonatomic, assign) BOOL isCustomPushOn;          // 推送开关默认是否打开(非系统通知)
@property (assign, nonatomic) BOOL isApplePayAvailable;     // 是否使用ApplePay


+ (instancetype)currentSetting;
+ (void)save:(JCWSettingBall *)settingBall;

@end
NS_ASSUME_NONNULL_END
