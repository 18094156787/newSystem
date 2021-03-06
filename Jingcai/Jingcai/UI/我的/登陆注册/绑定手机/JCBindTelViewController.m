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
#import "JCImageCodeModel.h"
@interface JCBindTelViewController ()

@property (nonatomic,strong) UITextField *phoneTF;

@property (nonatomic,strong) UITextField *imageCodeTF;

@property (nonatomic,strong) UIImageView *imageCodeView;

@property (nonatomic,strong) UITextField *codeTF;

@property (nonatomic,strong) UITextField *passwordTF;

@property (nonatomic,strong) JKCountDownButton *codeBtn;

@property (nonatomic,strong) UIButton *agreeBtn;

@property (nonatomic,strong) UIButton *loginBtn;

@property (nonatomic,strong) JCImageCodeModel *imageModel;

@property (nonatomic,strong) YYLabel *agreeLab;

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
        make.height.mas_equalTo(AUTO(45));
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
    
    [self.view addSubview:self.imageCodeTF];
    [self.imageCodeTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(50));
        make.right.offset(AUTO(-120));
        make.top.equalTo(phoneLine.mas_bottom).offset(AUTO(5));
        make.height.mas_equalTo(AUTO(45));
    }];
    
    [self.view addSubview:self.imageCodeView];
    [self.imageCodeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-50));
        make.centerY.equalTo(self.imageCodeTF);
        make.height.mas_equalTo(AUTO(45));
        make.width.mas_equalTo(AUTO(90));
    }];
    
    UIView *imageCodeLine = [UIView new];
    imageCodeLine.backgroundColor = COLOR_F4F4F8;
    [self.view addSubview:imageCodeLine];
    [imageCodeLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(50));
        make.right.offset(AUTO(-50));
        make.top.equalTo(self.imageCodeTF.mas_bottom).offset(AUTO(5));
        make.height.mas_equalTo(1);
    }];

    [self.view addSubview:self.codeTF];
    [self.codeTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(50));
        make.right.offset(AUTO(-120));
        make.top.equalTo(imageCodeLine.mas_bottom).offset(AUTO(5));
        make.height.mas_equalTo(AUTO(45));
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
        make.top.equalTo(psdLine.mas_bottom).offset(AUTO(5));
        make.height.mas_equalTo(AUTO(45));
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
 


    [self.view addSubview:self.agreeLab];
    [self.agreeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view).offset(AUTO(10));
        make.top.equalTo(passwordLine.mas_bottom).offset(AUTO(40));
    }];

    [self.view addSubview:self.agreeBtn];
    [self.agreeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.agreeLab);
        make.right.equalTo(self.agreeLab.mas_left);
        make.width.height.mas_equalTo(AUTO(30));
    }];

    [self.view addSubview:self.loginBtn];
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.agreeLab.mas_bottom).offset(AUTO(20));
        make.left.offset(AUTO(50));
        make.right.offset(AUTO(-50));
        make.height.mas_equalTo(AUTO(44));
    }];
    
    NSString *codeLoginString = @"我已阅读并同意《用户服务条款》和《隐私协议》";
    NSMutableAttributedString* atext = [[NSMutableAttributedString alloc] initWithString:codeLoginString attributes:@{NSForegroundColorAttributeName:COLOR_9F9F9F,NSFontAttributeName:[UIFont systemFontOfSize:AUTO(14)]}];
    NSRange serviceRange = [codeLoginString rangeOfString:@"《用户服务条款》"];
