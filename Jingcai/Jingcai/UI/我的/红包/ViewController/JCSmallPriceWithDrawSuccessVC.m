//
//  JCSmallPriceWithDrawSuccessVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/6/25.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCSmallPriceWithDrawSuccessVC.h"

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
    imgView.image = JCIMAGE(@"jc_withdrawal_success");
    [self.view addSubview:imgView];
    [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(90));
        make.centerX.equalTo(self.view);
        make.width.height.mas_equalTo(CGSizeMake(AUTO(194), AUTO(146)));
    }];
    
    UILabel *label = [UILabel initWithTitle:@"恭喜你，您的现金红包已提现成功" andFont:AUTO(18) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(imgView.mas_bottom).offset(AUTO(15));
    }];
    
    UILabel *infoLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    infoLab.numberOfLines = 0;
    [self.view addSubview:infoLab];
    [infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(label.mas_bottom).offset(AUTO(8));
    }];

    NSString *info = [NSString stringWithFormat:@"若有疑问，请联系添加客服微信%@\n向客服求助",NonNil([JCConfigModel currentConfigModel].customer_award)];
    infoLab.text = info;
    
}
@end
