//
//  AppDelegate.m
//  Jingcai
//
//  Created by Rain on 2018/10/7.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "AppDelegate.h"
#import "JCMainTabBarController.h"
#import "IQKeyboardManager.h"
#import "JCWConst.h"
#import "WXApiManager.h"
#import "JCWDateTool.h"
#import "SDWebImageCompat.h"
#import "JPUSHService.h"
#import <UserNotifications/UserNotifications.h>
#import <UMCommon/UMCommon.h>
#import <UMShare/UMShare.h>
#import "UIView+CurrentVC.h"
#import "JCPushSettingVC.h"
#import "SVProgressHUD.h"
#import "JCWAppTool.h"
#import "JCWUserBall.h"
#import "JCChargeVC.h"
#import "JCPageRedirectManager.h"
#import <CoreSpotlight/CoreSpotlight.h>
#import <UMCommonLog/UMCommonLogHeaders.h>
#import "JCFootBallAuthorDetailWMViewController.h"
#import "JCArticleDetailVC.h"
#import "JCDakaPlanDetailStickWMVC.h"
#import "JCWMyHongbaoBall.h"
#import "JCHongbangDetailWMstckyVC.h"
#import "JCHongbangBuylWMstckyVC.h"
#import "JCHongbangWMstckyVC.h"
#import "JCFootBallAuthorNewPlaneDetailVC.h"
#import "JCYCHomeWMStickVC.h"
#import "JCMessageCenterVC.h"
#import "JCTuiJianManager.h"
#import "JCMineIncomeWMStickyVC.h"
#import "JCPostPlanMatchTypeSelecView.h"
#import "JCPostPlanVC.h"
#import "IAPManager.h"
#import "JCBaseTitleAlertView.h"
#import "KSGuaidViewManager.h"
#import "OpenInstallSDK.h"
@interface AppDelegate () <JPUSHRegisterDelegate,OpenInstallDelegate>

@property (nonatomic,strong) NSDictionary *launchOptions;

@end

@implementation AppDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    self.launchOptions = launchOptions;
//    [self configUM];
    [self configWXApp];
    [self configProgressHUD];
    [self configJPushWithLaunchOptions:launchOptions];
    [self configIQKeyboard];
    [self clearAppBadge];
    [self netWorkMonitoring];//网络监听
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [JCMainTabBarController new];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    [NSThread sleepForTimeInterval:1.5];
    [self.window makeKeyAndVisible];
    /**启动IAP工具类*/
     [[IAPManager shared] startManager];
    [self appGuide];

    return YES;
}
- (void)applicationWillResignActive:(UIApplication *)application {}
- (void)applicationDidEnterBackground:(UIApplication *)application {}
- (void)applicationWillEnterForeground:(UIApplication *)application {
    [JCWAppTool isUserNotificationEnable:^(BOOL isEnabled) {
        if (isEnabled) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self configUM];
                [self configOpeninstall];
                //刷新UI的代码放到主线程执行
                //极光推送--初始化APNs
                JPUSHRegisterEntity * entity = [[JPUSHRegisterEntity alloc] init];
                entity.types = JPAuthorizationOptionAlert|JPAuthorizationOptionBadge|JPAuthorizationOptionSound;
                [JPUSHService registerForRemoteNotificationConfig:entity delegate:self];
                
                //初始化JPush
                [JPUSHService setupWithOption:self.launchOptions appKey:JPushAppKey
                                      channel:@"App Store"
                             apsForProduction:YES
                        advertisingIdentifier:nil];
            });
        }

    }];

    
    
    
    [JPUSHService setBadge:0];

    //APP进入前台的时候
    UIViewController * vc = [self.window getCurrentVC];
    NSLog(@"当前显示的VC为：%@", NSStringFromClass([vc class]));
    if ([vc isKindOfClass:[JCPushSettingVC class]]) {
        JCPushSettingVC * settingVC = (JCPushSettingVC *)vc;
        [settingVC reloadSetting];
    }
    if ([vc isKindOfClass:[JCChargeVC class]]) {
        JCChargeVC * chargeVC = (JCChargeVC *)vc;
        [chargeVC getChargeList];
    }
    
    //清除角标通知
    [application setApplicationIconBadgeNumber:0];
    UNUserNotificationCenter * center = [UNUserNotificationCenter currentNotificationCenter];
    [center removeAllDeliveredNotifications];
}
- (void)applicationDidBecomeActive:(UIApplication *)application {}
- (void)applicationWillTerminate:(UIApplication *)application {
    [MobClick profileSignOff];
}


