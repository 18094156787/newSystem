//
//  JCSmallPriceWithDrawSuccessVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/11/12.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCSmallPriceWithDrawSuccessVC.h"
#import "JCYCHongBaoWMVC.h"
@interface JCSmallPriceWithDrawSuccessVC ()

@end

@implementation JCSmallPriceWithDrawSuccessVC


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationBarStyle = JCNavigationBarStyleDefault;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationBarStyle = JCNavigationBarStyleDefault;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"现金提现";
    UIImageView *imgView = [UIImageView new];
    imgView.image = JCIMAGE(@"me_withdraw_ic_success");
    [self.view addSubview:imgView];
    [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(70));
        make.centerX.equalTo(self.view);
        make.width.height.mas_equalTo(CGSizeMake(AUTO(72), AUTO(72)));
    }];
    
    UILabel *label = [UILabel initWithTitle:@"提现申请已提交成功" andFont:AUTO(18) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(imgView.mas_bottom).offset(AUTO(15));
    }];
    
    UILabel *infoLab = [UILabel initWithTitle:@"请耐心等待我司打款！" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:0];
    [self.view addSubview:infoLab];
    [infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(label.mas_bottom).offset(AUTO(8));
    }];
    
    UILabel *sureLab = [UILabel initWithTitle:@"确认" andFont:AUTO(16) andWeight:2 andTextColor:JCWhiteColor andBackgroundColor:JCBaseColor andTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:sureLab];
    [sureLab hg_setAllCornerWithCornerRadius:AUTO(22)];
    [sureLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(infoLab.mas_bottom).offset(AUTO(80));
        make.size.mas_equalTo(CGSizeMake(AUTO(275), AUTO(44)));
    }];
    sureLab.userInteractionEnabled = YES;
    WeakSelf;
    [sureLab bk_whenTapped:^{
        for (UIViewController *vc in weakSelf.navigationController.viewControllers) {
            if ([vc isKindOfClass:[JCYCHongBaoWMVC class]]) {
                [weakSelf.navigationController popToViewController:vc animated:YES];
                return;
            }
        }
        [weakSelf.navigationController popViewControllerAnimated:YES];
    }];
    
    
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
