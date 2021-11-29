//
//  JCMineViewController.m
//  Jingcai
//
//  Created by 陈继伟 on 2019/8/11.
//  Copyright © 2019年 blockstar. All rights reserved.
//

#import "JCMineViewController.h"
#import "JCContactUsVC.h"
#import "JCSettingVC.h"
#import "JCWUserBall.h"
#import "JCPopViewManager.h"
#import "JCBindTelViewController.h"
#import "JCWToastTool.h"
#import "JCWAppTool.h"
#import "JCPrivacyVC.h"
#import "JCPushSettingVC.h"
#import "JCMyHongbaoVC.h"
#import "JCChargeVC.h"
#import "JCWJsonTool.h"
#import "JCCoinRecordsViewController.h"
#import "JCBaseNavigationController.h"
#import "JCWConst.h"
#import "JCMineHeadView.h"
#import "JCMyBuyPlanWMViewController.h"
#import "JCMainTabBarController.h"
#import "JCIncomeDetailVC.h"
#import "JCMineTableViewCell.h"
#import "JCYCMyFriendViewController.h"
#import "UITableViewCell+HKRound.h"
#import "JCPostCheckRuleVC.h"
#import "JCPostCheckingVC.h"
#import "JCHongbangWMstckyVC.h"
#import "JCBaseTitleAlertView.h"
#import "JCMineIncomeWMStickyVC.h"
#import "JCAAVC.h"
#import "JCPostPlanMatchTypeSelecView.h"
#import "JCPostPlanVC.h"
#import "JCSystemSettingVC.h"
#import "JCPostRecordWMVC.h"
#import "JCPostCheckFailVC.h"
#import "JCAboutUsViewController.h"
#import "JCContractUsViewController.h"
#import "JcActivitySquareVC.h"
#import "JCMineFabuCell.h"
#import "JCMineFuntionCell.h"
#import "JCMineActivityCell.h"
//#import "SwipeBack.h"
@interface JCMineViewController ()<UINavigationControllerDelegate>

@property (nonatomic,strong) NSMutableArray *dataSource;

@property (nonatomic,strong) NSArray *iconArray;

@property (nonatomic,strong) JCMineHeadView *headView;

@property (nonatomic,strong) NSArray *bannerArray;

@property (nonatomic,assign) BOOL fabu;

@property (nonatomic,assign) NSInteger status;

@end

@implementation JCMineViewController

//修改状态栏颜色
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self refreshUserData];
}

- (void)viewDidLoad {
    self.style = 1;
    [super viewDidLoad];
    self.view.backgroundColor = COLOR_F4F6F9;
    // Do any additional setup after loading the view.
    [self setNeedsStatusBarAppearanceUpdate];
    [self initViews];
    [self getHomeTopCycle];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshUserData) name:NotificationNameUserChange object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshUserData) name:NotificationUserLogin object:nil];
    
     NSLog(@"用户id %@",[JCWUserBall currentUser].user_id);
}

- (void)refreshUserData {

    JCWUserBall * userBall = [JCWUserBall currentUser];
    if (!userBall) {
        self.fabu = NO;
    }
    if ([userBall.fabu integerValue]==1){
        self.fabu = YES;
    }else{
        self.fabu = NO;
    }
    
     [self.tableView reloadData];

}
- (void)clearUser {
    [self.headView clearUser];
}

- (void)initViews {


    self.tableView.backgroundColor = COLOR_F4F6F9;
    self.tableView.separatorStyle = 0;

    self.tableView.estimatedRowHeight = 80;
    // 表格注册cell
    [self.tableView registerClass:[JCMineFabuCell class] forCellReuseIdentifier:@"JCMineFabuCell"];
    [self.tableView registerClass:[JCMineActivityCell class] forCellReuseIdentifier:@"JCMineActivityCell"];
    [self.tableView registerClass:[JCMineFuntionCell class] forCellReuseIdentifier:@"JCMineFuntionCell"];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, AUTO(30))];


}

