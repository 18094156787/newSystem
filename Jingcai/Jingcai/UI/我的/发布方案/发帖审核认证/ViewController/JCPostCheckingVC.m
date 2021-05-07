//
//  JCPostCheckingVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/8/22.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCPostCheckingVC.h"

@interface JCPostCheckingVC ()

@end

@implementation JCPostCheckingVC

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

    self.title = @"申请发帖";
    [self initView];
}

- (void)initView {
    UIView *colorView = [UIView new];
    [self.view addSubview:colorView];
    colorView.backgroundColor  = COLOR_F0F0F0;
    [colorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
        make.height.mas_equalTo(AUTO(10));
    }];
    
    
    UIImageView *imgView = [UIImageView new];
    imgView.image = JCIMAGE(@"post_img-zzsh");
    [self.view addSubview:imgView];
    [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(80));
        make.centerX.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(AUTO(66), AUTO(66)));
    }];
    
    UILabel *titleLab = [UILabel initWithTitle:@"您的申请正在审核中" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    [self.view addSubview:titleLab];
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imgView.mas_bottom).offset(AUTO(30));
        make.centerX.equalTo(self.view);
    }];
    
    UILabel *infLab = [UILabel initWithTitle:@"请耐心等候~" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:0];
    [self.view addSubview:infLab];
    [infLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleLab.mas_bottom).offset(AUTO(10));
        make.centerX.equalTo(self.view);
    }];
    
    UIButton *backBtn = [UIButton initWithText:@"返回" FontSize:AUTO(16) Weight:2 BackGroundColor:JCBaseColor TextColors:JCWhiteColor];
    [backBtn hg_setAllCornerWithCornerRadius:AUTO(22)];
    [self.view addSubview:backBtn];
    [backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(infLab.mas_bottom).offset(AUTO(44));
        make.size.mas_equalTo(CGSizeMake(AUTO(275), AUTO(50)));
    }];
    
    WeakSelf;
    [backBtn bk_whenTapped:^{
        [weakSelf.navigationController popViewControllerAnimated:YES];
    }];
}
@end
