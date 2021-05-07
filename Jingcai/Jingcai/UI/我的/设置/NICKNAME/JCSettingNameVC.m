//
//  JCSettingNameVC.m
//  Jingcai
//
//  Created by Rain on 2018/10/11.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "JCSettingNameVC.h"
#import "JCWStringTool.h"
#import "JCWJsonTool.h"
#import "JCWToastTool.h"
#import "JCWUserBall.h"
#import "JCMonitorTextField.h"

@interface JCSettingNameVC ()
@property (weak, nonatomic) IBOutlet JCMonitorTextField * userNameTextField;
@property (weak, nonatomic) IBOutlet UIButton * commitButton;
@property (nonatomic,strong) UILabel *infoLab;
@end

@implementation JCSettingNameVC
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationBarStyle = JCNavigationBarStyleDefault;
    [self setNavBackImg];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationBarStyle = JCNavigationBarStyleDefault;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = COLOR_F0F0F0;
    self.navigationItem.title = @"昵称设置";
    [self getCheckInfo];

}

- (void)initSubViews {
    self.userNameTextField.placeholder = @"请输入2-8个字符";
    self.commitButton.backgroundColor = JCBaseColor;

    [self.view addSubview:self.infoLab];
    [self.infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.commitButton);
        make.top.equalTo(self.commitButton.mas_bottom).offset(AUTO(10));
    }];
    if ([[JCWUserBall currentUser].tuijian integerValue] ==1) {
        self.infoLab.text = @"①成为达人后，修改昵称需客服审核！\n②昵称中请勿带有二维码微信号、电话号码等非法信息，否则将不予通过！\n③每月最多修改1次！";
    }
}

//获取达人审核信息
- (void)getCheckInfo {
    //不是签约专家就不去获取
    if ([[JCWUserBall currentUser].tuijian integerValue]!=1) {

        return;
    }
    
    [self.view showLoading];
    JCUserService_New * service = [JCUserService_New service];
    [service getUserCheckInfoWithType:@"1" success:^(id  _Nullable object) {
        [self.view endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
            NSString *content = object[@"data"][@"content"];
            NSString *state = object[@"data"][@"current_state"];//是否可以修改 1是 2审核中 3本月已修改 4禁止修改
            self.userNameTextField.text = NonNil(content);
            if ([state integerValue]==1) {
                [self.commitButton setTitle:@"修改" forState:0];
                self.commitButton.backgroundColor = JCBaseColor;
                self.commitButton.userInteractionEnabled = YES;
            }
            if ([state integerValue]==2) {
                [self.commitButton setTitle:@"审核中" forState:0];
                self.commitButton.backgroundColor = COLOR_9F9F9F;
                self.commitButton.userInteractionEnabled = NO;
                self.userNameTextField.userInteractionEnabled = NO;
            }
            if ([state integerValue]==3) {
                [self.commitButton setTitle:@"本月已修改" forState:0];
                self.commitButton.backgroundColor = COLOR_9F9F9F;
                self.commitButton.userInteractionEnabled = NO;
                self.userNameTextField.userInteractionEnabled = NO;

            }
        }else{
             [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        [self.view endLoading];
    }];

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (IBAction)submitBtnClick:(UIButton *)sender {
     NSString *titleStr = self.userNameTextField.text;
    titleStr = [titleStr stringByReplacingOccurrencesOfString:@" " withString:@""];
     if (titleStr.length<2||titleStr.length>8) {
          [JCWToastTool showHint:@"昵称要求2-8个字符"];
            return;
     }
    
    
    if ([JCWStringTool isEmptyStr:self.userNameTextField.text]||titleStr.length==0) {
        //提示弹窗
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:@"没有输入昵称，请重新填写" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"我知道了" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:defaultAction];
        [self presentViewController:alertController animated:YES completion:nil];
        return ;
    }
    WeakSelf;
    [self.view showLoading];
        JCUserService_New * service = [JCUserService_New service];
        [service updateUserInfoWithType:@"1" value:self.userNameTextField.text code:@"" success:^(id  _Nullable object) {
            [self.view endLoading];
            if ([JCWJsonTool isSuccessResponse:object]) {
                //更新user
                if ([[JCWUserBall currentUser].tuijian integerValue]!=1) {
                    //如果是普通的用户,是可以直接修改.专家必须经过审核
                    JCWUserBall * userBall = [JCWUserBall currentUser];
                    userBall.user_name = weakSelf.userNameTextField.text;
                    [JCWUserBall save:userBall];
                }

                [[NSNotificationCenter defaultCenter] postNotificationName:NotificationNameUserChange object:nil];
                [weakSelf.navigationController popViewControllerAnimated:YES];
                
            }else{
                 [JCWToastTool showHint:object[@"msg"]];
            }
        } failure:^(NSError * _Nonnull error) {
            [self.view endLoading];
            [JCWToastTool showHint:@"修改失败"];
        }];
    
}

- (UILabel *)infoLab {
    if (!_infoLab) {
        _infoLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:0];
        _infoLab.numberOfLines = 0;
    }
    return _infoLab;
}

@end