NSRange privacyRange = [codeLoginString rangeOfString:@"《隐私协议》"];
//    [atext yy_setFont:[UIFont systemFontOfSize:AUTO(12)] range:atext.yy_rangeOfAll];
    [atext addAttributes:@{NSForegroundColorAttributeName:COLOR_002868} range:serviceRange];
    [atext addAttributes:@{NSForegroundColorAttributeName:COLOR_002868} range:privacyRange];

    YYTextHighlight *hi = [YYTextHighlight new];
    [atext setTextHighlight:hi range:serviceRange];

    YYTextHighlight *privacy_hi = [YYTextHighlight new];
    [atext setTextHighlight:privacy_hi range:privacyRange];

    WeakSelf;
    hi.tapAction = ^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect) {
        WebViewController *vc = [WebViewController new];
            vc.titleStr = @"用户服务条款";
            NSString *urlStr = [NSString  stringWithFormat:@"%@?dev=1",[JCConfigModel currentConfigModel].get_service];
            vc.urlStr = NonNil(urlStr);
            [weakSelf.navigationController pushViewController:vc animated:YES];
    };

    privacy_hi.tapAction = ^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect) {
        WebViewController *vc = [WebViewController new];
            vc.titleStr = @"隐私协议";
            NSString *urlStr = [NSString  stringWithFormat:@"%@?dev=1",[JCConfigModel currentConfigModel].get_privacy];
            vc.urlStr = NonNil(urlStr);
            [weakSelf.navigationController pushViewController:vc animated:YES];
    };

    self.agreeLab.attributedText=atext;
    
    

    [self.imageCodeView bk_whenTapped:^{
        self.imageCodeView.userInteractionEnabled = NO;
        [weakSelf getImageCode];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.imageCodeView.userInteractionEnabled = YES;
        });
    }];
    
    [self getImageCode];
    
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
    if (self.imageCodeTF.text.length==0) {
        [JCWToastTool showHint:@"请输入图形验证码再获取短信验证码"];
        return;
    }
    if (self.imageCodeTF.text.length<4) {
        [JCWToastTool showHint:@"图形验证码错误，请重新输入！"];
        return;
    }

    if (!self.agreeBtn.selected) {
        [JCWToastTool showHint:@"请阅读《用户服务条款》和《隐私协议》并点击同意"];
        return ;
    }

    if (self.phoneHadBeenUser) {
        JCBaseTitleAlertView *alertView = [JCBaseTitleAlertView new];
        [alertView alertTitle:@"手机绑定" TitleColor:COLOR_2F2F2F Mesasge:@"" MessageColor:COLOR_666666 SureTitle:@"确认绑定" SureColor:JCWhiteColor SureHandler:^{

            [self finalSubmit];
            [alertView removeFromSuperview];
        } CancleTitle:@"取消" CancleColor:JCBaseColor CancelHandler:^{
           [alertView removeFromSuperview];
        }];
        NSString *title = @"注意：该手机号码将被强制绑定，以后使用该手机号登录将使用微信号的账号信息。\n如有疑问，请联系客服人员！";
        NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:title];
        NSRange range = [title rangeOfString:@"注意：该手机号码将被强制绑定"];
        [attr addAttributes:@{NSForegroundColorAttributeName:JCBaseColor} range:range];
        alertView.contentLab.attributedText = attr;
        alertView.contentLab.textAlignment = 0;
        alertView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        [[UIApplication sharedApplication].keyWindow addSubview:alertView];
        
    }else{
        [self finalSubmit];
    }



}
#pragma mark 最后一步提交注册
- (void)finalSubmit {
    NSString *phone = [JCWAppTool getRSA_String:self.phoneTF.text];
    NSString *password = [JCWAppTool getRSA_String:self.passwordTF.text];
    
    JCUserService_New * service = [JCUserService_New service];
    [service bindTel:phone code:self.codeTF.text pass:password oauth_id:self.oauth_id img_id:self.imageModel.id img_code:self.imageCodeTF.text success:^(id  _Nullable object) {
        if ([JCWJsonTool isSuccessResponse:object]) {
            JCWUserBall *userBall = (JCWUserBall *)[JCWJsonTool entityWithJson:object[@"data"] class:[JCWUserBall class]];
            [JCWUserBall save:userBall];
            if (self.bindTelBlock) {
                if (userBall.user_phone.length>0) {
                    [JCWToastTool showHint:@"绑定成功"];
                    [self getUserInfo];

                }
                
            }
            return ;
        }else{
           [JCWToastTool showHint:object[@"msg"]];
        }
        
    } failure:^(NSError * _Nonnull error) {
        [JCWToastTool showHint:@"绑定失败"];
    }];
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
    [self.view endEditing:YES];
    if (![JCWStringTool isValidateMobile:self.phoneTF.text]) {
        [JCWToastTool showHint:@"手机号码有误，请重填"];
        return ;
    }
    if (self.imageCodeTF.text.length==0) {
        [JCWToastTool showHint:@"请输入图形验证码再获取短信验证码"];
        return;
    }
    if (self.imageCodeTF.text.length<4) {
        [JCWToastTool showHint:@"图形验证码错误，请重新输入！"];
        return;
    }

    [self checkPhone];
    
}


