//
//  UIView+CurrentVC.m
//  CoinWay
//
//  Created by Rain on 2018/8/28.
//  Copyright © 2018年 rain. All rights reserved.
//

#import "UIView+CurrentVC.h"

@implementation UIView (CurrentVC)

//获取当前屏幕显示的viewcontroller
- (UIViewController *)getCurrentVC {
    UIViewController * rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    UIViewController * currentVC = [self getCurrentVCFrom:rootViewController];
    return currentVC;
}
- (UIViewController *)getParentVC {
    UIResponder * nextResponder = self;
    do {
        nextResponder = [nextResponder nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]])
            return (UIViewController *)nextResponder;
    } while (nextResponder != nil);
    
    return nil;
}
- (UIViewController *)getCurrentVCFrom:(UIViewController *)rootVC {
    UIViewController * currentVC;
    if ([rootVC presentedViewController]) {
        // 视图是被presented出来的
        rootVC = [rootVC presentedViewController];
    }
    if ([rootVC isKindOfClass:[UITabBarController class]]) {
        // 根视图为UITabBarController
        currentVC = [self getCurrentVCFrom:[(UITabBarController *)rootVC selectedViewController]];
    } else if ([rootVC isKindOfClass:[UINavigationController class]]) {
        // 根视图为UINavigationController
        currentVC = [self getCurrentVCFrom:[(UINavigationController *)rootVC visibleViewController]];
    } else {
        // 根视图为非导航类
        currentVC = rootVC;
    }
    return currentVC;
}

@end
