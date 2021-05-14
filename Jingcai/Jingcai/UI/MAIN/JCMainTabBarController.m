//
//  JCMainTabBarController.m
//  Jingcai
//
//  Created by Rain on 2018/10/8.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "JCMainTabBarController.h"
#import "JCPopViewManager.h"
#import "JCWInterfaceTool.h"
#import "JCWConvertTool.h"
#import "JCWJsonTool.h"
#import "JCWCacheTool.h"
#import "JCWUserBall.h"
#import "JCWConst.h"
#import "JNTabBar.h"
#import "JCLogTool.h"
#import "JCBaseNavigationController.h"
#import "JCDebugButton.h"
#import "JCTestVC.h"
#import "JCWToastTool.h"
#import "JCMineViewController.h"

#import "JCHomeSearchVC.h"
#import "JCYCHomeWMStickVC.h"
#import "JCMatchHomeWMVC.h"
#import "JCDatabaseViewController.h"
#import "JCHomeWMStickyVC.h"
#import "JCMineWMStickViewController.h"
#import "JCCommunityWMStickHomeVC.h"
#import "JCAAVC.h"
#import "JCBigDataWMVC.h"
#import "JCMathEnterGaolTipView.h"
#import "JCMatchTipSettingVC.h"
#import "CountDown.h"
#import "JCTipMatchInfoModel.h"
#import "SoundControlSingle.h"
#import "JCYCHomeWMStickVC.h"
#import "JCMessageCenterVC.h"
#import "JCMyBuyPlanWMViewController.h"
#import "JCBigDataWMVC.h"
#import "JCMatchAllWMVC.h"
#import "JCYCHongBaoWMVC.h"
#import "WebSocketManager.h"
#import "JCMatchInfoModel.h"
#import "JCAgreeProtocolView.h"
@interface JCMainTabBarController ()<WebSocketManagerDelegate>
@property (strong, nonatomic) UINavigationController * expertNav;
@property (strong, nonatomic) UINavigationController * matchNav;
@property (strong, nonatomic) UINavigationController * commentNav;
@property (strong, nonatomic) UINavigationController * mineNav;
@property (strong, nonatomic) UINavigationController * communityNav;

@property (strong, nonatomic) NSArray * showVCArray;

@property (strong, nonatomic) JCDebugButton * debugButton;
@property (strong, nonatomic) UIView * splashBackView;
@property (strong, nonatomic) UIImageView * splashImageView;

@property (nonatomic,strong) JCMathEnterGaolTipView *goalTipView;

@property (strong, nonatomic)  CountDown *countDown;

@property (nonatomic,assign) NSInteger is_gz;

@property (nonatomic,assign) NSInteger is_voice;

@property (nonatomic,assign) NSInteger is_shock;

@property (nonatomic,strong) NSArray *concernArray;//关注比赛数组

//@property (assign, nonatomic) BOOL statusBarHidden;
@end

@implementation JCMainTabBarController
- (void)viewDidLoad {
    [super viewDidLoad];
    //[self debugShowStatusBarHeight];
    //[self debugShowNavHeight];
//    [self debugModing];
    [self getAppInfo];//getKefuWX
    [self addNotification];
    [self initControllers];
    [self initTabBar];
    [self getMyUserInfo];
    [self initProtocolView];
    
    //清除列表缓存
    [JCWCacheTool clearCacheIfNeed];
    //检查更新
    [[JCPopViewManager shareManager] autoCheckUpdate];//版本更新
//    [self initEnterBallTipView];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self initEnterBallTipView];//延迟执行,太快获取不到keywindow
    });
    [WebSocketManager shared].delegate = self;
    [self startConnect];

    
    NSLog(@"构建版本号：%@",[JCWInterfaceTool appBuildVersion]);

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getMyUserInfo) name:NotificationApplyExpertSuccess object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getConcernMatchList) name:JCMatchConcern object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(startConnect) name:NotificationUserLogin object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(closeConnect) name:NotificationUserLogout object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getMatchTipSetting) name:JCMatchEntetBallTip object:nil];
    

}