//IOS9+
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
    //widget跳转
    if ([url.scheme containsString:@"jingcai://"]) {
        return YES;
    }
    // 微信登录(解决与友盟分享SDK的冲突问题)
    if ([options[UIApplicationOpenURLOptionsSourceApplicationKey] isEqualToString:@"com.tencent.xin"] && [url.absoluteString containsString:WXSendAuthReqStateLogin]) {
        [WXApi handleOpenURL:url delegate:(id)[WXApiManager sharedManager]];
    } else {
        // 友盟分享
        BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url options:options];
        if (!result) {

        }
        return [WXApi handleOpenURL:url delegate:(id)[WXApiManager sharedManager]];
    }
    return YES;
}



- (void)application:(UIApplication *)application
didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    
    /// Required - 注册 DeviceToken
    [JPUSHService registerDeviceToken:deviceToken];
}

#pragma mark- JPUSHRegisterDelegate
// iOS 12 Support
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center openSettingsForNotification:(UNNotification *)notification{
    if (notification && [notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        //从通知界面直接进入应用
        NSDictionary * userInfo = notification.request.content.userInfo;
        [self pushMsgJumpToViewController:userInfo];
    }else{
        //从通知设置界面进入应用
    }
}
// iOS 10 Support
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(NSInteger))completionHandler {
    // Required
    
    NSDictionary * userInfo = notification.request.content.userInfo;
    if([notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        [JPUSHService handleRemoteNotification:userInfo];
       
    }
    NSLog(@"%@",userInfo);
    completionHandler(UNNotificationPresentationOptionAlert); // 需要执行这个方法，选择是否提醒用户，有 Badge、Sound、Alert 三种类型可以选择设置
}
// iOS 10 Support 推送消息的点击
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)())completionHandler {
    // Required
    NSDictionary * userInfo = response.notification.request.content.userInfo;
    if([response.notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        [JPUSHService handleRemoteNotification:userInfo];
        [self pushMsgJumpToViewController:userInfo];
        [JPUSHService setBadge:0];
    }
    NSLog(@"%@",userInfo);
    completionHandler();  // 系统要求执行这个方法
}

- (void)jpushNotificationAuthorization:(JPAuthorizationStatus)status withInfo:(NSDictionary *)info {
    
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    NSLog(@"%@",userInfo);
    // Required, iOS 7 Support
    [JPUSHService handleRemoteNotification:userInfo];
    completionHandler(UIBackgroundFetchResultNewData);
}
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    NSLog(@"%@",userInfo);
    // Required, For systems with less than or equal to iOS 6
    [JPUSHService handleRemoteNotification:userInfo];
}

