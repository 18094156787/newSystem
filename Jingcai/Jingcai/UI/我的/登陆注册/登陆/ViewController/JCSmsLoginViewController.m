//
//  JCSmsLoginViewController.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/11/14.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCSmsLoginViewController.h"
#import "JKCountDownButton.h"
#import "SmsManager.h"
#import "JCRegisterViewController.h"
@interface JCSmsLoginViewController ()

@property (nonatomic,strong) UITextField *phoneTF;

@property (nonatomic,strong) UITextField *codeTF;

@property (nonatomic,strong) JKCountDownButton *codeBtn;

@property (nonatomic,strong) UIButton *agreeBtn;

@property (nonatomic,strong) UIButton *loginBtn;

@end

@implementation JCSmsLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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



    UILabel *agreeLab = [UILabel initWithTitle:@"我已阅读并同意“服务协议”" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:0];
    [self.view addSubview:agreeLab];
    [agreeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(psdLine.mas_bottom).offset(AUTO(40));
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
    
    
    UILabel *registerLab = [UILabel initWithTitle:@"账号注册" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_002868 andBackgroundColor:JCClearColor andTextAlignment:0];
    [self.view addSubview:registerLab];
    registerLab.userInteractionEnabled = YES;
    [registerLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.loginBtn.mas_bottom).offset(AUTO(25));
        make.centerX.equalTo(self.view);
    }];
    WeakSelf;
    [registerLab bk_whenTapped:^{
        [weakSelf.navigationController pushViewController:[JCRegisterViewController new] animated:YES];
    }];
    
    [self.phoneTF.rac_textSignal subscribeNext:^(id x) {
        if (weakSelf.phoneTF.text.length > 11) {
            weakSelf.phoneTF.text = [weakSelf.phoneTF.text substringToIndex:11];
        }
    }];
    
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
    if (!self.agreeBtn.selected) {
        [JCWToastTool showHint:@"请阅读“服务协议”并点击同意"];
        return ;
    }
    
    [self.jcWindow showLoading];
    NSString *phone = [JCWAppTool getRSA_String:self.phoneTF.text];
    JCUserService_New *service = [JCUserService_New service];
    [service loginWithTel:phone code:self.codeTF.text success:^(id  _Nullable object) {
        [self.jcWindow endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
            [JCWToastTool showHint:@"登录成功"];
            //缓存userBall对象
            JCWUserBall *userBall = (JCWUserBall *)[JCWJsonTool entityWithJson:object[@"data"] class:[JCWUserBall class]];
            [JCWUserBall save:userBall];
            if (userBall.token.length>0) {
                [self getUserInfo];
            }
            return ;
        }
        [JCWToastTool showHint:object[@"msg"]];
    } failure:^(NSError * _Nonnull error) {
        [self.jcWindow endLoading];
    }];
    
}

- (void)getUserInfo {
    
    [self.jcWindow showLoading];
    JCUserService_New *service = [JCUserService_New service];
    [service getMyUserInfoWithSuccess:^(id  _Nullable object) {
        [self.jcWindow endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
            NSString *token = [JCWUserBall currentUser].token;
            //缓存userBall对象
            JCWUserBall *userBall = (JCWUserBall *)[JCWJsonTool entityWithJson:object[@"data"] class:[JCWUserBall class]];
            userBall.token = token;
            [JCWUserBall save:userBall];
            [self.navigationController popViewControllerAnimated:YES];
            NSLog(@"user_id == %@",[JCWUserBall currentUser].user_id);
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
    [[SmsManager sharedManager] getCodeWithTel:weakSelf.phoneTF.text type:SMSCodeTypeLogin isDebug:isDebug callback:^(BOOL isSucceed, NSString * _Nonnull code) {
        if (isDebug) {
            weakSelf.codeTF.text = code;
            return ;
        }
        if (isSucceed) {
            [weakSelf.codeBtn startCountDownWithSecond:60];
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
        _codeTF.keyboardType = UIKeyboardTypeNumberPad;
    }
    return _codeTF;
}

- (UIButton *)agreeBtn {
    if (!_agreeBtn) {
        _agreeBtn = [UIButton new];
        [_agreeBtn setImage:JCIMAGE(@"login_choose_nor") forState:0];
        [_agreeBtn setImage:JCIMAGE(@"login_choose_sel") forState:UIControlStateSelected];
        [_agreeBtn addTarget:self action:@selector(agreeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _agreeBtn;
}
- (UIButton *)loginBtn {
    if (!_loginBtn) {
        _loginBtn = [UIButton initWithText:@"登录" FontSize:AUTO(16) Weight:2 BackGroundColor:JCBaseColor TextColors:JCWhiteColor];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
