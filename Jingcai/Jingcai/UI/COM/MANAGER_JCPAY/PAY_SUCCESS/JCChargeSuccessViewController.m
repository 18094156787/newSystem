//
//  JCChargeSuccessViewController.m
//  Jingcai
//
//  Created by 陈继伟 on 2019/11/4.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCChargeSuccessViewController.h"

@interface JCChargeSuccessViewController ()

@property (nonatomic,strong) UILabel *priceLab;

@end

@implementation JCChargeSuccessViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     self.navigationItem.title = @"充值成功";
    self.view.backgroundColor = JCWhiteColor;
    [self initView];
   
    self.priceLab.text = [NSString stringWithFormat:@"%.2f",1.0*self.payNum/100];
}

- (void)initView {
    
    UIImageView *imgView = [UIImageView new];
    [self.view addSubview:imgView];
    imgView.image = JCIMAGE(@"charge_success");
    [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(76, 69));
        make.topMargin.offset(35);
        make.centerX.equalTo(self.view);
    }];
    
    UILabel *successLab = [UILabel initWithTitle:@"充值成功" andFont:19 andWeight:0 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:0];
    [self.view addSubview:successLab];
    [successLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imgView.mas_bottom).offset(AUTO(20));
        make.centerX.equalTo(self.view);
        
    }];
    
    UILabel *infoLab = [UILabel initWithTitle:@"您已充值（元）" andFont:16 andWeight:0 andTextColor:COLOR_666666 andBackgroundColor:JCClearColor andTextAlignment:0];
    [self.view addSubview:infoLab];
    [infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(successLab.mas_bottom).offset(AUTO(20));
        make.centerX.equalTo(self.view);
    }];
    
    self.priceLab = [UILabel initWithTitle:@"" andFont:42 andWeight:0 andTextColor:JCBlackColor andBackgroundColor:JCClearColor andTextAlignment:0];
    self.priceLab.font = [UIFont boldSystemFontOfSize:AUTO(42)];
    [self.view addSubview:self.priceLab];
    [self.priceLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(infoLab.mas_bottom).offset(AUTO(20));
        make.centerX.equalTo(self.view);
    }];
    
    UIButton *sureBtn = [UIButton initWithText:@"完成" FontSize:16 BackGroundColor:JCBaseColor TextColors:JCWhiteColor];
    [self.view addSubview:sureBtn];
    [sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(300, 40));
        make.top.equalTo(self.priceLab.mas_bottom).offset(AUTO(50));
        make.centerX.equalTo(self.view);
    }];
    WeakSelf;
    [sureBtn bk_whenTapped:^{
        [weakSelf dismissViewControllerAnimated:YES completion:nil];
//        [self.navigationController popViewControllerAnimated:YES];
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
