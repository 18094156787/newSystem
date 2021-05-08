//
//  JCPageRedirectManager.m
//  Jingcai
//
//  Created by Rain on 2018/11/27.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "JCPageRedirectManager.h"
#import "JCMainTabBarController.h"
#import "JCBaseNavigationController.h"
#import "JCWUserBall.h"
#import "JCChargeVC.h"
#import "UIView+CurrentVC.h"
#import "JCMyHongbaoVC.h"
#import "JCPageRedirectManager.h"
#import "JCYCMyFriendViewController.h"
#import "JCHongbangWMstckyVC.h"
#import "JCYCHongBaoWMVC.h"
#import "JcActivitySquareVC.h"
@interface JCPageRedirectManager ()
@property (nonatomic, strong) JCMainTabBarController * tabBarController;
@end

@implementation JCPageRedirectManager
+ (instancetype)sharedManager {
    static dispatch_once_t onceToken;
    static JCPageRedirectManager *instance;
    dispatch_once(&onceToken, ^{
        instance = [[JCPageRedirectManager alloc] init];
    });
    return instance;
}
+ (void)redirectWithRoute:(NSString *)route vc:(UIViewController *)vc {
    //充值
    if ([route isEqualToString:@"mine_charge"]) {
        [[JCPageRedirectManager sharedManager] redirectToCharge];
        return ;
    }
//    我的红包
    if ([route isEqualToString:@"mine_hongbao"]) {
        [[JCPageRedirectManager sharedManager] redirectToHongbao];
        return ;
    }
    //邀请新人
    if ([route isEqualToString:@"mine_88"]) {
        [[JCPageRedirectManager sharedManager] redirectToInviteFriend];
        return ;
    }
    //全民预测
    if ([route isEqualToString:@"mine_guess"]) {
        [[JCPageRedirectManager sharedManager] redirectToMyGuess];
        return ;
    }
    //活动广场
    if ([route isEqualToString:@"mine_huodong"]) {
        [[JCPageRedirectManager sharedManager] redirectToActivity];
        return ;
    }
    
    
    
//    JCMainTabBarController * tabbar = (JCMainTabBarController *)[UIApplication sharedApplication].delegate.window.rootViewController;
//    if (route.length == 1) {
//        tabbar.tabSelIndex = [route integerValue]-1;
//    }
//    // 我的
//    if (route.length > 1) {
//        NSInteger index = [[route substringToIndex:1] integerValue]-1;
//        if (index > vc.tabBarController.viewControllers.count-1) {
//            return ;
//        }
//        vc.tabBarController.selectedIndex = index;
//        JCBaseNavigationController * nav = vc.tabBarController.viewControllers[index];
//        JCMineVC * mineVC = [nav.viewControllers firstObject];
//
//        NSInteger section = [[route substringFromIndex:1] integerValue];
//        [mineVC pushWithSection:section];
//    }
}
- (void)redirectToLatest {
    self.tabBarController.tabSelIndex = 0;
    //todo向上滑至最新方案
}
- (void)redirectToMatch {
    self.tabBarController.tabSelIndex = 1;
}
- (void)redirectToCal {
    self.tabBarController.tabSelIndex = 3;
}
- (void)redirectToCharge {
    JCBaseViewController * currentVC = (JCBaseViewController *)[self.tabBarController.view getCurrentVC];
    if (![JCWUserBall currentUser]) {
        //JCBaseViewController * currentVC = self.tabBarController.viewControllers[self.tabBarController.selectedIndex];
        [currentVC presentLogin];
        return ;
    }
    [currentVC.navigationController pushViewController:[JCChargeVC new] animated:YES];
}
- (void)redirectToHongbao {
    JCBaseViewController * currentVC = (JCBaseViewController *)[self.tabBarController.view getCurrentVC];
    if (![JCWUserBall currentUser]) {
        //JCBaseViewController * currentVC = self.tabBarController.viewControllers[self.tabBarController.selectedIndex];
        [currentVC presentLogin];
        return ;
    }
    [currentVC.navigationController pushViewController:[JCYCHongBaoWMVC new] animated:YES];
}

- (void)redirectToInviteFriend {
    JCBaseViewController * currentVC = (JCBaseViewController *)[self.tabBarController.view getCurrentVC];
    if (![JCWUserBall currentUser]) {
        [currentVC presentLogin];
        return ;
    }
    [currentVC.navigationController pushViewController:[JCYCMyFriendViewController new] animated:YES];
}

- (void)redirectToMyGuess {
    [self.tabBarController showYCVC];
    
}

- (void)redirectToActivity {
    JCBaseViewController * currentVC = (JCBaseViewController *)[self.tabBarController.view getCurrentVC];
    [currentVC.navigationController pushViewController:[JcActivitySquareVC new] animated:YES];
}

- (JCMainTabBarController *)tabBarController {
    if (!_tabBarController) {
        _tabBarController = (JCMainTabBarController *)[UIApplication sharedApplication].delegate.window.rootViewController;
    }
    return _tabBarController;
}
- (void)redirectToTjUserWithTjUserId:(NSString *)tjUserId {
    JCBaseViewController * currentVC = (JCBaseViewController *)[self.tabBarController.view getCurrentVC];
    //防重复跳转
    if ([currentVC isKindOfClass:[JCHongbangWMstckyVC class]]) {
        JCHongbangWMstckyVC * userVC = (JCHongbangWMstckyVC *)currentVC;
        if ([userVC.autherID isEqualToString:tjUserId]) {
            return ;
        }
    }
    JCHongbangWMstckyVC * tjUserVC = [JCHongbangWMstckyVC new];
    tjUserVC.autherID = tjUserId;
    [currentVC.navigationController pushViewController:tjUserVC animated:YES];
}
@end
