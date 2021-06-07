//
//  JCLoginViewController.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/11/14.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCLoginViewController.h"
#import <UMShare/UMShare.h>
#import "WXApiManager.h"
#import "ProtocolViewController.h"
#import "JCRegisterViewController.h"
#import "JCForgetPsdViewController.h"
#import "JCBindTelViewController.h"
#import "JCWXInfoModel.h"
#import "JCBaseTitleAlertView.h"

@interface JCLoginViewController ()

@property (nonatomic,strong) UITextField *phoneTF;

@property (nonatomic,strong) UITextField *psdTF;

@property (nonatomic,strong) UIButton *agreeBtn;

@property (nonatomic,strong) UIButton *loginBtn;

@property (nonatomic,strong) UIView *otherView;

@property (nonatomic,strong) UIButton *wxLoginBtn;

@property (nonatomic,strong) YYLabel *protocolLab;

@property (nonatomic,strong) NSString *oauth_id;

@end

@implementation JCLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)initSubViews {
    [self.view addSubview:self.phoneTF];
    [self.phoneTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(50));
        make.right.offset(AUTO(-80));
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
    
    [self.view addSubview:self.psdTF];
    [self.psdTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(50));
        make.right.offset(AUTO(-80));
        make.top.equalTo(phoneLine.mas_bottom).offset(AUTO(20));
        make.height.mas_equalTo(AUTO(30));
    }];
    
    UIView *psdLine = [UIView new];
    psdLine.backgroundColor = COLOR_F4F4F8;
    [self.view addSubview:psdLine];
    [psdLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(50));
        make.right.offset(AUTO(-50));
        make.top.equalTo(self.psdTF.mas_bottom).offset(AUTO(5));
        make.height.mas_equalTo(1);
    }];
    
    UIButton *secureBtn = [UIButton new];
    [secureBtn setImage:JCIMAGE(@"signin_ic_notvisible") forState:0];
    [secureBtn setImage:JCIMAGE(@"signin_ic_browse") forState:UIControlStateSelected];
    [self.view addSubview:secureBtn];
    [secureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-40));
        make.centerY.equalTo(self.psdTF);
        make.width.height.mas_equalTo(AUTO(40));
    }];
    [secureBtn addTarget:self action:@selector(secureBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
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
    
    UIView *lineView = [UIView new];
    lineView.backgroundColor = COLOR_F4F4F8;
    [self.view addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.loginBtn.mas_bottom).offset(AUTO(25));
        make.size.mas_equalTo(CGSizeMake(1, AUTO(25)));
    }];
    
    UILabel *registerLab = [UILabel initWithTitle:@"账号注册" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_002868 andBackgroundColor:JCClearColor andTextAlignment:0];
    registerLab.userInteractionEnabled = YES;
    [self.view addSubview:registerLab];
    [registerLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(lineView);
        make.right.equalTo(lineView.mas_left).offset(AUTO(-24));
        make.height.mas_equalTo(AUTO(30));
    }];
    
    UILabel *forgetPsdLab = [UILabel initWithTitle:@"忘记密码" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:0];
    forgetPsdLab.userInteractionEnabled = YES;
    [self.view addSubview:forgetPsdLab];
    [forgetPsdLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(lineView);
        make.left.equalTo(lineView.mas_right).offset(AUTO(24));
        make.height.mas_equalTo(AUTO(30));
    }];
    
    [self.view addSubview:self.otherView];
    [self.otherView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.top.equalTo(registerLab.mas_bottom).offset(AUTO(35));
        make.height.mas_equalTo(0);
    }];
    
    UILabel *otherLab = [UILabel initWithTitle:@"— 其他登录方式 —" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:0];
    [self.otherView addSubview:otherLab];
    [otherLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
        make.centerX.equalTo(self.otherView);
    }];
    
    [self.otherView addSubview:self.wxLoginBtn];
    [self.wxLoginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(otherLab.mas_bottom).offset(AUTO(25));
        make.centerX.equalTo(self.otherView);
        make.width.height.mas_equalTo(AUTO(44));
    }];
    
    [self.view addSubview:self.protocolLab];
    [self.protocolLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.otherView.mas_bottom).offset(AUTO(25));
    }];
    
        NSString *codeLoginString = @"登录即代表您同意我们的 服务协议";
        NSMutableAttributedString* atext = [[NSMutableAttributedString alloc] initWithString:codeLoginString attributes:@{NSForegroundColorAttributeName:COLOR_9F9F9F,NSFontAttributeName:[UIFont systemFontOfSize:AUTO(14)]}];
        NSRange loginRange = [codeLoginString rangeOfString:@"服务协议"];
    //    [atext yy_setFont:[UIFont systemFontOfSize:AUTO(12)] range:atext.yy_rangeOfAll];
        [atext addAttributes:@{NSForegroundColorAttributeName:COLOR_002868} range:loginRange];
        YYTextHighlight *hi = [YYTextHighlight new];
        [atext setTextHighlight:hi range:codeLoginString.rangeOfAll];

    WeakSelf;
        hi.tapAction = ^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect) {
            WebViewController *vc = [WebViewController new];
                vc.titleStr = @"用户服务条款";
                NSString *urlStr = [NSString  stringWithFormat:@"%@?dev=1",[JCConfigModel currentConfigModel].get_service];
                vc.urlStr = NonNil(urlStr);
                [weakSelf.navigationController pushViewController:vc animated:YES];
        };

    self.protocolLab.attributedText=atext;

    [registerLab bk_whenTapped:^{
        [weakSelf.navigationController pushViewController:[JCRegisterViewController new] animated:YES];
    }];
    
    [forgetPsdLab bk_whenTapped:^{
        [weakSelf.navigationController pushViewController:[JCForgetPsdViewController new] animated:YES];
    }];
    
    
    [self.phoneTF.rac_textSignal subscribeNext:^(id x) {
        if (weakSelf.phoneTF.text.length > 11) {
            weakSelf.phoneTF.text = [weakSelf.phoneTF.text substringToIndex:11];
        }
    }];
    
    
    
    if ([WXApi isWXAppInstalled]) {
        [self.otherView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(AUTO(85));
        }];
    }
    self.otherView.hidden = ![WXApi isWXAppInstalled];
    
}

