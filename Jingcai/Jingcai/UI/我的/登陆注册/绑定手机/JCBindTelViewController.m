//
//  JCBindTelViewController.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/11/14.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBindTelViewController.h"
#import "JKCountDownButton.h"
#import "SmsManager.h"
@interface JCBindTelViewController ()

@property (nonatomic,strong) UITextField *phoneTF;

@property (nonatomic,strong) UITextField *codeTF;

@property (nonatomic,strong) UITextField *passwordTF;

@property (nonatomic,strong) JKCountDownButton *codeBtn;

@property (nonatomic,strong) UIButton *agreeBtn;

@property (nonatomic,strong) UIButton *loginBtn;

@end

@implementation JCBindTelViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
     self.navigationBarStyle = JCNavigationBarStyleDefault;
    [self hideNavShadow];
    [self setNavBackImg];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
//    JCWUserBall * userBall = [JCWUserBall currentUser];
//    if (self.bindTelBlock) {
//        self.bindTelBlock(userBall.isBindTel);
//        //self.bindTelBlock(YES);
//    }
}

- (void)back:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"绑定手机号";
}



- (void)initSubViews {

    
    [self.view addSubview:self.phoneTF];
    [self.phoneTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(50));
        make.right.offset(AUTO(-100));
        make.top.offset(AUTO(40));
        make.height.mas_equalTo(AUTO(30));
    }];

    UIView *phoneLine = [UIView new];
    phoneLine.backgroundColor = COLOR_F4F4F8;
    [self.view addSubview:phoneLine];
    [phoneLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(50));
        make.right.offset(AUTO(-50));
        make.top.equalTo(self.phoneTF.mas_bottom).offset(AUTO(5));
        make.height.mas_equalTo(1);
    }];

    [self.view addSubview:self.codeTF];
    [self.codeTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(50));
        make.right.offset(AUTO(-120));
        make.top.equalTo(phoneLine.mas_bottom).offset(AUTO(20));
        make.height.mas_equalTo(AUTO(30));
    }];
    
    [self.view addSubview:self.codeBtn];
    [self.codeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-50));
        make.centerY.equalTo(self.codeTF);
        make.height.mas_equalTo(AUTO(30));
        make.width.mas_equalTo(AUTO(90));
    }];

    UIView *psdLine = [UIView new];
    psdLine.backgroundColor = COLOR_F4F4F8;
    [self.view addSubview:psdLine];
    [psdLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(50));
        make.right.offset(AUTO(-50));
        make.top.equalTo(self.codeTF.mas_bottom).offset(AUTO(5));
        make.height.mas_equalTo(1);
    }];
    
    [self.view addSubview:self.passwordTF];
    [self.passwordTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(50));
        make.right.offset(AUTO(-80));
        make.top.equalTo(psdLine.mas_bottom).offset(AUTO(20));
        make.height.mas_equalTo(AUTO(30));
    }];
    
    UIButton *secureBtn = [UIButton new];
    [secureBtn setImage:JCIMAGE(@"signin_ic_notvisible") forState:0];
    [secureBtn setImage:JCIMAGE(@"signin_ic_browse") forState:UIControlStateSelected];
    [self.view addSubview:secureBtn];
    secureBtn.tag= 100;
    [secureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-40));
        make.centerY.equalTo(self.passwordTF);
        make.width.height.mas_equalTo(AUTO(40));
    }];
    [secureBtn addTarget:self action:@selector(secureBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    

    UIView *passwordLine = [UIView new];
    passwordLine.backgroundColor = COLOR_F4F4F8;
    [self.view addSubview:passwordLine];
    [passwordLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(50));
        make.right.offset(AUTO(-50));
        make.top.equalTo(self.passwordTF.mas_bottom).offset(AUTO(5));
        make.height.mas_equalTo(1);
    }];
 


    UILabel *agreeLab = [UILabel initWithTitle:@"我已阅读并同意“服务协议”" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:0];
    [self.view addSubview:agreeLab];
    [agreeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(passwordLine.mas_bottom).offset(AUTO(40));
    }];

    [self.view addSubview:self.agreeBtn];
    [self.agreeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(agreeLab);
        make.right.equalTo(agreeLab.mas_left);
        make.width.height.mas_equalTo(AUTO(30));
    }];

    [self.view addSubview:self.loginBtn];
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(agreeLab.mas_bottom).offset(AUTO(20));
        make.left.offset(AUTO(50));
        make.right.offset(AUTO(-50));
        make.height.mas_equalTo(AUTO(44));
    }];
    
    
//    UILabel *registerLab = [UILabel initWithTitle:@"账号注册" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_002868 andBackgroundColor:JCClearColor andTextAlignment:0];
//    [self.view addSubview:registerLab];
//    [registerLab mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.loginBtn.mas_bottom).offset(AUTO(25));
//        make.centerX.equalTo(self.view);
//    }];
    
}

