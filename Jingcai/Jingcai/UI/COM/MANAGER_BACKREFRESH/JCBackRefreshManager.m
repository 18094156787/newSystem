//
//  JCBackRefreshManager.m
//  Jingcai
//
//  Created by Administrator on 2019/4/18.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCBackRefreshManager.h"

@implementation JCBackRefreshManager
//+ (void)needRefreshSubscribeState {
//    //所有vc
//    UITabBarController * tabbar = (UITabBarController *)[UIApplication sharedApplication].delegate.window.rootViewController;
//    for (UINavigationController * nav in tabbar.viewControllers) {
//        for (UIViewController * vc in nav.viewControllers) {
//            if ([vc respondsToSelector:@selector(refreshSubscribeState)]) {
//                [vc refreshSubscribeState];
//            }
//        }
//    }
//}
+ (void)needRefreshSubscribeStateWithTjUserId:(NSString *)tjUserId gz:(NSString *)gz fensi:(NSInteger)fensi {
    //所有vc
    UITabBarController * tabbar = (UITabBarController *)[UIApplication sharedApplication].delegate.window.rootViewController;
    for (UINavigationController * nav in tabbar.viewControllers) {
        for (UIViewController * vc in nav.viewControllers) {
            if ([vc respondsToSelector:@selector(refreshSubscribeStateWithTjUserId:gz:fensi:)]) {
                [vc refreshSubscribeStateWithTjUserId:tjUserId gz:gz fensi:fensi];
            }
        }
    }
}
@end

//分类
//@implementation UIViewController (JCRefreshState)
////- (void)refreshSubscribeStateWithTjUserId:(NSString *)tjUserId isAdd:(BOOL)isAdd {
////    NSLog(@"需要重载 refreshSubscribeState");
////}
//@end