#pragma mark - 配置相关
- (void)configUM {
    //开发者需要显式的调用此函数，日志系统才能工作
    [UMCommonLogManager setUpUMCommonLogManager];
    [UMConfigure setLogEnabled:NO];
    // 配置友盟AppKey
    [UMConfigure initWithAppkey:UMShareAppKey channel:@"App Store"];
    [UMConfigure setEncryptEnabled:YES];
    [MobClick setScenarioType:E_UM_NORMAL];
    // U-Share 平台设置
    [self configUSharePlatforms];
    [self confitUShareSettings];
}
- (void)configOpeninstall {
    [OpenInstallSDK initWithDelegate:self];
    [[OpenInstallSDK defaultManager] getInstallParmsCompleted:^(OpeninstallData*_Nullable appData) {
        //在主线程中回调
        if (appData.data) {//(动态安装参数)
           //e.g.如免填邀请码建立邀请关系、自动加好友、自动进入某个群组或房间等
        }
        if (appData.channelCode) {//(通过渠道链接或二维码安装会返回渠道编号)
            //e.g.可自己统计渠道相关数据等
        }
//        [JCWToastTool showHint:[NSString stringWithFormat:@"安装OpenInstallSDK:\n动态参数：%@;\n渠道编号：%@",appData.data,appData.channelCode]];
        NSLog(@"OpenInstallSDK:\n动态参数：%@;\n渠道编号：%@",appData.data,appData.channelCode);
    }];
}
- (void)confitUShareSettings
{
    /*
     * 打开图片水印
     */
    //[UMSocialGlobal shareInstance].isUsingWaterMark = YES;
    /*
     * 关闭强制验证https，可允许http图片分享，但需要在info.plist设置安全域名
     <key>NSAppTransportSecurity</key>
     <dict>
     <key>NSAllowsArbitraryLoads</key>
     <true/>
     </dict>
     */
    [UMSocialGlobal shareInstance].isUsingHttpsWhenShareContent = NO;
}
- (void)configUSharePlatforms
{
    /* 设置微信的appKey和appSecret */
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_WechatSession appKey:WXAppID appSecret:WXAppSecret redirectURL:@"http://mobile.umeng.com/social"];
}
- (void)configWXApp {
    //注册微信的APPID
//    [WXApi registerApp:WXAppID];
     [WXApi registerApp:WXAppID universalLink:@"https://m.jingcai.com"];
    NSLog(@"111");
}
- (void)configProgressHUD {
    //更改HUD样式
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
}
- (void)configJPushWithLaunchOptions:(NSDictionary *)launchOptions {
    
    //确保权限只询问一次
    if (![[NSUserDefaults standardUserDefaults] objectForKey:@"JpushResult"]) {
        //先访问用户的推送权限,当用户允许推送时,再初始化极光推送
        UNUserNotificationCenter * center = [UNUserNotificationCenter currentNotificationCenter];
    //    center.delegate = self;
        [center requestAuthorizationWithOptions:UNAuthorizationOptionAlert | UNAuthorizationOptionBadge | UNAuthorizationOptionSound completionHandler:^(BOOL granted, NSError * _Nullable error) {
            
            if (granted) {
                [[NSUserDefaults standardUserDefaults] setObject:@"1" forKey:@"JpushResult"];//同意推送
                if ([[NSUserDefaults standardUserDefaults] objectForKey:@"firstApp"]) {
                    [self agreeConfigWithLaunchOptions];
                }
                
            }else{
                //不允许
                dispatch_async(dispatch_get_main_queue(), ^{
                    //刷新UI的代码放到主线程执行
                    [JCWToastTool showHint:@"您未开启通知权限，将无法即时收到方案等内容的更新提醒"];
                });
                
            }

        }];
    }else {
        //当用户在app设置里打开同意推送的按钮后,重新注册极光推送
            [JCWAppTool isUserNotificationEnable:^(BOOL isEnabled) {
                if (isEnabled) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [[NSUserDefaults standardUserDefaults] setObject:@"1" forKey:@"JpushResult"];
                        [self configUM];
                        [self configOpeninstall];
                        //刷新UI的代码放到主线程执行
                        //极光推送--初始化APNs
                        JPUSHRegisterEntity * entity = [[JPUSHRegisterEntity alloc] init];
                        entity.types = JPAuthorizationOptionAlert|JPAuthorizationOptionBadge|JPAuthorizationOptionSound;
                        [JPUSHService registerForRemoteNotificationConfig:entity delegate:self];
                        
                        //初始化JPush
                        [JPUSHService setupWithOption:launchOptions appKey:JPushAppKey
                                              channel:@"App Store"
                                     apsForProduction:YES
                                advertisingIdentifier:nil];
                    });
                }else {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        NSString *day = [[NSUserDefaults standardUserDefaults] objectForKey:@"JpushUnalbe"];
                        //判断是否是同一天
                        BOOL isSame = [NSDate isToday:day];
                        if (day&&isSame) {
                            return;
                        }

                        
                        JCBaseTitleAlertView *alertView = [JCBaseTitleAlertView new];
                        [alertView alertTitle:@"" TitleColor:COLOR_2F2F2F Mesasge:@"您未开启通知权限，将无法即时收到方案等内容的更新提醒，是否开启？" MessageColor:COLOR_666666 SureTitle:@"确认" SureColor:JCWhiteColor SureHandler:^{
                            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString] options:@{} completionHandler:nil];
                            [alertView removeFromSuperview];
                        } CancleTitle:@"取消" CancleColor:JCBaseColor CancelHandler:^{
                           [alertView removeFromSuperview];
                        }];
                        alertView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
                        [[UIApplication sharedApplication].keyWindow addSubview:alertView];
                        [[NSUserDefaults standardUserDefaults] setValue:[NSDate currentDay] forKey:@"JpushUnalbe"];
                    });
                    
                    
                    

                }

        
        
            }];
        
        

    }
    

    

}

- (void)agreeConfigWithLaunchOptions {
    dispatch_async(dispatch_get_main_queue(), ^{
        
        [self configUM];
        [self configOpeninstall];
        //刷新UI的代码放到主线程执行
        //极光推送--初始化APNs
        JPUSHRegisterEntity * entity = [[JPUSHRegisterEntity alloc] init];
        entity.types = JPAuthorizationOptionAlert|JPAuthorizationOptionBadge|JPAuthorizationOptionSound;
        [JPUSHService registerForRemoteNotificationConfig:entity delegate:self];
        //初始化JPush
        [JPUSHService setupWithOption:self.launchOptions appKey:JPushAppKey
                              channel:@"App Store"
                     apsForProduction:YES
                advertisingIdentifier:nil];
    });

}