- (void)getHomeTopCycle {

    JCActivityService *service = [JCActivityService service];
    [service getActivitySquareWithsuccess:^(id  _Nullable object) {
        if ([JCWJsonTool isSuccessResponse:object]) {
            self.bannerArray = [NSArray yy_modelArrayWithClass:[JCWSlideBall class] json:object[@"data"]];
            [self.tableView reloadData];
        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        
    }];


}

#pragma mark - Protocol
#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section==0) {
        if (self.fabu) {
            return 1;
        }
        return 0;
    }
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==1) {
        return AUTO(160);
    }
    return UITableViewAutomaticDimension;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.001f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [UIView new];
    view.backgroundColor = JCClearColor;
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return AUTO(8);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WeakSelf;
    if (indexPath.section==0) {
        JCMineFabuCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCMineFabuCell"];
        cell.JCMineClick = ^(NSInteger index) {
            if (index==100) {
                [weakSelf postPlan];//发布方案
            }
            if (index==101) {
                [weakSelf incomeDetail];
            }
            if (index==102) {
                [weakSelf pushPostPlanDetal];
            }
            if (index==103) {
                [weakSelf pushPostRule];
            }
            
        };
        return cell;
    }
    if (indexPath.section==1) {
        JCMineActivityCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCMineActivityCell"];
        cell.bannerArray = self.bannerArray;
        return cell;
    }


    JCMineFuntionCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCMineFuntionCell"];
    cell.JCMineClick = ^(NSInteger index) {
        if (index==300) {
            [weakSelf pushInviteFriendVC];//邀请好友
        }
        if (index==301) {
            [weakSelf pushMyBuyRecordVC];//购买记录
        }
        if (index==302) {
            [weakSelf pushAccountSetting];//账户设置
        }
        if (index==303) {
            [weakSelf pushSystemSetting];//系统设置
        }
        if (index==304) {
            [weakSelf pushContact];//联系客服
        }
        if (index==305) {
            [weakSelf pushAbout];//关于我们
        }

        
    };
    return cell;
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    
//    if (self.fabu) {
//            if (indexPath.section==0) {
//            if (indexPath.row==0) {
//                 [self postPlan];//发布方案
//            }
//            if (indexPath.row==1) {
//                [self incomeDetail];
//            }
//            if (indexPath.row==2) {
//                [self pushPostPlanDetal];
//            }
//        }
////        @[@"账户设置",@"联系客服",@"系统设置",@"关于我们"]
//        if (indexPath.section==1) {
//                switch (indexPath.row) {
//                case 0:
//                    [self pushAccountSetting];//账户设置
//
//                    break;
//                    
//                case 1:
//                    [self pushContact];//联系客服
//                    break;
//                case 2:
//                    [self pushSystemSetting];//系统设置
//                    break;
//                case 3:
//                    [self pushAbout];//关于我们
//                    break;
//                case 4:
//                    [self pushActivity];//活动广场
//                    break;
//                        
//                
//                    
//                default:
//                    break;
//            }
//        }
//    }else{
//        
//                switch (indexPath.row) {
//                case 0:
//                    [self pushAccountSetting];//账户设置
//
//                    break;
//                    
//                case 1:
//                    [self pushContact];//联系客服
//                    break;
//                case 2:
//                    [self pushSystemSetting];//系统设置
//                    break;
//                case 3:
//                    [self pushAbout];//关于我们
//                    break;
//                case 4:
//                    [self pushActivity];//活动广场
//                    break;
//                
//                    
//                default:
//                    break;
//            }
//    }
}
- (void) tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //只需要在此调用圆角显示方法
    [cell hk_roundCellWithTableView:tableView forRowAtIndexPath:indexPath];
}


#pragma mark - 点击事件

- (void)pushCoinRecords {
    if (![JCWUserBall currentUser]) {
        [self presentLogin];
        return ;
    }
    [self.navigationController pushViewController:[JCCoinRecordsViewController new] animated:YES];
}
- (void)pushMyBuy {
    if (![JCWUserBall currentUser]) {
        [self presentLogin];
        return ;
    }
    [self.navigationController pushViewController:[JCMyBuyPlanWMViewController new] animated:YES];
}

- (void)pushAbout {
    WebViewController *vc = [WebViewController new];
    vc.titleStr = @"关于我们";
    NSString *url = [JCConfigModel currentConfigModel].get_about;
    vc.urlStr = NonNil(url);
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)pushContact {
    WebViewController *vc = [WebViewController new];
    vc.titleStr = @"帮助&客服";
    NSString *url = [JCConfigModel currentConfigModel].get_customer;
    vc.urlStr = NonNil(url);
    [self.navigationController pushViewController:vc animated:YES];

}

