//
//  JCWSettingBall.m
//  Jingcai
//
//  Created by Administrator on 2019/2/1.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCWSettingBall.h"

@implementation JCWSettingBall
+ (instancetype)currentSetting {
    // 本地没有则创建
    JCWSettingBall * settingBall = [JCWSettingBall readSetting];
    if (!settingBall) {
        settingBall = [[JCWSettingBall alloc] init];
        settingBall.isCustomPushOn = YES;
        settingBall.isApplePayAvailable = YES;
        [JCWSettingBall save:settingBall];
    }
    return settingBall;
}
#pragma mark - save & read
+ (instancetype)readSetting {
    NSData * settingData = [[NSUserDefaults standardUserDefaults] objectForKey:@"JCWSettingBall"];
    JCWSettingBall * settingBall = [NSKeyedUnarchiver unarchiveObjectWithData:settingData];
    return settingBall;
}
+ (void)save:(JCWSettingBall *)settingBall {
    NSData * settingData = [NSKeyedArchiver archivedDataWithRootObject:settingBall];
    [[NSUserDefaults standardUserDefaults] setObject:settingData forKey:@"JCWSettingBall"];
    // 还要发送个通知
}

#pragma mark - NSCoding
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        self.isCustomPushOn = [aDecoder decodeBoolForKey:@"isCustomPushOn"];
        self.isApplePayAvailable = [aDecoder decodeBoolForKey:@"isApplePayAvailable"];

    }
    return self;
}
- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeBool:self.isCustomPushOn forKey:@"isCustomPushOn"];
    [aCoder encodeBool:self.isApplePayAvailable forKey:@"isApplePayAvailable"];
}
@end