- (void)getMyUserInfo {
    JCWUserBall * user = [JCWUserBall currentUser];
    if (!user) {
        return ;
    }
    JCUserService_New *service = [JCUserService_New service];
    [service getMyUserInfoWithSuccess:^(id  _Nullable object) {
        if ([JCWJsonTool isSuccessResponse:object]) {
            NSString *token = [JCWUserBall currentUser].token;
            NSLog(@"token=%@",token);
            //缓存userBall对象
            JCWUserBall *userBall = (JCWUserBall *)[JCWJsonTool entityWithJson:object[@"data"] class:[JCWUserBall class]];
            userBall.token = token;
            [JCWUserBall save:userBall];
           JNTabBar *tabBar = (JNTabBar *)self.tabBar;
           [tabBar setMineBadge];

            NSLog(@"user_id == %@",[JCWUserBall currentUser].user_id);
            NSLog(@"user_token == %@",[JCWUserBall currentUser].token);
            return ;
        }
        [JCWToastTool showHint:object[@"msg"]];
    } failure:^(NSError * _Nonnull error) {

    }];

}

- (void)initProtocolView {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (![[NSUserDefaults standardUserDefaults] objectForKey:@"firstApp"]) {
            JCAgreeProtocolView *alertView = [JCAgreeProtocolView new];
            alertView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
            [[UIApplication sharedApplication].keyWindow addSubview:alertView];
            [[NSUserDefaults standardUserDefaults] setObject:@"1" forKey:@"firstApp"];
        }

    });

}


//进球提示
- (void)initEnterBallTipView {
    self.countDown = [[CountDown alloc] init];
    self.goalTipView.frame = CGRectMake(0, SCREEN_HEIGHT-kTabBarHeight-AUTO(90), SCREEN_WIDTH, AUTO(65));
//    self.goalTipView.frame = CGRectMake(0, AUTO(30), SCREEN_WIDTH, AUTO(65));
//    self.goalTipView.hidden = NO;
//    [[UIApplication sharedApplication].keyWindow addSubview:self.goalTipView];
    WeakSelf;
    self.goalTipView.JCGoalBall = ^{
        JCMatchTipSettingVC *vc = [JCMatchTipSettingVC new];
        UINavigationController *nav = (UINavigationController *)weakSelf.selectedViewController;
        [nav pushViewController:vc animated:YES];
    };
}

-(void)startConnect{
    if (![JCWUserBall currentUser]) {
        return;
    }
    [self getConcernMatchList];
    [self getMatchTipSetting];
    [[WebSocketManager shared] connectServer];
}

-(void)closeConnect{
    [[WebSocketManager shared] webSocketClose];
}

#pragma mark -进球提醒相关
- (void)getMatchTipSetting {
//    [self.view showLoading];
    JCMatchService_New *service = [JCMatchService_New new];
    [service getMatchEnterBallTipsWithOP:@"0" Value:@"" Success:^(id  _Nullable object) {
      if ([JCWJsonTool isSuccessResponse:object]) {
          NSString *is_gz = [NSString stringWithFormat:@"%@",object[@"data"][@"is_gz"]];
          NSString *is_voice = [NSString stringWithFormat:@"%@",object[@"data"][@"is_voice"]];
          NSString *is_shock = [NSString stringWithFormat:@"%@",object[@"data"][@"is_shock"]];
          if (is_gz.length>0) {
              [[NSUserDefaults standardUserDefaults] setValue:is_gz forKey:@"is_gz"];
          }
          if (is_voice.length>0) {
              [[NSUserDefaults standardUserDefaults] setValue:is_voice forKey:@"is_voice"];
          }
          if (is_shock.length>0) {
              [[NSUserDefaults standardUserDefaults] setValue:is_shock forKey:@"is_shock"];
          }
          self.is_gz = [is_gz integerValue];
          self.is_voice = [is_voice integerValue];
          self.is_shock = [is_shock integerValue];
//          [self.tableView reloadData];
      }
//      else{
//          [JCWToastTool showHint:object[@"msg"]];
//      }

    } failure:^(NSError * _Nonnull error) {
//        [self endRefresh];
    }];

}
//获取关注的比赛列表
- (void)getConcernMatchList {
//    [self.view showLoading];
    JCMatchService_New *service = [JCMatchService_New new];
    [service getMyConcernMatchNotEndWithSuccess:^(id  _Nullable object) {
        if ([JCWJsonTool isSuccessResponse:object]) {
            self.concernArray = [JCWJsonTool arrayWithJson:object[@"data"][@"list"] class:[JCMatchInfoModel class]];
        }
    } failure:^(NSError * _Nonnull error) {
        
    }];

}


