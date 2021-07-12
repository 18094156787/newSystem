//
//  JCPostCheckFailVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/11/3.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCPostCheckFailVC.h"
#import "JCPostCheckRuleVC.h"
#import "JCPostCheckUserInfoVC.h"
#import "JCPostCheckUserInfo_Invite_VC.h"
@interface JCPostCheckFailVC ()

@end

@implementation JCPostCheckFailVC

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
    // Do any additional setup after loading the view.

    self.title = @"申请签约";
    [self initView];
    [self getUserInfo];
}
//审核被拒,重置审核状态
- (void)resetCheckStatus {
//    changeMyCheckStatusWithsuccess
    if ([[JCWUserBall currentUser].fabu intValue]!=4) {
        return;
    }
    [self.view showLoading];
    JCUserService_New *service = [JCUserService_New new];
    [service changeMyCheckStatusWithsuccess:^(id  _Nullable object) {
        [self.view endLoading];
         if ([JCWJsonTool isSuccessResponse:object]) {
             JCWUserBall *user =  [JCWUserBall currentUser];
//             user.fabu = @"0";
             [JCWUserBall save:user];
             JCPostCheckRuleVC *vc = [JCPostCheckRuleVC new];
             [self.navigationController pushViewController:vc animated:YES];
         }
    } failure:^(NSError * _Nonnull error) {
        [self.view endLoading];
    }];
}

- (void)initView {
    UIView *colorView = [UIView new];
    [self.view addSubview:colorView];
    colorView.backgroundColor  = COLOR_F0F0F0;
    [colorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
        make.height.mas_equalTo(AUTO(8));
    }];
    
    
    UIImageView *imgView = [UIImageView new];

    [self.view addSubview:imgView];
    [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(48));
        make.centerX.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(AUTO(180), AUTO(180)));
    }];
    self.imgView = imgView;
    
    UILabel *titleLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    titleLab.numberOfLines = 0;
    [self.view addSubview:titleLab];
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imgView.mas_bottom).offset(AUTO(30));
        make.centerX.equalTo(self.view);
        make.left.right.offset(0);
    }];
    self.titleLab = titleLab;
    
    //拒绝或退回信息
    UILabel *infLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    infLab.numberOfLines = 0;
    [self.view addSubview:infLab];
    [infLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleLab.mas_bottom).offset(AUTO(10));
        make.centerX.equalTo(self.view);
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
    }];
    self.infLab = infLab;
    

    [self.view addSubview:self.editBtn];
    [self.editBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(infLab.mas_bottom).offset(AUTO(60));
        make.size.mas_equalTo(CGSizeMake(AUTO(275), AUTO(44)));
    }];
    
    [self.view addSubview:self.backBtn];
    [self.backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.editBtn.mas_bottom).offset(AUTO(24));
        make.size.mas_equalTo(CGSizeMake(AUTO(275), AUTO(44)));
    }];
    
    WeakSelf;
    
    [self.editBtn bk_whenTapped:^{
 
//        NSLog(@"审核状态%@",user.fabu);
        if ([[JCWUserBall currentUser].fabu integerValue]==4) {
            //重新申请

            [weakSelf resetCheckStatus];
        }
        if ([[JCWUserBall currentUser].fabu integerValue]==5) {
            //被拒,重新编辑
            if ([[JCWUserBall currentUser].is_be_invited intValue]==1) {
                JCPostCheckUserInfo_Invite_VC *vc = [JCPostCheckUserInfo_Invite_VC new];
                [weakSelf.navigationController pushViewController:vc animated:YES];
                 return;

            }
            JCPostCheckUserInfoVC *vc = [JCPostCheckUserInfoVC new];
            [weakSelf.navigationController pushViewController:vc animated:YES];
        }
    }];
    

    [self.backBtn bk_whenTapped:^{
        [weakSelf.navigationController popViewControllerAnimated:YES];
    }];
//    JCWUserBall *user = [JCWUserBall currentUser];
    

    

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
            if ([[JCWUserBall currentUser].fabu integerValue]==4) {
                self.imgView.image = JCIMAGE(@"jc_contract_refuse");
                //被拒绝
                self.titleLab.text = @"很遗憾，您的申请已被退回3次，该申请已被拒绝\n您可以在研究拒绝理由和作者规则后，\n重新发起签约申请~";
                NSString *refuseString = [NSString stringWithFormat:@"拒绝理由：%@",[JCWUserBall currentUser].fail_desc];
                NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:refuseString];
                NSRange range = [refuseString rangeOfString:@"拒绝理由："];
                [attr addAttributes:@{NSForegroundColorAttributeName:COLOR_9F9F9F} range:range];
                self.infLab.attributedText = attr;
                
                
                self.backBtn.hidden = NO;
                self.editBtn.hidden = NO;
                [self.editBtn setTitle:@"重新申请" forState:0];
                
            }
            
            if ([[JCWUserBall currentUser].fabu integerValue]==5) {
                self.imgView.image = JCIMAGE(@"jc_contract_return");
                //被退回
                NSString *count = NonNil([JCWUserBall currentUser].remaining_times);//可修改次数
                NSString *editString = [NSString stringWithFormat:@"您的方案被退回了，您可以在修改完成后重新提交\n您还有%@次修改机会",count];
                NSMutableAttributedString *edit_attr = [[NSMutableAttributedString alloc] initWithString:editString];
                NSRange edit_range = [editString rangeOfString:count];
                [edit_attr addAttributes:@{NSForegroundColorAttributeName:JCBaseColor} range:edit_range];
                self.titleLab.attributedText = edit_attr;
                //拒绝理由
                NSString *refuseString = [NSString stringWithFormat:@"拒绝理由：%@",[JCWUserBall currentUser].fail_desc];
                NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:refuseString];
                NSRange range = [refuseString rangeOfString:@"拒绝理由："];
                [attr addAttributes:@{NSForegroundColorAttributeName:COLOR_9F9F9F} range:range];
                self.infLab.attributedText = attr;
                
                [self.editBtn setTitle:@"去修改" forState:0];
                
                self.backBtn.hidden = YES;
                self.editBtn.hidden = NO;

                
            }


        }else {
            [JCWToastTool showHint:object[@"msg"]];
        }
        
    } failure:^(NSError * _Nonnull error) {
        [self.jcWindow endLoading];
        [JCWToastTool showHint:@"获取用户信息失败"];
    }];

}

- (UIButton *)editBtn {
    if (!_editBtn) {
        _editBtn = [UIButton initWithText:@"" FontSize:AUTO(16) Weight:2 BackGroundColor:JCBaseColor TextColors:JCWhiteColor];
        _editBtn.layer.cornerRadius = AUTO(22);
        _editBtn.layer.masksToBounds = YES;
        _editBtn.hidden = YES;
    }
    return _editBtn;
}

- (UIButton *)backBtn {
    if (!_backBtn) {
        _backBtn = [UIButton initWithText:@"返回" FontSize:AUTO(16) Weight:2 BackGroundColor:JCClearColor TextColors:COLOR_9F9F9F];
        _backBtn.layer.borderColor = COLOR_CCCCCC.CGColor;
        _backBtn.layer.borderWidth = 1;
        _backBtn.layer.cornerRadius = AUTO(22);
        _backBtn.layer.masksToBounds = YES;
        _backBtn.hidden = YES;
    }
    return _backBtn;
}
@end
