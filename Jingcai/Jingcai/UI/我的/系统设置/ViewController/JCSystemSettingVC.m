//
//  JCSystemSettingVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/11/4.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCSystemSettingVC.h"
#import "JCSystemSettingCell.h"
#import "JCWAppTool.h"
#import "JCPrivacyVC.h"
#import "JCPushSettingVC.h"
#import "JCMatchTipSettingVC.h"
#import "JCAccountProtectVC.h"
@interface JCSystemSettingVC ()

@end

@implementation JCSystemSettingVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationBarStyle = JCNavigationBarStyleDefault;
    [self hideNavShadow];
    
}


- (void)viewDidLoad {
    self.style = 1;
    [super viewDidLoad];
    self.title = @"系统设置";
    self.view.backgroundColor = COLOR_F0F0F0;
    [self initViews];
    
}

- (void)initViews {
    self.tableView.backgroundColor = JCClearColor;
//    self.tableView.separatorStyle = 0;
//    self.tableView.tableHeaderView = self.headView;
    self.tableView.estimatedRowHeight = 80;
    // 表格注册cell
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    [self.tableView registerClass:[JCSystemSettingCell class] forCellReuseIdentifier:@"JCSystemSettingCell"];
 
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(8));
    }];
}

#pragma mark - Protocol
#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return AUTO(54);
}



- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.001f;
}

//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
//    UIView *view = [UIView new];
//    view.backgroundColor = COLOR_F6F6F6;
//    return view;
//}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
//    return AUTO(10);
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JCSystemSettingCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCSystemSettingCell"];
    cell.backgroundColor = [UIColor clearColor];
     if (indexPath.row==0) {
         cell.titleLab.text = @"隐私协议";
     }
    if (indexPath.row==1) {
        cell.titleLab.text = @"用户服务条款";
    }
     if (indexPath.row==2) {
         cell.titleLab.text = @"推送设置";
     }
     if (indexPath.row==3) {
        cell.titleLab.text = @"进球提醒设置";
    }
    if (indexPath.row==4) {
       cell.titleLab.text = @"个人信息保护设置";
   }
    return cell;
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row==0) {
        [self pushPrivacy];
    }
    if (indexPath.row==1) {
        [self pushServiceProtocol];
    }
    if (indexPath.row==2) {
        [self pushPushSetting];
    }
    if (indexPath.row==3) {
        [self pushEnterBallTip];
    }
    if (indexPath.row==4) {
        [self.navigationController pushViewController:[JCAccountProtectVC new] animated:YES];
    }
}
- (void)pushPushSetting {
    if (![JCWUserBall currentUser]) {
        [self presentLogin];
        return ;
    }
    //判断是否开启了推送
    WeakSelf;
    [JCWAppTool isUserNotificationEnable:^(BOOL isEnabled) {
        //跳转推送设置页
        if (isEnabled) {
            [weakSelf.navigationController pushViewController:[JCPushSettingVC new] animated:YES];
            return ;
        }
        //提示打开推送弹窗
        UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"您当前未开启推送" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        UIAlertAction * settingAction = [UIAlertAction actionWithTitle:@"去设置" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [JCWAppTool goToAppSystemSetting];
        }];
        [alertController addAction:cancelAction];
        [alertController addAction:settingAction];
        [weakSelf presentViewController:alertController animated:YES completion:nil];
    }];
}

- (void)pushEnterBallTip{
    if (![JCWUserBall currentUser]) {
        [self presentLogin];
        return ;
    }
    [self.navigationController pushViewController:[JCMatchTipSettingVC new] animated:YES];
    
}
- (void)pushPrivacy {
    [self.navigationController pushViewController:[JCPrivacyVC new] animated:YES];
}
//服务协议
- (void)pushServiceProtocol {
    WebViewController *vc = [WebViewController new];
    vc.titleStr = @"用户服务条款";
    NSString *urlStr = [NSString  stringWithFormat:@"%@?dev=1",[JCConfigModel currentConfigModel].get_service];
    vc.urlStr = NonNil(urlStr);
    [self.navigationController pushViewController:vc animated:YES];
}
@end
