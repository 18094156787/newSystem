//
//  JCSettingVC.m
//  Jingcai
//
//  Created by Rain on 2018/10/11.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "JCSettingVC.h"
#import "JCAccountSettingIconCell.h"
#import "JCAccountSettingTextCell.h"
#import "JCSettingAvatarVC.h"
#import "JCSettingNameVC.h"
#import "JCSettingChangePwdVC.h"
#import "JCSettingVerifyTelVC.h"
#import "JCWUserBall.h"
#import "JCWJsonTool.h"
#import "JCWToastTool.h"
#import "JCWConst.h"
#import "JCWAppTool.h"
#import "JCApplyBindingBankCardVC.h"
#import "JCMyBankCardVC.h"
#import "JCAAVC.h"
#import "JCMyIntroduceVC.h"
#import "JCDisableAccountVC.h"
@interface JCSettingVC () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong) UIButton *logOutButton;
@end

@implementation JCSettingVC


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationBarStyle = JCNavigationBarStyleDefault;
    [self hideNavShadow];
//    [_tableView reloadData];
    [self getUserInfo];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationBarStyle = JCNavigationBarStyleDefault;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"账户设置";
    self.view.backgroundColor = COLOR_F0F0F0;
    self.tableView.backgroundColor = COLOR_F0F0F0;
    [self initViews];

}
- (void)getUserInfo {

    JCUserService_New *service = [JCUserService_New service];
    [service getMyUserInfoWithSuccess:^(id  _Nullable object) {

        if ([JCWJsonTool isSuccessResponse:object]) {
            NSString *token = [JCWUserBall currentUser].token;
            NSLog(@"token=%@",token);
            //缓存userBall对象
            JCWUserBall *userBall = (JCWUserBall *)[JCWJsonTool entityWithJson:object[@"data"] class:[JCWUserBall class]];
//            userBall.fabu = @"1";
            userBall.token = token;
 
            [JCWUserBall save:userBall];
            [self.tableView reloadData];

        }else {
            [JCWToastTool showHint:object[@"msg"]];
        }
        
    } failure:^(NSError * _Nonnull error) {

    }];

}

- (void)initViews {

    UIView *headView = [UIView new];
    headView.backgroundColor = COLOR_F0F0F0;
    headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, AUTO(8));
    self.tableView.tableHeaderView = headView;
    _tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectMake(0.0f,0.0f,_tableView.bounds.size.width,0.01f)];
    [_tableView registerClass:[JCAccountSettingIconCell class] forCellReuseIdentifier:@"JCAccountSettingIconCell"];
    [_tableView registerClass:[JCAccountSettingTextCell class] forCellReuseIdentifier:@"JCAccountSettingTextCell"];

    UIView *footView = [UIView new];
    footView.frame = CGRectMake(0, 0, SCREEN_WIDTH, AUTO(56));
    [footView addSubview:self.logOutButton];
    [self.logOutButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(footView);
        make.top.offset(AUTO(8));
        make.height.mas_equalTo(AUTO(48));
    }];
    self.tableView.tableFooterView = footView;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}


- (void)logOutButtonClick {
    JCWUserBall * user = [JCWUserBall currentUser];
    if (user.token.length==0) {
        return ;
    }
//    WeakSelf;
    JCUserService_New * service = [JCUserService_New new];
    [service getUserLogOutWithSuccess:^(id  _Nullable object) {
        if ([JCWJsonTool isSuccessResponse:object]) {
            [JCWToastTool showHint:@"账号已退出"];
            [JCWUserBall logOut];
            [self.navigationController popViewControllerAnimated:YES];
            [[NSNotificationCenter defaultCenter] postNotificationName:NotificationUserLogout object:nil];
            return ;
        }
    } failure:^(NSError * _Nonnull error) {
        
    }];

}


