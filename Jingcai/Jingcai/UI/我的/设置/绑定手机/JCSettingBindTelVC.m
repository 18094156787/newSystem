//
//  JCSettingBindTelVC.m
//  Jingcai
//
//  Created by Rain on 2018/11/14.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "JCSettingBindTelVC.h"
#import "JCWJsonTool.h"
#import "JCWUserBall.h"
#import "JCWToastTool.h"
#import "JCWStringTool.h"
#import "JCMonitorTextField.h"
#import "TTTAttributedLabel.h"
#import "JCContactUsVC.h"
#import "JCGetCodeTextField.h"
#import "SmsManager.h"

@interface JCSettingBindTelVC () <TTTAttributedLabelDelegate>
@property (weak, nonatomic) IBOutlet JCGetCodeTextField *mobileTextField;
@property (weak, nonatomic) IBOutlet JCMonitorTextField *codeTextField;
@property (weak, nonatomic) IBOutlet UIButton *bindButton;
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet TTTAttributedLabel *bottomLabel;
@end

@implementation JCSettingBindTelVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"绑定手机";
    self.view.backgroundColor = COLOR_F0F0F0;
    self.bindButton.backgroundColor = JCBaseColor;
    WeakSelf;
    _mobileTextField.buttonStyle = GetCodeButtonStyleRed;
    _mobileTextField.getCodeClickBlock = ^{
        BOOL isDebug = NO;
        //[JCWSettingBall currentSetting].isSmsDebugOn;
        [[SmsManager sharedManager] getCodeWithTel:weakSelf.mobileTextField.text type:SMSCodeTypeBind isDebug:isDebug callback:^(BOOL isSucceed, NSString * _Nonnull code) {
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
//        weakSelf.bindButton.selected = !isEmpty;
//    };
    
    _bottomLabel.textAlignment = NSTextAlignmentCenter;
    _bottomLabel.delegate = self;
    NSAttributedString *attString = [[NSAttributedString alloc] initWithString:@""
                                                                    attributes:@{
                                                                                 NSForegroundColorAttributeName:(id)UIColorFromRGB(0x333333).CGColor,
                                                                                 NSFontAttributeName:[UIFont systemFontOfSize:12.f]}];
    _bottomLabel.text = attString;
    _bottomLabel.linkAttributes = @{NSForegroundColorAttributeName:(id)UIColorFromRGB(0xED0F0F).CGColor};
    NSRange range = [_bottomLabel.text rangeOfString:@"客服"];
    [_bottomLabel addLinkToURL:[NSURL URLWithString:@""] withRange:range];
    [_bottomView addSubview:_bottomLabel];
}

#pragma mark - TTTAttributedLabelDelegate
- (void)attributedLabel:(TTTAttributedLabel *)label didSelectLinkWithURL:(NSURL *)url {
    //NSLog(@"点击了link.");
    [self.navigationController pushViewController:[JCContactUsVC new] animated:YES];
}



- (IBAction)bindBtnClick:(UIButton *)sender {
    WeakSelf;
    if (self.mobileTextField.text.length==0) {
        [JCWToastTool showHint:@"请输入手机号"];
        return;
    }
    if (self.codeTextField.text.length==0) {
        [JCWToastTool showHint:@"请输入验证码"];
        return;
    }
    
    [self.view showLoading];
    NSString *phone = [JCWAppTool getRSA_String:self.mobileTextField.text];
    JCUserService_New * service = [JCUserService_New service];
    [service updateUserInfoWithType:@"3" value:phone code:self.codeTextField.text success:^(id  _Nullable object) {
        [self.view endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
            //更新user
            JCWUserBall * userBall = [JCWUserBall currentUser];
            userBall.user_phone = self.mobileTextField.text;
            [JCWUserBall save:userBall];

            [[NSNotificationCenter defaultCenter] postNotificationName:NotificationNameUserChange object:nil];
            [weakSelf.navigationController popToRootViewControllerAnimated:YES];
            
        }else{
             [JCWToastTool showHint:object[@"msg"]];
        }
    } failure:^(NSError * _Nonnull error) {
        [self.view endLoading];
    }];

}

@end