- (void)loginBtnClick {
    if (![JCWStringTool isValidateMobile:self.phoneTF.text]) {
        [JCWToastTool showHint:@"手机号码有误，请重填"];
        return ;
    }
    if ([JCWStringTool isEmptyStr:self.codeTF.text]) {
        [JCWToastTool showHint:@"请填写验证码"];
        return ;
    }
    if ([JCWStringTool isEmptyStr:self.passwordTF.text]) {
        [JCWToastTool showHint:@"请填写密码"];
        return ;
    }

    if (!self.agreeBtn.selected) {
        [JCWToastTool showHint:@"请阅读“服务协议”并点击同意"];
        return ;
    }
    WeakSelf;

    NSString *phone = [JCWAppTool getRSA_String:self.phoneTF.text];
    NSString *password = [JCWAppTool getRSA_String:self.passwordTF.text];
    
    JCUserService_New * service = [JCUserService_New service];
    [service bindTel:phone code:self.codeTF.text pass:password oauth_id:self.oauth_id success:^(id  _Nullable object) {
        if ([JCWJsonTool isSuccessResponse:object]) {
            JCWUserBall *userBall = (JCWUserBall *)[JCWJsonTool entityWithJson:object[@"data"] class:[JCWUserBall class]];
            [JCWUserBall save:userBall];
            if (self.bindTelBlock) {
                if (userBall.user_phone.length>0) {
                    [JCWToastTool showHint:@"绑定成功"];
                    [self getUserInfo];
//                    self.bindTelBlock(YES);
//                    [self.navigationController popViewControllerAnimated:YES];
                }
                
            }
//            [JCWToastTool showHint:@"绑定成功"];
//            [[NSNotificationCenter defaultCenter] postNotificationName:UserRegisterSuccess object:nil];
//            [weakSelf.navigationController popViewControllerAnimated:YES];
            return ;
        }else{
           [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        [JCWToastTool showHint:@"绑定失败"];
    }];
//    [service bindTel:phone code:self.codeTF.text pass:password success:^(id  _Nullable object) {
//
//    } failure:^(NSError * _Nonnull error) {
//        [JCWToastTool showHint:@"绑定失败"];
//    }];

}
- (void)getUserInfo {
    
    [self.jcWindow showLoading];
    JCUserService_New *service = [JCUserService_New service];
    [service getMyUserInfoWithSuccess:^(id  _Nullable object) {
        [self.jcWindow endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
            NSString *token = [JCWUserBall currentUser].token;
            NSLog(@"token=%@",token);
            //缓存userBall对象
            JCWUserBall *userBall = (JCWUserBall *)[JCWJsonTool entityWithJson:object[@"data"] class:[JCWUserBall class]];
            userBall.token = token;
            [JCWUserBall save:userBall];
            [self.navigationController popToRootViewControllerAnimated:YES];
            NSLog(@"user_id == %@",[JCWUserBall currentUser].user_id);
            NSLog(@"user_token == %@",[JCWUserBall currentUser].token);
            [[NSNotificationCenter defaultCenter] postNotificationName:NotificationUserLogin object:nil];
            [MobClick profileSignInWithPUID:[JCWUserBall currentUser].user_id];
            return ;
        }
        [JCWToastTool showHint:object[@"msg"]];
    } failure:^(NSError * _Nonnull error) {
        [self.jcWindow endLoading];
        [JCWToastTool showHint:@"获取用户信息失败"];
    }];

}


- (void)codeBtnClick {
    self.codeBtn.userInteractionEnabled = NO;
    
    BOOL isDebug = NO;
    WeakSelf;
    [[SmsManager sharedManager] getCodeWithTel:weakSelf.phoneTF.text type:SMSCodeTypeWechatBind isDebug:isDebug callback:^(BOOL isSucceed, NSString * _Nonnull code) {
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

- (void)agreeBtnClick:(UIButton *)sender {
    sender.selected = !sender.selected;

}

- (void)secureBtnClick:(UIButton *)sender {
    sender.selected = !sender.selected;
    if (sender.tag==100) {
        self.passwordTF.secureTextEntry = !sender.selected;
    }

    
}

- (UITextField *)phoneTF {
    if (!_phoneTF) {
        _phoneTF = [UITextField new];
        _phoneTF.placeholder = @"请输入手机号码";
        _phoneTF.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(16)];
        _phoneTF.keyboardType = UIKeyboardTypeNumberPad;
    }
    return _phoneTF;
}

- (UITextField *)codeTF {
    if (!_codeTF) {
        _codeTF = [UITextField new];
        _codeTF.placeholder = @"输入验证码";
        _codeTF.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(16)];
    }
    return _codeTF;
}

- (UITextField *)passwordTF {
    if (!_passwordTF) {
        _passwordTF = [UITextField new];
        _passwordTF.placeholder = @"请输入6-18位登录密码";
        _passwordTF.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(16)];
        _passwordTF.secureTextEntry = YES;
    }
    return _passwordTF;
}


- (UIButton *)agreeBtn {
    if (!_agreeBtn) {
        _agreeBtn = [UIButton new];
        [_agreeBtn setImage:JCIMAGE(@"login_choose_nor") forState:0];
        [_agreeBtn setImage:JCIMAGE(@"login_choose_sel") forState:UIControlStateSelected];
        _agreeBtn.selected = YES;
        [_agreeBtn addTarget:self action:@selector(agreeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _agreeBtn;
}
- (UIButton *)loginBtn {
    if (!_loginBtn) {
        _loginBtn = [UIButton initWithText:@"微信绑定手机号" FontSize:AUTO(16) Weight:2 BackGroundColor:JCBaseColor TextColors:JCWhiteColor];
        [_loginBtn addTarget:self action:@selector(loginBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [_loginBtn hg_setAllCornerWithCornerRadius:AUTO(22)];
    }
    return _loginBtn;
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
@end
