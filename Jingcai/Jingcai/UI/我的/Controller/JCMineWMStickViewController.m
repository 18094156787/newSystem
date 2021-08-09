//
//  JCMineWMStickViewController.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/28.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCMineWMStickViewController.h"
#import "JCMineHeadView.h"
#import "JCMineViewController.h"
#import "JCPostCheckFailVC.h"
#import "JCPostCheckingVC.h"
#import "JCPostCheckRuleVC.h"
#import "JCBaseTitleAlertView.h"
#import "IAPManager.h"
#import "JCActivityGuessVC.h"
#import "JCAppGuideView.h"
#import "JCMainTabBarController.h"
#import "JCActivityGuess_SPF_VC.h"
#import "JCPostCheckUserInfo_Invite_VC.h"
#import "JCPostCheckUserInfo_Invite_VC.h"
#import "JCActivityGuess_SPF_More_VC.h"

static CGFloat const kWMMenuViewHeight = 0;
@interface JCMineWMStickViewController ()

@property (nonatomic, strong) JCMineHeadView *topHeadView;

@property (nonatomic, strong) JCMineViewController *mineVC;

@property (nonatomic,assign) float headerViewHeigh;

@property (nonatomic,assign) BOOL isLoad;

@end

@implementation JCMineWMStickViewController

//修改状态栏颜色
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [self getUserInfo];
    if ([JCConfigModel currentConfigModel].get_customer.length==0) {
        [self getAppInfo];
    }
}



- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
//    self.navigationController.navigationBarHidden = NO;
    [self.navigationController setNavigationBarHidden:NO animated:animated];
//    self.navigationBarStyle = JCNavigationBarStyleDefault;
}

- (instancetype)init {
    if (self = [super init]) {
        self.headerViewHeigh = kNavigationBarHeight+AUTO(205);

        self.menuViewStyle = WMMenuViewStyleLine;
        self.progressViewBottomSpace = 1;
        self.progressColor= JCBaseColor;
        self.titleColorSelected = COLOR_333333;
        self.titleColorNormal = COLOR_999999;
        self.titleSizeNormal = 17;
        self.titleSizeSelected = 17;
        self.progressHeight = 2;
        self.viewTop = self.headerViewHeigh;
        self.maximumHeaderViewHeight = AUTO(205);
        self.minimumHeaderViewHeight = AUTO(205);
//        self.itemsMargins =
//        self.menuItemWidth = AUTO(100);
        self.automaticallyCalculatesItemWidths = YES;
//        self.titleFontName = @"PingFangSC-Medium";
        self.contentView.bounces = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = COLOR_002868;
    self.topHeadView.frame = CGRectMake(0, 0, SCREEN_WIDTH, self.headerViewHeigh);
    [self.view addSubview:self.topHeadView];
    [self initView];
    [self showGuideView];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(clearUser) name:NotificationUserLogout object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refresgUserInfo) name:UserRechargeSuccess object:nil];


}

- (void)refresgUserInfo {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self getUserInfo];
    });
}

- (void)getUserInfo {
    if ( [JCWUserBall currentUser].token.length==0) {
        
        [JCWUserBall logOut];
        [self.topHeadView clearUser];
        return;
    }
    if (!self.isLoad) {
        [self.jcWindow showLoading];
    }
    JCUserService_New *service = [JCUserService_New service];
    [service getMyUserInfoWithSuccess:^(id  _Nullable object) {
        self.isLoad = YES;
        [self.jcWindow endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
            NSString *token = [JCWUserBall currentUser].token;
            NSLog(@"token=%@",token);
            //缓存userBall对象
            JCWUserBall *userBall = (JCWUserBall *)[JCWJsonTool entityWithJson:object[@"data"] class:[JCWUserBall class]];
//            userBall.fabu = @"1";
            userBall.token = token;
 
            [JCWUserBall save:userBall];
            self.topHeadView.userBall = userBall;

            [self.mineVC refreshUserData];
            [self isInCurrentVC];//活动弹窗展示

            NSLog(@"user_id == %@",[JCWUserBall currentUser].user_id);
            NSLog(@"user_token == %@",[JCWUserBall currentUser].token);

        }else {
            [JCWToastTool showHint:object[@"msg"]];
        }
        
    } failure:^(NSError * _Nonnull error) {
        [self.jcWindow endLoading];
        [JCWToastTool showHint:@"获取用户信息失败"];
    }];

}