- (void)appGuide {
    KSGuaidManager.images = @[[UIImage imageNamed:@"guide_1"],
                              [UIImage imageNamed:@"guide_2"],
                              [UIImage imageNamed:@"guide_3"],
                              [UIImage imageNamed:@"guide_4"]];
    
    
//     方式一:
     
     CGSize size = [UIScreen mainScreen].bounds.size;
     
     KSGuaidManager.dismissButtonImage = [UIImage imageNamed:@"rightNow"];
     
     KSGuaidManager.dismissButtonCenter = CGPointMake(size.width / 2, size.height - 160);
     
    
    //方式二:
//    KSGuaidManager.shouldDismissWhenDragging = YES;
        
    [KSGuaidManager begin];
}
- (void)configIQKeyboard {
    //键盘防遮挡
    [IQKeyboardManager sharedManager].enable = YES;
}

- (void)clearAppBadge {
    //清除角标通知
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
    UNUserNotificationCenter * center = [UNUserNotificationCenter currentNotificationCenter];
    [center removeAllDeliveredNotifications];
}

- (void)netWorkMonitoring {
    
        [[AFNetworkReachabilityManager sharedManager] startMonitoring];
//        [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
//            switch (status) {
//                case AFNetworkReachabilityStatusNotReachable:
//                {
//                    [JCWToastTool showHint:@"网络不可用"];
//                }
//                    break;
//                case AFNetworkReachabilityStatusReachableViaWWAN:
//                {
//                    [JCWToastTool showHint:@"数据"];
//                }
//                    break;
//                case AFNetworkReachabilityStatusReachableViaWiFi:
//                {
//                    [JCWToastTool showHint:@"wifi"];
//                }
//                    break;
//
//                default:
//                    break;
//            }
//        }];

}


- (void)pushMsgJumpToViewController:(NSDictionary *)data {

    if (data[@"aps"][@"alert"]) {
        NSDictionary *dic = data[@"aps"][@"alert"];
//        type 0 首页 1红榜 2大咖 11 红榜方案 21 大咖方案  3是文章详情 4 全民首页 5 消息列表 8大咖方案详情 7.发帖
        NSString*type = [NSString stringWithFormat:@"%@",dic[@"content_type"]];
        //专家id
        NSString *userID = dic[@"user_id"];
        //文章id
        NSString *articleID = dic[@"wz_id"];
        
        
        //极光推送,后台需要数据统计
//        [self pushMessageClickWithType:NonNil(type) WZ_id:NonNil(articleID)];
//
        JCMainTabBarController *tabBarController = (JCMainTabBarController *)[UIApplication sharedApplication].delegate.window.rootViewController;
        UINavigationController *nav = tabBarController.viewControllers.firstObject;
        JCBaseViewController * currentVC = (JCBaseViewController *)[tabBarController.view getCurrentVC];
        
        if ([type integerValue]==3) {
            JCArticleDetailVC *vc = [JCArticleDetailVC new];

            vc.articalId = articleID;
//            [currentVC.navigationController pushViewController:vc animated:YES];
            [nav pushViewController:vc animated:YES];
            return;
        }
        if ([type integerValue]==4) {
            JCYCHomeWMStickVC *vc = [JCYCHomeWMStickVC new];
//            [currentVC.navigationController pushViewController:vc animated:YES];
            [nav pushViewController:vc animated:YES];
            return;
        }
        if ([type integerValue]==5) {
            [[NSNotificationCenter defaultCenter] postNotificationName:NotificationApplyExpertSuccess object:nil];
            JCMessageCenterVC *vc = [JCMessageCenterVC new];
//            [currentVC.navigationController pushViewController:vc animated:YES];
            [nav pushViewController:vc animated:YES];
            return;
        }
        

        if (![JCWUserBall currentUser]) {
            [currentVC presentLogin];
            return ;
        }

        
        if ([type integerValue]==1) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //红榜用户列表
                JCHongbangWMstckyVC *vc = [JCHongbangWMstckyVC new];
                vc.autherID = userID;
//                if (userID.length==0) {
//                    vc.autherID = articleID;
//                }
                
//                [currentVC.navigationController pushViewController:vc animated:YES];
                [nav pushViewController:vc animated:YES];
            });

        }
        if ([type integerValue]==2) {
            //大咖用户列表
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                JCFootBallAuthorDetailWMViewController *vc = [JCFootBallAuthorDetailWMViewController new];
                vc.autherID = userID;
//                [currentVC.navigationController pushViewController:vc animated:YES];
                [nav pushViewController:vc animated:YES];
            });

        }
        if ([type integerValue]==6) {
            //提现页面
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                JCMineIncomeWMStickyVC *vc = [JCMineIncomeWMStickyVC new];
//                [currentVC.navigationController pushViewController:vc animated:YES];
                [nav pushViewController:vc animated:YES];
            });

        }
        if ([type integerValue]==7) {
            //发帖页面
            JCUserService_New *service = [JCUserService_New service];
            [service getMyUserInfoWithSuccess:^(id  _Nullable object) {
                if ([JCWJsonTool isSuccessResponse:object]) {
                    JCWUserBall * userBall = [JCWUserBall yy_modelWithJSON:object[@"data"]];
                    [JCWUserBall save:userBall];
                    if ([userBall.fabu intValue]==1) {
                        JCPostPlanMatchTypeSelecView *view = [JCPostPlanMatchTypeSelecView new];
                        view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
                        view.JCPushVCBlick = ^(NSString * _Nonnull type) {
                            JCPostPlanVC *vc = [JCPostPlanVC new];
                            vc.type = type;
                            [nav pushViewController:vc animated:YES];
                        };
                        [[UIApplication sharedApplication].keyWindow addSubview:view];
                         return;
                    }
                    
                }
            } failure:^(NSError * _Nonnull error) {
                
            }];
                

        }
        if ([type integerValue]==11) {
            //红榜详情
            [self getPayActionWithTjID:articleID];
        }
        if ([type integerValue]==21||[type integerValue]==8) {
            //公众号详情
            [self getPayActionWithGZH_ID:articleID];
        }
        
    }

}



