//
//  JCMyIntroduceVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/11/6.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCMyIntroduceVC.h"
#import "UITextView+Placeholder.h"
@interface JCMyIntroduceVC ()

@property (nonatomic,strong) UITextView *contentTV;//正文

@property (nonatomic,strong) UILabel *countLab;

@property (nonatomic,strong) UIButton *submitBtn;

@end

@implementation JCMyIntroduceVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"个人简介";
    [self initViews];
    [self getCheckInfo];
}
- (void)initViews {
    self.view.backgroundColor = COLOR_F0F0F0;
    UIView *topView = [UIView new];
    topView.backgroundColor = JCWhiteColor;
    [self.view addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.offset(AUTO(8));
        make.height.mas_equalTo(170);
    }];
    [topView addSubview:self.contentTV];
    [self.contentTV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(10));
        make.top.offset(AUTO(8));
        make.right.offset(AUTO(-10));
        make.bottom.offset(AUTO(-50));
    }];
    
    [topView addSubview:self.countLab];
    [self.countLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-10));
        make.bottom.offset(AUTO(-16));
    }];
    
    UIView *bottomView = [UIView new];
    bottomView.backgroundColor = JCWhiteColor;
    [self.view addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(topView.mas_bottom).offset(AUTO(8));
        make.height.mas_equalTo(200);
    }];
    
    UIView *iconView = [UIView new];
    iconView.backgroundColor = JCBaseColor;
    [bottomView addSubview:iconView];
    [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.offset(AUTO(12));
        make.size.mas_equalTo(CGSizeMake(2, 16));
    }];

    UILabel *label = [UILabel initWithTitle:@"简介内容规则" andFont:AUTO(16) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    [bottomView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(iconView.mas_right).offset(AUTO(10));
        make.centerY.equalTo(iconView);
        make.height.mas_equalTo(16);
    }];
    
    UILabel *infoLab = [UILabel initWithTitle:@"1、签约用户才可编辑个人简介并对外显示\n2、简介中不可含有明显的导流到微信、公众号等明显信息，否则将不予通过\n3、简介信息应该遵循国家法律法规，严禁带有诋毁国家政治体制、违背公序良俗等违法信息内容。违者将追究法律责任" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    infoLab.numberOfLines = 0;
    [bottomView addSubview:infoLab];
    [infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.equalTo(iconView.mas_bottom).offset(AUTO(10));
        make.right.offset(AUTO(-15));
    }];
    
    [self.view addSubview:self.submitBtn];
    [self.submitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bottomView.mas_bottom).offset(AUTO(30));
        make.left.offset(AUTO(50));
        make.right.offset(AUTO(-50));
        make.height.mas_equalTo(AUTO(44));
    }];
    
    WeakSelf;
    [self.contentTV.rac_textSignal subscribeNext:^(id x) {
        if (weakSelf.contentTV.text.length > 100) {
            weakSelf.contentTV.text = [ weakSelf.contentTV.text substringToIndex:100];
        }

        weakSelf.countLab.text = [NSString stringWithFormat:@"%ld/100",weakSelf.contentTV.text.length];
    }];
    
    [self.submitBtn bk_whenTapped:^{
        [weakSelf submitBtnClick];
    }];
}
//获取达人审核信息
- (void)getCheckInfo {
    //不是签约专家就不去获取
    if ([[JCWUserBall currentUser].tuijian integerValue]!=1) {

        return;
    }
    
    [self.view showLoading];
    JCUserService_New * service = [JCUserService_New service];
    [service getUserCheckInfoWithType:@"4" success:^(id  _Nullable object) {
        [self.view endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
            NSString *content = object[@"data"][@"content"];
            NSString *state = object[@"data"][@"current_state"];//是否可以修改 1是 2审核中 3本月已修改 4禁止修改
            self.contentTV.text = NonNil(content);
            if ([state integerValue]==1) {
                [self.submitBtn setTitle:@"提交" forState:0];
                self.contentTV.userInteractionEnabled = YES;
                self.submitBtn.backgroundColor = JCBaseColor;
                self.submitBtn.userInteractionEnabled = YES;
            }
            if ([state integerValue]==2) {
                [self.submitBtn setTitle:@"审核中" forState:0];
                self.submitBtn.backgroundColor = COLOR_9F9F9F;
                self.submitBtn.userInteractionEnabled = NO;
                self.contentTV.userInteractionEnabled = NO;
            }
            if ([state integerValue]==3) {
                [self.submitBtn setTitle:@"本月已修改" forState:0];
                self.submitBtn.backgroundColor = COLOR_9F9F9F;
                self.submitBtn.userInteractionEnabled = NO;
                self.contentTV.userInteractionEnabled = NO;

            }
        }else{
             [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        [self.view endLoading];
    }];

}

- (void)submitBtnClick {
      NSString *text = [self.contentTV.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    if (text.length==0) {
        [JCWToastTool showHint:@"请输入个人简介"];
        return;
    }
    if (text.length<20) {
        [JCWToastTool showHint:@"内容不符合要求，请修改后提交；要求：最少20个字，最多100个字（不包含空格）。"];
        return;
    }
    WeakSelf;
    [self.view showLoading];
    JCUserService_New * service = [JCUserService_New service];
        [service updateUserInfoWithType:@"4" value:self.contentTV.text code:@"" success:^(id  _Nullable object) {
            [self.view endLoading];
            if ([JCWJsonTool isSuccessResponse:object]) {

                [[NSNotificationCenter defaultCenter] postNotificationName:NotificationNameUserChange object:nil];
                if ([[JCWUserBall currentUser].fabu integerValue]==1) {
                    [self getCheckInfo];
                    [JCWToastTool showHint:@"提交修改个人简介申请成功，等待客服审核……"];
                }else{
                    [self.navigationController popViewControllerAnimated:YES];
                }

//                [self.navigationController popViewControllerAnimated:YES];
                
            }else{
                 [JCWToastTool showHint:object[@"msg"]];
            }
        } failure:^(NSError * _Nonnull error) {
            [self.view endLoading];
        }];
    
}

- (UIButton *)submitBtn {
    if (!_submitBtn) {
        _submitBtn = [UIButton initWithText:@"提交" FontSize:AUTO(16) Weight:2 BackGroundColor:JCBaseColor TextColors:JCWhiteColor];
        [_submitBtn hg_setAllCornerWithCornerRadius:AUTO(22)];
    }
    return _submitBtn;
}

- (UITextView *)contentTV {
    if (!_contentTV) {
        _contentTV = [UITextView new];
        _contentTV.textColor = COLOR_2F2F2F;
        _contentTV.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(15)];
        _contentTV.placeholder = @"输入个人简介，最少20个字，最多100个字符…";
    }
    return _contentTV;
}

- (UILabel *)countLab {
    if (!_countLab) {
        _countLab = [UILabel initWithTitle:@"0/140" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_A9A9A9 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _countLab;
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
