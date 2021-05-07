//
//  JCPopViewManager.m
//  Jingcai
//
//  Created by Administrator on 2019/4/11.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCPopViewManager.h"
#import "JCUpdateView.h"
#import "JCWJsonTool.h"
#import "JCWToastTool.h"
#import "JCWConst.h"

@implementation JCPopViewManager
+ (instancetype)shareManager {
    static dispatch_once_t onceToken;
    static JCPopViewManager * instance;
    dispatch_once(&onceToken, ^{
        instance = [[JCPopViewManager alloc] init];
    });
    return instance;
}
- (void)autoCheckUpdate {
    [self checkUpdateShowHUD:NO showHint:NO];
}
- (void)manualCheckUpdate {
    [self checkUpdateShowHUD:YES showHint:YES];
}
- (void)checkUpdateShowHUD:(BOOL)showHUD showHint:(BOOL)showHint {
    if (showHUD) {
        [SVProgressHUD show];
    }//[JCWInterfaceTool appVersion]
    JCUserService_New *service = [JCUserService_New service];
    [service getAppUpdateWithsuccess:^(id  _Nullable object) {
        [SVProgressHUD dismiss];
        if ([JCWJsonTool isSuccessResponse:object]) {
            JCUpdateView * updateView = [JCUpdateView viewFromXib];
            JCUpdateBall * updateBall = (JCUpdateBall *)[JCWJsonTool entityWithJson:object[@"data"][@"ios"] class:[JCUpdateBall class]];
            if ([updateBall.api_new floatValue] <= [[JCWInterfaceTool appVersion] floatValue]) {
                if (showHint) {
                    [JCWToastTool showHint:@"当前已是最新版本"];
                }
                return ;
            }
            updateView.updateBall = updateBall;
            [updateView show];
            updateView.updateClickBlock = ^(NSString * _Nullable link) {
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:link] options:@{} completionHandler:nil];
//                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://apps.apple.com/cn/app/%E6%99%BA%E8%83%9C%E8%B6%B3%E7%90%83/id1479135907"] options:@{} completionHandler:nil];
            };
            return ;
        }
        if (showHint) {
            [JCWToastTool showHint:object[@"data"][@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        [SVProgressHUD dismiss];
        if (showHint) {
            [JCWToastTool showHint:@"检查更新失败"];
        }
    }];

}
@end