#pragma mark - UITableViewDelegate, UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 7;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 && indexPath.row == 0) {
        return AUTO(100);
    }
    if (indexPath.row==2) {
        if ([JCWUserBall currentUser].user_phone.length==0) {
            return 0.001f;
        }
    }
    if (indexPath.row==4&&[[JCWUserBall currentUser].tuijian intValue]!=1) {
        return 0.001f;
    }
    if (indexPath.row==5&&[[JCWUserBall currentUser].tuijian intValue]!=1) {
        return 0.001f;
    }
    return AUTO(60);
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section>0) {
        return AUTO(8);
    }
    return 0.0001f;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JCWUserBall * user = [JCWUserBall currentUser];
    if (indexPath.section == 0 && indexPath.row == 0) {
        JCAccountSettingIconCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCAccountSettingIconCell"];
        cell.leftTitle = @"头像";
        cell.iconImageUrl = [user.can_change_avatar integerValue]==2?user.audit_user_img:user.user_img;
        cell.isCheck = [user.can_change_avatar integerValue]==2?YES:NO;
        return cell;
    }
    JCAccountSettingTextCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCAccountSettingTextCell"];
    cell.isCheck = NO;
    if (indexPath.section == 0 && indexPath.row == 1) {
        cell.isCheck = [user.can_change_nickname integerValue]==2?YES:NO;
        cell.leftTitle = @"昵称";
        cell.rightTitle = [user.can_change_nickname integerValue]==2?user.audit_user_name:user.user_name;
        
    }
    if (indexPath.section == 0 && indexPath.row == 2) {
        cell.leftTitle = @"手机";
        cell.rightTitle = user.secTel;
        if (user.user_phone.length==0) {
            cell.leftTitle = @"";
            cell.rightTitle = @"";
        }
    }
    if (indexPath.section == 0 && indexPath.row == 3) {
        
        cell.leftTitle = @"修改密码";
        cell.rightTitle = @"";
    }
    if (indexPath.section == 0 && indexPath.row == 4) {
        cell.leftTitle = @"银行卡";
        if (user.bankcard_number.length>0) {
            cell.rightTitle = user.bankcard_number;
        }else{
            cell.rightTitle = @"未绑定";
        }
        if ([[JCWUserBall currentUser].fabu intValue]!=1) {
            cell.leftTitle = @"";
            cell.rightTitle = @"";
        }
    }
    if (indexPath.section == 0 && indexPath.row == 5) {
        cell.leftTitle = @"个人简介";
       
        cell.rightTitle = @"";
        cell.isCheck = [user.can_change_introduction integerValue]==2?YES:NO;

        if ([[JCWUserBall currentUser].tuijian intValue]!=1) {
            cell.leftTitle = @"";
            cell.rightTitle = @"";
        }
 
    }
    if (indexPath.section == 0 && indexPath.row == 6) {
        cell.leftTitle = @"注销账号";
        cell.rightTitle = @"";
    }

    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0 && indexPath.row == 0) {
        [self.navigationController pushViewController:[JCSettingAvatarVC new] animated:YES];
        return ;
    }
    if (indexPath.section == 0 && indexPath.row == 1) {
        [self.navigationController pushViewController:[JCSettingNameVC new] animated:YES];
        return ;
    }
    if (indexPath.section == 0 && indexPath.row == 2) {
        [self.navigationController pushViewController:[JCSettingVerifyTelVC new] animated:YES];
    }
    if (indexPath.section == 0 && indexPath.row == 3) {
        [self.navigationController pushViewController:[JCSettingChangePwdVC new] animated:YES];
    }
    if (indexPath.section == 0 && indexPath.row == 4) {
        if ([JCWUserBall currentUser].bankcard_number.length>0) {
            JCMyBankCardVC *vc = [JCMyBankCardVC new];
            WeakSelf;
            vc.JCRefreshBlock = ^{
                [weakSelf.tableView reloadData];
            };
            [self.navigationController pushViewController:vc animated:YES];
        }else{
            JCApplyBindingBankCardVC *vc = [JCApplyBindingBankCardVC new];
            WeakSelf;
            vc.JCRefreshBlock = ^{
                [weakSelf.tableView reloadData];
            };
            [self.navigationController pushViewController:vc animated:YES];
        }

    }
    if (indexPath.section == 0 && indexPath.row == 5&&[[JCWUserBall currentUser].fabu intValue]==1) {
        [self.navigationController pushViewController:[JCMyIntroduceVC new] animated:YES];
    }
    
    if (indexPath.section == 0 && indexPath.row == 6){
        [self.navigationController pushViewController:[JCDisableAccountVC new] animated:YES];
    }
    

}
//跳转设置界面
- (void)pushSetting {
    NSURL * url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
    if([[UIApplication sharedApplication] canOpenURL:url]) {
        NSURL * url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
        [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
    }
}

- (UIButton *)logOutButton {
    if (!_logOutButton) {
        _logOutButton = [UIButton initWithText:@"退出账户" FontSize:AUTO(16) Weight:1 BackGroundColor:JCWhiteColor TextColors:JCBaseColor];
        [_logOutButton addTarget:self action:@selector(logOutButtonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _logOutButton;
}
@end