#pragma mark 按钮点击
- (void)loginBtnClick {
    if (![JCWStringTool isValidateMobile:self.phoneTF.text]) {
         [JCWToastTool showHint:@"手机号码有误，请重填"];
         return ;
     }
     if ([JCWStringTool isEmptyStr:self.psdTF.text]) {
         [JCWToastTool showHint:@"请填写密码"];
         return ;
     }
    if (!self.agreeBtn.selected) {
         [JCWToastTool showHint:@"请阅读“服务协议”并点击同意"];
         return ;
     }
    [self.jcWindow showLoading];
    NSString *phone = [JCWAppTool getRSA_String:self.phoneTF.text];
    NSString *password = [JCWAppTool getRSA_String:self.psdTF.text];
    
    
    JCUserService_New *service = [JCUserService_New service];
     [service loginWithTel:phone pass:password success:^(id  _Nullable object) {
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
//         [JCWToastTool showHint:@"登录失败"];
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
            [self.navigationController popViewControllerAnimated:YES];
            NSLog(@"user_id == %@",[JCWUserBall currentUser].user_id);
            NSLog(@"user_token == %@",[JCWUserBall currentUser].token);
            [[NSNotificationCenter defaultCenter] postNotificationName:NotificationUserLogin object:nil];
            [MobClick profileSignInWithPUID:[JCWUserBall currentUser].user_id];
            
            
            //老用户微信登录,如果没有手机号,则跳转一次绑定手机页面,但是不强制绑定.oauth_id是微信登录后获取的字段
            if (userBall.user_phone.length==0&&self.oauth_id.length>0) {
                [self gotoBindWithOauth_id:self.oauth_id];//没有绑定,前往绑定页面
            }
            return ;
        }
        [JCWToastTool showHint:object[@"msg"]];
    } failure:^(NSError * _Nonnull error) {
        [self.jcWindow endLoading];
        [JCWToastTool showHint:@"获取用户信息失败"];
    }];

}

- (void)wxLoginBtnClick {
    WeakSelf;
    [JCWAppTool isUserNotificationEnable:^(BOOL isEnabled) {
        if (!isEnabled) {
            dispatch_async(dispatch_get_main_queue(), ^{
                JCBaseTitleAlertView *alertView = [JCBaseTitleAlertView new];
                [alertView alertTitle:@"" TitleColor:COLOR_2F2F2F Mesasge:@"您未开启通知权限，开启后才能进行微信登录，是否前往开启？" MessageColor:COLOR_666666 SureTitle:@"确认" SureColor:JCWhiteColor SureHandler:^{
                    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString] options:@{} completionHandler:nil];
                    [alertView removeFromSuperview];
                } CancleTitle:@"取消" CancleColor:JCBaseColor CancelHandler:^{
                   [alertView removeFromSuperview];
                }];
                alertView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
                [[UIApplication sharedApplication].keyWindow addSubview:alertView];

            });



        }else {
//            if (!weakSelf.agreeBtn.selected) {
//                 [JCWToastTool showHint:@"请阅读“服务协议”并点击同意"];
//                 return ;
//             }
            
            dispatch_async(dispatch_get_main_queue(), ^{

                [weakSelf um_wxLogin];

            });

        }
    
    }];

    
}

