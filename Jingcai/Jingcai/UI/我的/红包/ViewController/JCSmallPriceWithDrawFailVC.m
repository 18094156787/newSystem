//
//  JCSmallPriceWithDrawFailVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/6/25.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCSmallPriceWithDrawFailVC.h"
#import "JCYuCeHongBaoSmallPriceWithDrawVC.h"

@interface JCSmallPriceWithDrawFailVC ()

@end

@implementation JCSmallPriceWithDrawFailVC

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
    imgView.image = JCIMAGE(@"jc_withdrawal_failure");
    [self.view addSubview:imgView];
    [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(90));
        make.centerX.equalTo(self.view);
        make.width.height.mas_equalTo(CGSizeMake(AUTO(194), AUTO(146)));
    }];
    
    UILabel *label = [UILabel initWithTitle:@"很抱歉，您的现金红包提现失败" andFont:AUTO(18) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(imgView.mas_bottom).offset(AUTO(15));
    }];
    
    UILabel *infoLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    NSString *errorReason = [NSString stringWithFormat:@"您可以添加客服微信%@，向客服求助或更换正常可用的支付宝账号重新提现！",NonNil([JCConfigModel currentConfigModel].customer_award)];
    infoLab.text = errorReason;
    infoLab.numberOfLines = 0;
    [self.view addSubview:infoLab];
    
    [infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.left.offset(AUTO(45));
        make.right.offset(AUTO(-45));
        make.top.equalTo(label.mas_bottom).offset(AUTO(8));
    }];
    
    UILabel *sureLab = [UILabel initWithTitle:@"重新提现" andFont:AUTO(16) andWeight:2 andTextColor:JCWhiteColor andBackgroundColor:JCBaseColor andTextAlignment:NSTextAlignmentCenter];
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
//        for (UIViewController *vc in weakSelf.navigationController.viewControllers) {
//            if ([vc isKindOfClass:[JCYCHongBaoWMVC class]]) {
//                [weakSelf.navigationController popToViewController:vc animated:YES];
//                return;
//            }
//        }
        JCYuCeHongBaoSmallPriceWithDrawVC *vc = [JCYuCeHongBaoSmallPriceWithDrawVC new];
        vc.model = self.model;
        [weakSelf.navigationController pushViewController:vc animated:YES];
    }];
    
    
}

@end