- (void)postPlan {
    
    if (![JCWUserBall currentUser]) {
        [self presentLogin];
        return;
    }
    
    if ([[JCWUserBall currentUser].fabu intValue]==1) {
        if ([[JCWUserBall currentUser].fabu_count intValue]==0) {
            JCBaseTitleAlertView *alertView = [JCBaseTitleAlertView new];
            [alertView alertTitle:@"" TitleColor:COLOR_333333 Mesasge:@"非常抱歉,您今日发布方案已达上限!\n请明天再来。" MessageColor:COLOR_333333 ComfirmTitle:@"确认" ComfirmColor:JCBaseColor confirmHandler:^{
                [alertView removeFromSuperview];
            }];
            alertView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
            [[UIApplication sharedApplication].keyWindow addSubview:alertView];
            return;
        }
        JCPostPlanMatchTypeSelecView *view = [JCPostPlanMatchTypeSelecView new];
        view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        view.JCPushVCBlick = ^(NSString * _Nonnull type) {
            JCPostPlanVC *vc = [JCPostPlanVC new];
            vc.type = type;
            [self.navigationController pushViewController:vc animated:YES];
        };
        [[UIApplication sharedApplication].keyWindow addSubview:view];
    }
    
    if ([[JCWUserBall currentUser].fabu intValue]==2) {
            JCBaseTitleAlertView *alertView = [JCBaseTitleAlertView new];
            [alertView alertTitle:@"" TitleColor:COLOR_333333 Mesasge:@"您已被禁止发帖\n请联系官方客服处理" MessageColor:COLOR_333333 ComfirmTitle:@"知道了" ComfirmColor:JCBaseColor confirmHandler:^{
                [alertView removeFromSuperview];
            }];
            alertView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
            [[UIApplication sharedApplication].keyWindow addSubview:alertView];
    }
    if ([[JCWUserBall currentUser].fabu intValue]==3) {
        [self.navigationController pushViewController:[JCPostCheckingVC new] animated:YES];
    }
    if ([[JCWUserBall currentUser].fabu intValue]==0||[[JCWUserBall currentUser].fabu intValue]==4) {
        [self.navigationController pushViewController:[JCPostCheckRuleVC new] animated:YES];
    }
    

}


//发布记录
- (void)pushPostPlanDetal {
    if (![JCWUserBall currentUser]) {
        [self presentLogin];
        return ;
    }
    JCPostRecordWMVC *vc = [JCPostRecordWMVC  new];
    [self.navigationController pushViewController:vc animated:YES];//
}

//发布规则
- (void)pushPostRule {
    if (![JCWUserBall currentUser]) {
        [self presentLogin];
        return ;
    }
    WebViewController *vc = [WebViewController new];
    vc.titleStr = @"规则说明";
    NSString *url = [NSString stringWithFormat:@"%@?user_id=%@&sv=%@",[JCConfigModel currentConfigModel].get_rule,[JCWUserBall currentUser].id,[JCWInterfaceTool appVersion]];
    vc.urlStr = NonNil(url);
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)incomeDetail {
    if (![JCWUserBall currentUser]) {
        [self presentLogin];
        return ;
    }
//    JCIncomeDetailVC
    [self.navigationController pushViewController:[JCMineIncomeWMStickyVC  new] animated:YES];//JCMineIncomeWMStickyVC
}

//
//邀请好友
- (void)pushInviteFriendVC {
    if (![JCWUserBall currentUser]) {
        [self presentLogin];
        return ;
    }
    [self.navigationController pushViewController:[JCYCMyFriendViewController new] animated:YES];
}
//
//购买记录
- (void)pushMyBuyRecordVC {
    if (![JCWUserBall currentUser]) {
        [self presentLogin];
        return ;
    }
    [[self getViewController].navigationController pushViewController:[JCMyBuyPlanWMViewController new] animated:YES];
}
//账户设置
- (void)pushAccountSetting {
    //跳转设置
    JCWUserBall * userBall = [JCWUserBall currentUser];
    if (userBall) {
        [self.navigationController pushViewController:[JCSettingVC new] animated:YES];
        return ;
    }
    [self presentLogin];
}
//系统设置
- (void)pushSystemSetting {
    [self.navigationController pushViewController:[JCSystemSettingVC new] animated:YES];
}




#pragma mark - Notification
- (void)addNotification {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(userChange) name:NotificationNameUserChange object:nil];
}

- (void)userChange {
    self.headView.userBall = [JCWUserBall currentUser];
}



- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:NotificationNameUserChange object:nil];
}

- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        NSArray *array = @[@"账户设置",@"联系客服",@"系统设置",@"关于我们",@"活动广场"];
        _dataSource = [NSMutableArray arrayWithArray:array];
    }
    return _dataSource;
}

-(NSArray *)iconArray {
    if (!_iconArray) {
        _iconArray = @[JCIMAGE(@"mine_account"),JCIMAGE(@"mine_kefu"),JCIMAGE(@"mine_setting"),JCIMAGE(@"mine_abountus"),JCIMAGE(@"mine_activity")];
    }
    return _iconArray;
}

- (JCMineHeadView *)headView {
    if (!_headView) {
        _headView = [JCMineHeadView new];
    }
    return _headView;
}

@end