//检测该手机号是否已是注册
- (void)checkPhone {
    self.phoneHadBeenUser = NO;
    NSString *phone = [JCWAppTool getRSA_String:self.phoneTF.text];
    JCUserService_New *service = [JCUserService_New service];
    [service getCheckThePhoneHadBeenBindWithMobile:phone oauth_id:self.oauth_id Success:^(id  _Nullable object) {
        if ([JCWJsonTool isSuccessResponse:object]) {
            NSString *status = object[@"data"][@"status"];
            if ([status integerValue]==200) {
                self.phoneHadBeenUser = NO;
                [self checkImgCode];
            }else if ([status integerValue]==201) {
                self.phoneHadBeenUser = YES;
                JCBaseTitleAlertView *alertView = [JCBaseTitleAlertView new];
                [alertView alertTitle:@"提示" TitleColor:COLOR_2F2F2F Mesasge:@"" MessageColor:COLOR_666666 SureTitle:@"强制绑定" SureColor:JCWhiteColor SureHandler:^{
                    [self checkImgCode];
                    [alertView removeFromSuperview];
                } CancleTitle:@"取消绑定" CancleColor:JCBaseColor CancelHandler:^{
                   [alertView removeFromSuperview];
                }];
                NSString *title = @"此手机号已被绑定或者已创建账号！是否强制绑定该手机号？强制绑定后该手机号关联的账号将被注销，以后用该手机号登录将使用微信号的账号信息。\n如有疑问，请联系客服人员！";
                NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:title];
                NSRange range = [title rangeOfString:@"强制绑定后该手机号关联的账号将被注销，"];
                [attr addAttributes:@{NSForegroundColorAttributeName:JCBaseColor} range:range];
                alertView.contentLab.attributedText = attr;
                alertView.contentLab.textAlignment = 0;
                alertView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
                [[UIApplication sharedApplication].keyWindow addSubview:alertView];
            }
            else{
                [JCWToastTool showHint:object[@"msg"]];
            }

  
        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

        
    } failure:^(NSError * _Nonnull error) {
        [JCWToastTool showHint:@"网络异常"];
    }];


}

//校验图像验证码
- (void)checkImgCode {
    
    JCUserService_New *service = [JCUserService_New service];
    [service getCheckImageCodeWithID:self.imageModel.id img_code:self.imageCodeTF.text Success:^(id  _Nullable object) {
        if ([JCWJsonTool isSuccessResponse:object]) {
            NSString *status = object[@"data"][@"status"];
            if ([status integerValue]==1) {
                [self postsmsCode];
            }else{
                [JCWToastTool showHint:@"图形验证码错误，请重新输入！"];
            }

  
        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }
    } failure:^(NSError * _Nonnull error) {
        [JCWToastTool showHint:@"网络异常"];

    }];
}

- (void)postsmsCode {
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


//获取图形验证码
- (void)getImageCode {

    JCUserService_New *service = [JCUserService_New service];
    [service getImageCodeWithSuccess:^(id  _Nullable object) {
        if ([JCWJsonTool isSuccessResponse:object]) {

 
            //缓存userBall对象
            self.imageModel = (JCImageCodeModel *)[JCWJsonTool entityWithJson:object[@"data"] class:[JCImageCodeModel class]];
            NSArray *imageArray = [self.imageModel.img componentsSeparatedByString:@"base64,"];
            
            if (imageArray.count>1) {
                NSString *str = imageArray[1];
                NSData * imageData =[[NSData alloc] initWithBase64EncodedString:str options:0];
                UIImage *photo = [UIImage imageWithData:imageData];
                self.imageCodeView.image = photo;
            }
  
        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        [JCWToastTool showHint:@"获取图形验证码失败"];
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

- (UITextField *)imageCodeTF {
    if (!_imageCodeTF) {
        _imageCodeTF = [UITextField new];
        _imageCodeTF.placeholder = @"输入图形验证码";
        _imageCodeTF.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(16)];
    }
    return _imageCodeTF;
}

- (UIImageView *)imageCodeView {
    if (!_imageCodeView) {
        _imageCodeView = [UIImageView new];
        _imageCodeView.userInteractionEnabled = YES;
    }
    return _imageCodeView;
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

- (YYLabel *)agreeLab {
    if (!_agreeLab) {
        _agreeLab = [YYLabel new];
        _agreeLab.textColor = COLOR_9F9F9F;
        _agreeLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(12)];

    }
    return _agreeLab;
}
@end