#pragma mark -websocket Delegate
- (void)webSocketDidReceiveMessage:(id)data {
    NSData *jsonData = [data dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    
    NSArray *matchArray = [JCWJsonTool arrayWithJson:dic[@"list"] class:[JCTipMatchInfoModel class]];
    NSMutableArray *dataArray = [NSMutableArray array];
    if (self.is_gz==1) {
        //仅提醒我关注的比赛
        for (JCTipMatchInfoModel *tipModel in matchArray) {
            for (JCMatchInfoModel *matchModel in self.concernArray) {
                if ([tipModel.match_id isEqualToString:matchModel.match_id]) {
                    [dataArray addObject:tipModel];
                    break;
                }
            }
        }
    }else {
        //提醒全部比赛
        dataArray = [NSMutableArray arrayWithArray:matchArray];
    }
    if (dataArray.count>0&&self.goalTipView.hidden) {
        
        JCTipMatchInfoModel *model= matchArray.firstObject;
        self.goalTipView.model = model;
        self.goalTipView.hidden = NO;
        [[UIApplication sharedApplication].keyWindow addSubview:self.goalTipView];
        [[NSNotificationCenter defaultCenter] postNotificationName:jcMatchEntetBallRefresh object:nil];
        if (self.is_voice==1) {
            SoundControlSingle * voiceSingle = [SoundControlSingle sharedInstanceForSound];//获取声音对象
            [voiceSingle play];
        }
        if (self.is_shock==1) {
            SoundControlSingle * shakeSingle = [SoundControlSingle sharedInstanceForVibrate];;//获取声音对象
            [shakeSingle play];
        }


        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.goalTipView.hidden = YES;
        });
    }
    NSLog(@"接收到的数据%@",dic);
    
}

#pragma mark -
- (void)initControllers {
    self.viewControllers = @[[self.showVCArray firstObject]];
}
- (void)initTabBar {
    JNTabBar * tabbar = [JNTabBar new];
    tabbar.selectedIndex = 0;
    WeakSelf;
    tabbar.btnClickBlock = ^(NSInteger index) {
        if (index < self.showVCArray.count) {
            weakSelf.viewControllers = @[self.showVCArray[index]];

        }
    };
  [self setValue:tabbar forKeyPath:@"tabBar"];
//    [self viewDidLayoutSubviews];
}
- (void)showYCVC {
    JNTabBar *tabBar = (JNTabBar *)self.tabBar;
    tabBar.selectedIndex = 2;
    UINavigationController *nav = self.viewControllers.firstObject;
    for (UIViewController *vc  in nav.viewControllers) {
        if ([vc isKindOfClass:[JCCommunityWMStickHomeVC class]]) {
            [nav popToViewController:vc animated:YES];
            JCCommunityWMStickHomeVC *communityVC = (JCCommunityWMStickHomeVC *)vc;
            if (communityVC.titleArray.count>2) {
                communityVC.selectIndex = 2;
            }else {
                communityVC.selectIndex = 0;
            }
           
            
        }
    }
}


- (void)showGZHVC {
    JNTabBar *tabBar = (JNTabBar *)self.tabBar;
    tabBar.selectedIndex = 2;
    UINavigationController *nav = self.viewControllers.firstObject;
    for (UIViewController *vc  in nav.viewControllers) {
        if ([vc isKindOfClass:[JCCommunityWMStickHomeVC class]]) {
            [nav popToViewController:vc animated:YES];
            JCCommunityWMStickHomeVC *communityVC = (JCCommunityWMStickHomeVC *)vc;
            communityVC.selectIndex = 0;
        }
    }

}

- (void)showHBVC {
    JNTabBar *tabBar = (JNTabBar *)self.tabBar;
    tabBar.selectedIndex = 2;
    UINavigationController *nav = self.viewControllers.firstObject;
    for (UIViewController *vc  in nav.viewControllers) {
        if ([vc isKindOfClass:[JCCommunityWMStickHomeVC class]]) {
            [nav popToViewController:vc animated:YES];
            JCCommunityWMStickHomeVC *communityVC = (JCCommunityWMStickHomeVC *)vc;
            communityVC.selectIndex = 1;
        }
    }
    
}

- (void)showBigDataVC {
    JNTabBar *tabBar = (JNTabBar *)self.tabBar;
    tabBar.selectedIndex = 3;
    UINavigationController *nav = self.viewControllers.firstObject;
    for (UIViewController *vc  in nav.viewControllers) {
        if ([vc isKindOfClass:[JCBigDataWMVC class]]) {
            [nav popToViewController:vc animated:YES];
            JCBigDataWMVC *communityVC = (JCBigDataWMVC *)vc;
            communityVC.selectIndex = 0;

        }
    }

}


