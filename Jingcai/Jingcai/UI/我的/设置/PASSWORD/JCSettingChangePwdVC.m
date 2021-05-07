//
//  JCSettingChangePwdVC.m
//  Jingcai
//
//  Created by Rain on 2018/10/11.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "JCSettingChangePwdVC.h"
#import "JCWJsonTool.h"
#import "JCWToastTool.h"
#import "JCForgetPsdViewController.h"

@interface JCSettingChangePwdVC ()
@property (weak, nonatomic) IBOutlet UITextField *oldPassTextField;
@property (weak, nonatomic) IBOutlet UITextField *nPassTextField;
@property (weak, nonatomic) IBOutlet UITextField *nPassTTextField;
@property (nonatomic,strong) UILabel *forgetLab;
@end

@implementation JCSettingChangePwdVC
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
    self.navigationItem.title = @"修改密码";
    self.view.backgroundColor = COLOR_F0F0F0;
    _oldPassTextField.secureTextEntry = YES;
    _nPassTextField.secureTextEntry = YES;
    _nPassTTextField.secureTextEntry = YES;
    [self.view addSubview:self.forgetLab];
    [self.forgetLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nPassTTextField.mas_bottom).offset(10);
        make.right.equalTo(self.nPassTTextField);
        make.size.mas_equalTo(CGSizeMake(AUTO(100), AUTO(30)));
    }];
    WeakSelf;
    [self.forgetLab bk_whenTapped:^{
        JCForgetPsdViewController *vc = [JCForgetPsdViewController new];
        [weakSelf.navigationController pushViewController:vc animated:YES];
    }];
}

- (IBAction)commitBtnClick:(UIButton *)sender {
    WeakSelf;
    if (self.oldPassTextField.text.length==0) {
        [JCWToastTool showHint:@"请输入旧密码"];
        return;
    }
    if (![self.nPassTextField.text isEqualToString:self.nPassTTextField.text]) {
        [JCWToastTool showHint:@"两次密码不一致"];
        return;
    }
    [self.view showLoading];
    NSString *oldPass = [JCWAppTool getRSA_String:self.oldPassTextField.text];
    NSString *nPassText = [JCWAppTool getRSA_String:self.nPassTextField.text];
    NSString *nPassTText = [JCWAppTool getRSA_String:self.nPassTTextField.text];
    JCUserService_New * service = [JCUserService_New service];
    [service changePwdWithOldPass:oldPass newPass:nPassText newPassT:nPassTText success:^(id  _Nullable object) {
        [self.view endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
            [JCWToastTool showHint:@"修改成功"];
            [weakSelf.navigationController popViewControllerAnimated:YES];
            return ;
        }
        [JCWToastTool showHint:object[@"msg"]];
    } failure:^(NSError * _Nonnull error) {
        [JCWToastTool showHint:@"修改失败"];
        [self.view endLoading];
    }];
}
- (UILabel *)forgetLab {
    if (!_forgetLab) {
        _forgetLab = [UILabel initWithTitle:@"忘记密码？" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentRight];
        _forgetLab.userInteractionEnabled = YES;
    }
    return _forgetLab;
}
@end