- (void)um_wxLogin {
    WeakSelf;
    [[UMSocialManager defaultManager] getUserInfoWithPlatform:UMSocialPlatformType_WechatSession currentViewController:nil completion:^(id result, NSError *error) {
        NSLog(@"%@-%@",result,error);
//        @strongify(self);
        if (error) {
            NSLog(@"%@",error);

        } else {
            
            UMSocialUserInfoResponse *resp = result;
            NSDictionary *originalResponse = resp.originalResponse;
            
            // 授权信息
            NSLog(@"字典%@",resp.yy_modelToJSONObject);
           
            JCWXInfoModel *model = (JCWXInfoModel *)[JCWJsonTool entityWithJson:originalResponse class:[JCWXInfoModel class]];
            JCUserService_New *service = [JCUserService_New new];
            [service wxLoginWithParam:model.yy_modelToJSONObject success:^(id  _Nullable object) {
                if ([JCWJsonTool isSuccessResponse:object]) {
                    //缓存userBall对象
                    JCWUserBall *userBall = (JCWUserBall *)[JCWJsonTool entityWithJson:object[@"data"] class:[JCWUserBall class]];
                    [JCWUserBall save:userBall];
                    NSString *oauth_id = [NSString stringWithFormat:@"%@",object[@"data"][@"oauth_id"]];
                    weakSelf.oauth_id = oauth_id;
                    if (userBall.token.length==0) {
                        //没有token,说明没有用户,需要绑定手机
                        if (userBall.user_phone.length==0) {
                            [weakSelf gotoBindWithOauth_id:oauth_id];//没有绑定,前往绑定页面
                        }
                    }else{

                        
                        [weakSelf getUserInfo];//有绑定手机,去获取用户信息
                    }

        
                }else {
                    [JCWToastTool showHint:object[@"msg"]];
                }
            } failure:^(NSError * _Nonnull error) {
                
            }];


        }
    }];

}


- (void)gotoBindWithOauth_id:(NSString *)oauth_id {
    //否则跳转手机绑定页
    JCBindTelViewController * bindVC = [JCBindTelViewController new];
    bindVC.oauth_id = oauth_id;
     [JCWToastTool showHint:@"您的账号尚未绑定手机号, 请先绑定"];
    [self.navigationController pushViewController:bindVC animated:YES];
    WeakSelf;
    bindVC.bindTelBlock = ^(BOOL isBind) {
        //[JCWUserBall currentUser].token.length==0 表示是新用户,且没有绑定手机
        if (!isBind&&[JCWUserBall currentUser].token.length==0) {
            [JCWUserBall logOut];
        } else {
            [weakSelf getUserInfo];

        }
    };
}



- (void)secureBtnClick:(UIButton *)sender {
    sender.selected = !sender.selected;
    self.psdTF.secureTextEntry = !sender.selected;
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

- (UITextField *)psdTF {
    if (!_psdTF) {
        _psdTF = [UITextField new];
        _psdTF.placeholder = @"请输入登录密码";
        _psdTF.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(16)];
        _psdTF.secureTextEntry = YES;
    }
    return _psdTF;
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

- (UIView *)otherView {
    if (!_otherView) {
        _otherView = [UIView new];
    }
    return _otherView;
}

- (UIButton *)wxLoginBtn {
    if (!_wxLoginBtn) {
        _wxLoginBtn = [UIButton new];
        [_wxLoginBtn setImage:JCIMAGE(@"wechat") forState:0];
        [_wxLoginBtn setImage:JCIMAGE(@"wechat") forState:UIControlStateHighlighted];
        [_wxLoginBtn addTarget:self action:@selector(wxLoginBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _wxLoginBtn;
}

- (YYLabel *)protocolLab {
    if (!_protocolLab) {
        _protocolLab = [YYLabel new];
        _protocolLab.textColor = COLOR_999999;
        _protocolLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(12)];

    }
    return _protocolLab;
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