- (void)initView {
    
//    UIView *bgView = [UIView new];
//    bgView.backgroundColor = COLOR_002868;
//    bgView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-kTabBarHeight-100);
//    [self.view insertSubview:bgView atIndex:0];
    WeakSelf;
    self.topHeadView.JCQianYueBlock = ^{
        [weakSelf qyClick];
    };

    
    self.contentView.mj_header = [MJRefreshHeader headerWithRefreshingBlock:^{
        if (![JCWUserBall currentUser]) {
            [weakSelf.contentView.mj_header endRefreshing];
            return;
        }
        [weakSelf.jcWindow showLoading];
        [weakSelf getUserInfo];
        [[IAPManager shared] checkMyBuyGoods];
        [weakSelf.mineVC getHomeTopCycle];
        
        [weakSelf.contentView.mj_header endRefreshing];
    }];
    


}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];

//    CGFloat headerViewHeight = self.headerViewHeigh;
////    CGFloat headerViewHeight = self.headerViewHeigh;
//    CGFloat headerViewX = 0;
//    UIScrollView *scrollView = (UIScrollView *)self.view;
//    if (scrollView.contentOffset.y < 0) {
//        headerViewX = scrollView.contentOffset.y;
//        headerViewHeight -= headerViewX;
//
//    }
//    self.topHeadView.frame = CGRectMake(0, headerViewX, SCREEN_WIDTH, self.headerViewHeigh);
}

- (void)btnClicked:(id)sender {
    NSLog(@"touch up inside");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - ScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [super scrollViewDidScroll:scrollView];
//    if (scrollView.contentOffset.y < 0) {
////        [self.view setNeedsLayout];
//        scrollView.contentOffset = CGPointZero;
//    }
    CGFloat offsetY = self.contentView.contentOffset.y;
    CGFloat maxOffsetY = kNavigationBarHeight;
    float percent = offsetY/maxOffsetY;

    if (percent>=1) {
        self.topHeadView.userInfoView.alpha = 0;

    }else{
        self.topHeadView.userInfoView.alpha = 1-percent;

    }
//
//
//    NSLog(@"%.0f",scrollView.contentOffset.y);
}

#pragma mark - Datasource & Delegate
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController {
    return 1;
}

- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
    return self.mineVC;
}

- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    return @"";
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForMenuView:(WMMenuView *)menuView {
    return CGRectMake(0, _viewTop,SCREEN_WIDTH, kWMMenuViewHeight);

}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForContentView:(WMScrollView *)contentView {
    CGFloat originY = _viewTop + kWMMenuViewHeight;
//    return CGRectMake(0, originY, SCREEN_WIDTH, SCREEN_HEIGHT-AUTO(440));
    return CGRectMake(0, originY, SCREEN_WIDTH, SCREEN_HEIGHT-kNavigationBarHeight-kTabBarHeight-AUTO(205));
}

- (void)qyClick {
    if (![JCWUserBall currentUser]) {
        [self presentLogin];
        return;
    }

    
   JCWUserBall *user =  [JCWUserBall currentUser];
//    user.fabu = @"3";
    [JCWUserBall save:user];
//fabu 0 不能发布 1 可以发布  2被禁  3审核中 4审核被拒


//
    if ([[JCWUserBall currentUser].fabu intValue]==4||[[JCWUserBall currentUser].fabu intValue]==5) {
        JCPostCheckFailVC *vc = [JCPostCheckFailVC new];
        vc.fabu = [JCWUserBall currentUser].fabu;
        [self.navigationController pushViewController:vc animated:YES];
         return;
        }
    if ([[JCWUserBall currentUser].fabu intValue]==3) {
        [self.navigationController pushViewController:[JCPostCheckingVC new] animated:YES];
         return;
    }
//    JCWUserBall *user = [JCWUserBall currentUser];
        if ([[JCWUserBall currentUser].ten_red  intValue]==1) {
            //10连红签约
//
            JCPostCheckRuleVC *vc = [JCPostCheckRuleVC new];
            vc.isJingcai = YES;
            [self.navigationController pushViewController:vc animated:YES];
            return;
        }
        if ([[JCWUserBall currentUser].fabu intValue]==0) {

            JCPostCheckRuleVC *vc = [JCPostCheckRuleVC new];
            [self.navigationController pushViewController:vc animated:YES];
            return;
        }
    if ([[JCWUserBall currentUser].fabu intValue]==2) {
        JCBaseTitleAlertView *alertView = [JCBaseTitleAlertView new];
        [alertView alertTitle:@"" TitleColor:COLOR_333333 Mesasge:@"您已被禁止发帖\n请联系官方客服处理" MessageColor:COLOR_333333 ComfirmTitle:@"知道了" ComfirmColor:JCBaseColor confirmHandler:^{
            [alertView removeFromSuperview];
        }];
        alertView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        [[UIApplication sharedApplication].keyWindow addSubview:alertView];
         return;
    }



}