- (void)showMessageVC {
    JNTabBar *tabBar = (JNTabBar *)self.tabBar;
    tabBar.selectedIndex = 4;
    UINavigationController *nav = self.viewControllers.firstObject;
//    nav.navigationBar.hidden = NO;
    [nav pushViewController:[JCMessageCenterVC new] animated:YES];
//    for (UIViewController *vc  in nav.viewControllers) {
//        if ([vc isKindOfClass:[JCCommunityWMStickHomeVC class]]) {
//            [nav popToViewController:vc animated:YES];
//            JCCommunityWMStickHomeVC *communityVC = (JCCommunityWMStickHomeVC *)vc;
//            communityVC.selectIndex = 1;
//        }
//    }
    
}

- (void)showMyRedPacketListVC {
    JNTabBar *tabBar = (JNTabBar *)self.tabBar;
    tabBar.selectedIndex = 4;
    UINavigationController *nav = self.viewControllers.firstObject;
    [nav pushViewController:[JCYCHongBaoWMVC new] animated:YES];
//    for (UIViewController *vc  in nav.viewControllers) {
//        if ([vc isKindOfClass:[JCBigDataWMVC class]]) {
//            [nav popToViewController:vc animated:YES];
//            JCBigDataWMVC *communityVC = (JCBigDataWMVC *)vc;
//            communityVC.selectIndex = 0;
//
//        }
//    }
    
}

#pragma mark - Getter
- (UINavigationController *)expertNav {
    if (!_expertNav) {
        CGSize size = CGSizeMake(18.f, 18.f);
        UIImage * expertIcon = [JCWConvertTool scaleImage:[UIImage imageNamed:@"tab_expert"] toSize:size];
        _expertNav = [[JCBaseNavigationController alloc] initWithRootViewController:[JCHomeWMStickyVC new]];
        _expertNav.tabBarItem.image = expertIcon;//JCHomeWMStickyVC
        _expertNav.tabBarItem.selectedImage = expertIcon;
        _expertNav.tabBarItem.title = @"首页";
    }
    return _expertNav;
}
- (UINavigationController *)matchNav {
    if (!_matchNav) {
        CGSize size = CGSizeMake(18.f, 18.f);
        UIImage * raceIcon = [JCWConvertTool scaleImage:[UIImage imageNamed:@"tab_race"] toSize:size];//JCMatchHomeWMVC
        _matchNav = [[JCBaseNavigationController alloc] initWithRootViewController:[JCMatchAllWMVC new]];//JCMatchAllWMVC
        _matchNav.tabBarItem.image = raceIcon;//JCMatchHomeWMVC
        _matchNav.tabBarItem.selectedImage = raceIcon;
        _matchNav.tabBarItem.title = @"赛程";
    }
    return _matchNav;
}

- (UINavigationController *)commentNav {
    if (!_commentNav) {
        CGSize size = CGSizeMake(18.f, 18.f);
        UIImage * showIcon = [JCWConvertTool scaleImage:[UIImage imageNamed:@"tab_zixun"] toSize:size];
        _commentNav = [[JCBaseNavigationController alloc] initWithRootViewController:[JCBigDataWMVC new]];        _commentNav.tabBarItem.image = showIcon;//JCYCHomeWMStickVC
        _commentNav.tabBarItem.selectedImage = showIcon;//
        _commentNav.tabBarItem.title = @"方案";
    }
    return _commentNav;
}
- (UINavigationController *)mineNav {
    if (!_mineNav) {
        CGSize size = CGSizeMake(18.f, 18.f);
        UIImage * mineIcon = [JCWConvertTool scaleImage:[UIImage imageNamed:@"tab_mine"] toSize:size];
        _mineNav = [[JCBaseNavigationController alloc] initWithRootViewController:[JCMineWMStickViewController new]];
        _mineNav.tabBarItem.image = mineIcon;//JCMineTableViewController
        _mineNav.tabBarItem.selectedImage = mineIcon;//JCMineViewController
        _mineNav.tabBarItem.title = @"我的";
    }
    return _mineNav;
}

- (UINavigationController *)communityNav {
    if (!_communityNav) {
        CGSize size = CGSizeMake(18.f, 18.f);
        UIImage * mineIcon = [JCWConvertTool scaleImage:[UIImage imageNamed:@"tab_mine"] toSize:size];
        _communityNav = [[JCBaseNavigationController alloc] initWithRootViewController:[JCCommunityWMStickHomeVC new]];//
        _communityNav.tabBarItem.image = mineIcon;//JCYCHomeWMStickVC
        _communityNav.tabBarItem.selectedImage = mineIcon;
        _communityNav.tabBarItem.title = @"预测";
    }
    return _communityNav;
}