- (void)getPayActionWithTjID:(NSString *)tjInfoId {
     JCMainTabBarController *tabBarController = (JCMainTabBarController *)[UIApplication sharedApplication].delegate.window.rootViewController;
      JCBaseViewController * currentVC = (JCBaseViewController *)[tabBarController.view getCurrentVC];
    [JCTuiJianManager getTuiJianDetailWithTuiJianID:tjInfoId orderID:@"" type:@"" WithViewController:currentVC is_push:YES success:^{
        
    }];
  
}

- (void)getPayActionWithGZH_ID:(NSString *)tjInfoId {
     JCMainTabBarController *tabBarController = (JCMainTabBarController *)[UIApplication sharedApplication].delegate.window.rootViewController;
      JCBaseViewController * currentVC = (JCBaseViewController *)[tabBarController.view getCurrentVC];
    [JCTuiJianManager loadGZH_ArticleDetailWithArticleID:tjInfoId orderID:@"" type:@"" WithViewController:currentVC is_push:YES];

}


- (void)pushMessageClickWithType:(NSString *)type WZ_id:(NSString *)wz_id {
//    InfoService *service = [InfoService service];
//    NSDictionary * param = @{@"type":type,@"wz_id":wz_id};
//    if([JCWUserBall currentUser]){
//        param = @{@"type":type,@"wz_id":wz_id,@"user_id":[JCWUserBall currentUser].user_id};
//    }
//    [service pushMessageClickWithParam:param Success:^(id  _Nullable object) {
//         if ([JCWJsonTool isSuccessResponse:object]) {
//
//         }
//    } failure:^(NSError * _Nonnull error) {
//
//    }];

   

}

- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window {
    return UIInterfaceOrientationMaskAll;
}

@end

@implementation UIViewController (RotationControl)
- (BOOL)shouldAutorotate {
    return NO;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

@end


@implementation UITabBarController (RotationControl)
- (UIViewController *)sj_topViewController {
    if ( self.selectedIndex == NSNotFound )
        return self.viewControllers.firstObject;
    return self.selectedViewController;
}

- (BOOL)shouldAutorotate {
    return [[self sj_topViewController] shouldAutorotate];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return [[self sj_topViewController] supportedInterfaceOrientations];
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return [[self sj_topViewController] preferredInterfaceOrientationForPresentation];
}
@end

@implementation UINavigationController (RotationControl)
- (BOOL)shouldAutorotate {
    return self.topViewController.shouldAutorotate;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return self.topViewController.supportedInterfaceOrientations;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return self.topViewController.preferredInterfaceOrientationForPresentation;
}

- (nullable UIViewController *)childViewControllerForStatusBarStyle {
    return self.topViewController;
}

- (nullable UIViewController *)childViewControllerForStatusBarHidden {
    return self.topViewController;
}

- (BOOL)application:(UIApplication *)application continueUserActivity:(NSUserActivity *)userActivity restorationHandler:(void (^)(NSArray * _Nullable))restorationHandler{
    //处理通过openinstall一键唤起App时传递的数据
    [OpenInstallSDK continueUserActivity:userActivity];
    //其他第三方回调；
     return YES;
}
@end
