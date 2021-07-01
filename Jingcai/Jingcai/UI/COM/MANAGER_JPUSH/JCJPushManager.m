//
//  JCJPushManager.m
//  Jingcai
//
//  Created by Administrator on 2019/2/21.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCJPushManager.h"
#import "JCWUserBall.h"
#import "JPUSHService.h"
#import "SVProgressHUD.h"
#import "JCWSettingBall.h"
@interface JCJPushManager ()
@property (nonatomic, readonly, strong) NSString * aliasName;//别名
@end

@implementation JCJPushManager
+ (instancetype)sharedManager {
    static dispatch_once_t onceToken;
    static JCJPushManager *instance;
    dispatch_once(&onceToken, ^{
        instance = [[JCJPushManager alloc] init];
    });
    return instance;
}
- (void)setAliasShowHUD:(BOOL)show completion:(void (^)(BOOL))completion {
    if (show) {
        [SVProgressHUD show];
    }
    JCWSettingBall * settingBall = [JCWSettingBall currentSetting];
//    if (!settingBall.isCustomPushOn) {
//        completion(YES);
//        //如果开发设置没有打开,就不要设置别名
//        return;
//    }
    if (self.aliasName.length>0) {
        [JPUSHService setAlias:self.aliasName completion:^(NSInteger iResCode, NSString *iAlias, NSInteger seq) {
            if (show) {
                [SVProgressHUD dismiss];
            }
            if (iResCode == 0 && completion) {
                completion(YES);
                return ;
            }
            completion(NO);
        } seq:1];
    }

    

}
- (void)deleteAliasShowHUD:(BOOL)show completion:(void (^)(BOOL))completion {
    if (show) {
        [SVProgressHUD show];
    }
    [JPUSHService deleteAlias:^(NSInteger iResCode, NSString *iAlias, NSInteger seq) {
        if (show) {
            [SVProgressHUD dismiss];
        }
        if (iResCode == 0 && completion) {
            completion(YES);
            return ;
        }
        completion(NO);
    } seq:1];
}

#pragma mark - Getter
- (NSString *)aliasName {
    JCWUserBall * userBall = [JCWUserBall currentUser];
    if (!userBall) {
        return nil;
    }
    return [NSString stringWithFormat:@"jingcai_%@", userBall.id];
}
@end
