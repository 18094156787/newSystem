//
//  JCAlertManager.m
//  Jingcai
//
//  Created by Administrator on 2019/2/14.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCAlertManager.h"

@implementation JCAlertManager
+ (instancetype)sharedManager {
    static dispatch_once_t onceToken;
    static JCAlertManager *instance;
    dispatch_once(&onceToken, ^{
        instance = [[JCAlertManager alloc] init];
    });
    return instance;
}
- (void)showSubscribeAlertWithAdd:(BOOL)add confirmBlock:(void (^)(void))confirmBlock {
    NSString * message = add ? @"是否关注该专家" : @"是否取消关注该专家";
    UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"温馨提示" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        //点击了取消按钮
    }];
    UIAlertAction * submitAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (confirmBlock) {
            confirmBlock();
        }
    }];
    [alertController addAction:cancelAction];
    [alertController addAction:submitAction];
    UIViewController * currentVC = [UIApplication sharedApplication].delegate.window.rootViewController;
    [currentVC presentViewController:alertController animated:YES completion:nil];
}
//}
@end
