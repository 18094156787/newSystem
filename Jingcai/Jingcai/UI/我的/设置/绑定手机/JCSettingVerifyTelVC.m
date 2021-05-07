//
//  JCSettingVerifyTelVC.m
//  Jingcai
//
//  Created by Rain on 2018/10/11.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "JCSettingVerifyTelVC.h"
#import "TTTAttributedLabel.h"
#import "JCWCacheTool.h"
#import "JCWJsonTool.h"
#import "JCWStringTool.h"
#import "JCWUserBall.h"
#import "JCSettingBindTelVC.h"
#import "JCWToastTool.h"
#import "JCMonitorTextField.h"
#import "JCContactUsVC.h"
#import "JCGetCodeTextField.h"
#import "SmsManager.h"

@interface JCSettingVerifyTelVC () <TTTAttributedLabelDelegate,UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet JCGetCodeTextField *mobileTextField;
@property (weak, nonatomic) IBOutlet JCMonitorTextField *codeTextField;
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet UIButton *verifyButton;
@property (weak, nonatomic) IBOutlet TTTAttributedLabel *bottomLabel;
@end

@implementation JCSettingVerifyTelVC

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
    self.navigationItem.title = @"换绑手机";
    self.verifyButton.backgroundColor = JCBaseColor;
    [self.verifyButton setTitleColor:JCWhiteColor forState:0];
//    [self.verifyButton setTitleColor:JCBaseColor forState:UIControlStateDisabled];
    WeakSelf;
    JCWUserBall * userBall = [JCWUserBall currentUser];
    _mobileTextField.text = userBall.secTel;
    _mobileTextField.delegate = self;
//    _mobileTextField.userInteractionEnabled = no
//    _mobileTextField.disableEdit = YES;
//    _mobileTextField.userInteractionEnabled = NO;
    _mobileTextField.buttonStyle = GetCodeButtonStyleRed;
    _mobileTextField.getCodeClickBlock = ^{
        BOOL isDebug = NO;
        [[SmsManager sharedManager] getCodeWithTel:userBall.user_phone type:SMSCodeTypeCheckOldBind isDebug:isDebug callback:^(BOOL isSucceed, NSString * _Nonnull code) {
            if (isDebug) {
                weakSelf.codeTextField.text = code;
                return ;
            }
            if (isSucceed) {
                [weakSelf.mobileTextField startCountDown];
            }else{
                weakSelf.mobileTextField.getCodeButton.enabled = YES;
            }
        }];
    };
    
//    _codeTextField.monitorTextBlock = ^(BOOL isEmpty) {
//        weakSelf.verifyButton.selected = !isEmpty;
//    };
    
    _bottomLabel.textAlignment = NSTextAlignmentCenter;
    _bottomLabel.delegate = self;//若当前号码已不用或丢失，请联系客服申诉
    NSAttributedString *attString = [[NSAttributedString alloc] initWithString:@""
                                                                    attributes:@{
                                                                                 NSForegroundColorAttributeName:(id)UIColorFromRGB(0x333333).CGColor,
                                                                                 NSFontAttributeName:[UIFont systemFontOfSize:12.f]}];
  
    _bottomLabel.text = attString;
    _bottomLabel.linkAttributes = @{NSForegroundColorAttributeName:(id)UIColorFromRGB(0xED0F0F).CGColor};
//    NSRange range = [_bottomLabel.text rangeOfString:@"客服"];
//    [_bottomLabel addLinkToURL:[NSURL URLWithString:@""] withRange:range];
//    _bottomLabel.text = @"";
//    [_bottomView addSubview:_bottomLabel];
}

#pragma mark - TTTAttributedLabelDelegate
- (void)attributedLabel:(TTTAttributedLabel *)label didSelectLinkWithURL:(NSURL *)url {
    //NSLog(@"点击了link.");
    [self.navigationController pushViewController:[JCContactUsVC new] animated:YES];
}

- (IBAction)verifyBtnClick:(UIButton *)sender {
    WeakSelf;
//       [self.navigationController pushViewController:[JCSettingBindTelVC new] animated:YES];
    if (self.codeTextField.text.length==0) {
        [JCWToastTool showHint:@"请输入验证码"];
        return;
    }
    JCWUserBall * userBall = [JCWUserBall currentUser];
    JCUserService_New * service = [JCUserService_New service];
    NSString *phone = [JCWAppTool getRSA_String:userBall.user_phone];
    [service VerifyPhone:phone code:self.codeTextField.text success:^(id  _Nullable object) {
        if ([JCWJsonTool isSuccessResponse:object]) {
            //[JCWToastTool showHint:@"验证成功"];
            [weakSelf.navigationController pushViewController:[JCSettingBindTelVC new] animated:YES];
            return ;
        }
        [JCWToastTool showHint:object[@"msg"]];
    } failure:^(NSError * _Nonnull error) {
        [JCWToastTool showHint:@"验证失败"];
    }];
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    return NO;
}
@end
