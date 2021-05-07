//
//  JCDisableAccountCheckVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/2/3.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCDisableAccountCheckVC.h"
#import "JKCountDownButton.h"
#import "SmsManager.h"
@interface JCDisableAccountCheckVC ()

@property (nonatomic,strong) UILabel *contentLab;

@property (nonatomic,strong) UITextField *codeTF;

@property (nonatomic,strong) JKCountDownButton *codeBtn;

@end

@implementation JCDisableAccountCheckVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"身份验证";
}

- (void)initSubViews {
    UILabel *label = [UILabel initWithTitle:@"输入验证码" andFont:AUTO(22) andWeight:2 andTextColor:JCBlackColor andBackgroundColor:JCClearColor andTextAlignment:0];
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(30));
        make.top.offset(AUTO(30));
    }];
    
    self.contentLab = [UILabel initWithTitle:@"" andFont:AUTO(22) andWeight:2 andTextColor:JCBlackColor andBackgroundColor:JCClearColor andTextAlignment:0];
    [self.view addSubview:self.contentLab];
    [self.contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(30));
        make.top.equalTo(label.mas_bottom).offset(AUTO(15));
        make.height.mas_equalTo(AUTO(20));
    }];
    
    [self.view addSubview:self.codeTF];
    [self.codeTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(30));
        make.right.offset(AUTO(-120));
        make.top.equalTo(self.contentLab.mas_bottom).offset(AUTO(20));
        make.height.mas_equalTo(AUTO(30));
    }];
    
    [self.view addSubview:self.codeBtn];
    [self.codeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-30));
        make.centerY.equalTo(self.codeTF);
        make.height.mas_equalTo(AUTO(30));
        make.width.mas_equalTo(AUTO(90));
    }];

    UIView *psdLine = [UIView new];
    psdLine.backgroundColor = COLOR_F4F4F8;
    [self.view addSubview:psdLine];
    [psdLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(30));
        make.right.offset(AUTO(-30));
        make.top.equalTo(self.codeTF.mas_bottom).offset(AUTO(5));
        make.height.mas_equalTo(1);
    }];
    
    UIButton *sureBtn = [UIButton initWithText:@"确认注销" FontSize:AUTO(16) BackGroundColor:JCBaseColor TextColor:JCWhiteColor];
    [sureBtn hg_setAllCornerWithCornerRadius:AUTO(22.5)];
    [self.view addSubview:sureBtn];
    [sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.top.equalTo(psdLine.mas_bottom).offset(AUTO(50));
        make.height.mas_equalTo(AUTO(45));
        
    }];
    [sureBtn addTarget:self action:@selector(sureBtnClick) forControlEvents:UIControlEventTouchUpInside];
}



- (void)codeBtnClick {
    self.codeBtn.userInteractionEnabled = NO;

    BOOL isDebug = NO;
    WeakSelf;
    [[SmsManager sharedManager] getCodeWithTel:[JCWUserBall currentUser].user_phone type:SMSCodeTypeAccontDisable isDebug:isDebug callback:^(BOOL isSucceed, NSString * _Nonnull code) {
        if (isDebug) {
            weakSelf.codeTF.text = code;
            return ;
        }
        if (isSucceed) {
            [self.codeBtn startCountDownWithSecond:60];
        }else{
             weakSelf.codeBtn.userInteractionEnabled = YES;
        }
    }];



    [self.codeBtn countDownFinished:^NSString *(JKCountDownButton *countDownButton, NSUInteger second) {
//        [self.codeBtn ]
        countDownButton.userInteractionEnabled = YES;
        return @"获取验证码";
    }];
}

- (void)sureBtnClick {
    [self.view endLoading];
    if (self.codeTF.text.length==0) {
        [JCWToastTool showHint:@"请输入验证码"];
        return;
    }
    NSString *phone = [JCWUserBall currentUser].user_phone;
    NSString *mobilie = [JCWAppTool getRSA_String:phone];
    [self.view showLoading];
    JCUserService_New * service = [JCUserService_New service];
    [service disableAccountTextWithoperation:@"2" mobile:mobilie code:self.codeTF.text Success:^(id  _Nullable object) {
        [self.view endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {

            [self disableMyAccount];
            return;
        }
        [JCWToastTool showHint:object[@"msg"]];

    } failure:^(NSError * _Nonnull error) {
        [self.view endLoading];
    }];
    

}

- (void)disableMyAccount {

    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"" message:@"身份验证通过，是否确认注销？" preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSString *phone = [JCWUserBall currentUser].user_phone;
        NSString *mobilie = [JCWAppTool getRSA_String:phone];
        [self.view showLoading];
        JCUserService_New * service = [JCUserService_New service];
       

        [service disableAccountTextWithoperation:@"3" mobile:mobilie code:@"" Success:^(id  _Nullable object) {
            [self.view endLoading];
            if ([JCWJsonTool isSuccessResponse:object]) {
                [JCWToastTool showHint:@"账号注销成功！"];
                [JCWUserBall logOut];
                [self.navigationController popToRootViewControllerAnimated:YES];
                [[NSNotificationCenter defaultCenter] postNotificationName:NotificationUserLogout object:nil];
                return;
            }
            [JCWToastTool showHint:object[@"msg"]];

        } failure:^(NSError * _Nonnull error) {
            [self.view endLoading];
        }];
        
    }]];
    [self presentViewController:alertController animated:YES completion:nil];

}

- (UITextField *)codeTF {
    if (!_codeTF) {
        _codeTF = [UITextField new];
        _codeTF.placeholder = @"输入验证码";
        _codeTF.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(16)];
        _codeTF.keyboardType = UIKeyboardTypeNumberPad;
    }
    return _codeTF;
}



- (JKCountDownButton *)codeBtn {
    if (!_codeBtn) {
        _codeBtn = [JKCountDownButton new];
        [_codeBtn setTitle:@"获取验证码" forState:0];
        [_codeBtn setTitle:@"获取验证码" forState:UIControlStateHighlighted];
        _codeBtn.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(14)];
        [_codeBtn setTitleColor:JCBaseColor forState:0];
        [_codeBtn setTitleColor:JCBaseColor forState:UIControlStateHighlighted];
        [_codeBtn addTarget:self action:@selector(codeBtnClick) forControlEvents:UIControlEventTouchUpInside];

    }
    return _codeBtn;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