- (NSArray *)showVCArray {
    if (!_showVCArray) {
        _showVCArray = @[self.expertNav,
                         self.matchNav,
                         self.communityNav,
                         self.commentNav,
                         self.mineNav];
    }
    return _showVCArray;
}
- (void)setTabSelIndex:(NSInteger)tabSelIndex {
    if (tabSelIndex < self.showVCArray.count) {
        JNTabBar * tabbar = (JNTabBar *)self.tabBar;
        tabbar.selectedIndex = tabSelIndex;
        self.viewControllers = @[self.showVCArray[tabSelIndex]];
    }
}
- (UIImageView *)splashImageView {
    if (!_splashImageView) {
        _splashImageView = [[UIImageView alloc] init];
        _splashImageView.userInteractionEnabled = YES;
        _splashImageView.backgroundColor = [UIColor whiteColor];
        _splashImageView.contentMode = UIViewContentModeScaleToFill;
    }
    return _splashImageView;
}
- (UIView *)splashBackView {
    if (!_splashBackView) {
        _splashBackView = [[UIView alloc] init];
        _splashBackView.backgroundColor = [UIColor whiteColor];
    }
    return _splashBackView;
}

#pragma mark - Notification
- (void)addNotification {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(userNotLogin) name:NotificationNameUserNotLogin object:nil];
}
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:NotificationNameUserNotLogin object:nil];
}
- (void)userNotLogin {
    NSLog(@"用户未登录");
    JCWUserBall *user = [JCWUserBall currentUser];
    if (user) {
//        [JCWToastTool showHint:@"登录信息过期，请重新登录"];
        //退出登录
        [JCWUserBall logOut];
        [[NSNotificationCenter defaultCenter] postNotificationName:NotificationUserLogout object:nil];


    }
//    [[NSNotificationCenter defaultCenter] postNotificationName:NotificationUserLogout object:nil];
    //跳转登录页
    JCBaseNavigationController * nav = self.showVCArray[self.tabSelIndex];;
//    (JCBaseNavigationController *)self.selectedViewController;
    JCBaseViewController * vc = [nav.viewControllers lastObject];
    NSLog(@"所有=%@",nav.viewControllers);
    if ([vc isKindOfClass:[JCLoginWMStickVC class]]) {
        return;
    }
    for (UIViewController *vc in nav.viewControllers) {
        if ([vc isKindOfClass:[JCLoginWMStickVC class]]) {
            return;
        }
    }
    //记录token过期,防止重复push登陆页
    if (self.isLogout==NO) {
        [vc presentLogin];
        self.isLogout = YES;
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.isLogout = NO;
    });

    
    
   
    
}
//获取app信息
- (void)getAppInfo {
    JCAppService_New *service = [JCAppService_New new];
    [service getKefuWXWithsuccess:^(id  _Nullable object) {
        if ([JCWJsonTool isSuccessResponse:object]) {
            JCConfigModel *configModel = (JCConfigModel *)[JCWJsonTool entityWithJson:object[@"data"] class:[JCConfigModel class]];
            if (configModel.customer.length==0) {
                configModel.customer = @"jingcaigood2";
            }
            [JCConfigModel save:configModel];
        }else{
            JCConfigModel *configModel = [JCConfigModel new];
            configModel.customer = @"jingcaigood2";
            [JCConfigModel save:configModel];
        }
    } failure:^(NSError * _Nonnull error) {
        JCConfigModel *configModel = [JCConfigModel new];
        configModel.customer = @"jingcaigood2";
        [JCConfigModel save:configModel];
    }];
}

- (JCMathEnterGaolTipView *)goalTipView {
    if (!_goalTipView) {
        _goalTipView = [JCMathEnterGaolTipView new];
        _goalTipView.hidden = YES;
    }
    return _goalTipView;
}

#pragma mark - debug
- (void)debugModing {
    //[self.view setNeedsLayout];
    self.debugButton.frame = CGRectMake(SCREEN_WIDTH-30-80-80, 88, 80, 80);
    [self.view addSubview:self.debugButton];
    WeakSelf;
    self.debugButton.clickBlock = ^(JCDebugButton * _Nonnull debugButton) {
        [weakSelf presentViewController:[JCTestVC new] animated:YES completion:nil];
//        JCBaseNavigationController * nav = (JCBaseNavigationController *)weakSelf.selectedViewController;
//        [nav pushViewController:[JCAAVC new] animated:YES];
    };
}
- (JCDebugButton *)debugButton {
    if (!_debugButton) {
        _debugButton = [[JCDebugButton alloc] init];
        

    }
    return _debugButton;
}
- (void)debugShowStatusBarHeight {
    CGFloat hhh = StatusBar_HEIGHT;
    NSLog(@"StatusBarHeight == %lf", hhh);
}

@end