- (void)showGuideView {
    if (![[NSUserDefaults standardUserDefaults] objectForKey:@"JCAppGuide_mine"]) {
        JCAppGuideView *view = [JCAppGuideView new];
        
        if (SCREEN_HEIGHT>667){
            view.dataArray = @[JCIMAGE(@"course_4")];
        }else{
            view.dataArray = @[JCIMAGE(@"course_min_4")];
        }
        view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        view.JCBlock = ^{
            [[NSUserDefaults standardUserDefaults] setObject:@"1" forKey:@"JCAppGuide_mine"];
        };
        [self.jcWindow addSubview:view];
    }

}
//竞猜活动开奖提示弹窗
- (void)showJingCaiActivityResultView {

    if ([JCWUserBall currentUser].guess_activity_text.length>0&&[JCWUserBall currentUser].guess_activity_id.length>0) {

        JCBaseTitleAlertView *alertView = [JCBaseTitleAlertView new];
        alertView.contentLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(16)];
        [alertView alertTitle:@"" TitleColor:COLOR_2F2F2F Mesasge:[JCWUserBall currentUser].guess_activity_text MessageColor:COLOR_666666 SureTitle:@"前往查看" SureColor:JCWhiteColor SureHandler:^{

#pragma mark--这边
//
            NSLog(@"%@",[JCWUserBall currentUser].guess_activity_id);
            if ([[JCWUserBall currentUser].guess_activity_type integerValue]==6) {
                JCActivityGuess_SPF_VC *vc = [JCActivityGuess_SPF_VC new];
                vc.actID = [JCWUserBall currentUser].guess_activity_id;
                [self.navigationController pushViewController:vc animated:YES];
            } else if ([[JCWUserBall currentUser].guess_activity_type integerValue]==7) {
                JCActivityGuess_SPF_More_VC *vc = [JCActivityGuess_SPF_More_VC new];
                vc.actID = [JCWUserBall currentUser].guess_activity_id;
                [self.navigationController pushViewController:vc animated:YES];
            }else{
                JCActivityGuessVC *vc = [JCActivityGuessVC new];
                vc.actID = [JCWUserBall currentUser].guess_activity_id;
                [self.navigationController pushViewController:vc animated:YES];
            }

            [alertView removeFromSuperview];
        } CancleTitle:@"我知道了" CancleColor:JCBaseColor CancelHandler:^{
           [alertView removeFromSuperview];
        }];
        alertView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        [[UIApplication sharedApplication].keyWindow addSubview:alertView];

    }

}
- (void)isInCurrentVC {
    
    JCMainTabBarController *tabBarController = (JCMainTabBarController *)[UIApplication sharedApplication].delegate.window.rootViewController;
    BOOL value =  [tabBarController isCurrentBaseVCWtihIndex:4]&&self.navigationController.topViewController==self;
    if (value) {
        [self showJingCaiActivityResultView];
    }
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

- (void)clearUser {
    [self.topHeadView clearUser];
}


- (JCMineHeadView *)topHeadView {
    if (!_topHeadView) {
        _topHeadView = [JCMineHeadView new];
    }
    return _topHeadView;
}

- (JCMineViewController *)mineVC {
    if (!_mineVC) {
        _mineVC = [JCMineViewController new];
    }
    return _mineVC;
}

@end
