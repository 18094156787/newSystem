//
//  JCYuCeHongBaoSmallPriceWithDrawVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/4/19.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCYuCeHongBaoSmallPriceWithDrawVC.h"
#import "JCYuCeHongBaoWithDrawErrorView.h"
#import "JCSmallPriceWithDrawWaittingVC.h"
@interface JCYuCeHongBaoSmallPriceWithDrawVC ()

@property(nonatomic,strong) UILabel *moneyLab;

@property(nonatomic,strong) UITextField *accountTF;

@property(nonatomic,strong) UITextField *nameTF;

@end

@implementation JCYuCeHongBaoSmallPriceWithDrawVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationBarStyle = JCNavigationBarStyleTransparent;
    [self setNavBackImg];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationBarStyle = JCNavigationBarStyleDefault;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"现金提现";
    self.view.backgroundColor = JCWhiteColor;
    [self initViews];
    [self getMyAllSmallPrice];
//    if (self.tx_all) {
//        [self getMyAllSmallPrice];
//    }
    
}

- (void)initViews {
    UIView *topView = [UIView new];
    [self.view addSubview:topView];
    topView.frame = CGRectMake(0, 0, SCREEN_WIDTH, kNavigationBarHeight+AUTO(140));



    // gradient
    CAGradientLayer *gl = [CAGradientLayer layer];
    gl.frame = CGRectMake(0, 0, SCREEN_WIDTH, kNavigationBarHeight+AUTO(140));
    gl.startPoint = CGPointMake(0.42, 0.79);
    gl.endPoint = CGPointMake(0.42, 0);
    gl.colors = @[(__bridge id)[UIColor colorWithRed:163/255.0 green:32/255.0 blue:32/255.0 alpha:1.0].CGColor, (__bridge id)[UIColor colorWithRed:229/255.0 green:69/255.0 blue:61/255.0 alpha:1.0].CGColor];
    gl.locations = @[@(0), @(1.0f)];
    [topView.layer addSublayer:gl];
    
    
    UIImageView *imgView = [UIImageView new];
    imgView.image = JCIMAGE(@"me_income_img");
    [topView addSubview:imgView];
    [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.right.offset(AUTO(-8));
        make.size.mas_equalTo(CGSizeMake(AUTO(154), AUTO(88)));
    }];
    
    UILabel *label = [UILabel initWithTitle:@"提现金额" andFont:AUTO(16) andWeight:1 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:0];
    [topView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.offset(kNavigationBarHeight+AUTO(20));
    }];

    [topView addSubview:self.moneyLab];
    [self.moneyLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label);
        make.top.equalTo(label.mas_bottom);
//        make.height.mas_equalTo(AUTO(45));
    }];
    
    UIView *bottomView = [UIView new];
    [self.view addSubview:bottomView];
    bottomView.backgroundColor = JCWhiteColor;
    [bottomView hg_setCornerOnTopWithRadius:AUTO(20)];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(topView.mas_bottom).offset(AUTO(-20));
    }];
    
    UIImageView *codeImgView = [UIImageView new];
    codeImgView.image = JCIMAGE(@"jc_yuce_zfb");
    [bottomView addSubview:codeImgView];
    [codeImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(20));
        make.left.offset(AUTO(20));
        make.width.height.mas_equalTo(AUTO(20));
    }];
    
    UILabel *codeInfoLab = [UILabel initWithTitle:@"支付宝账户" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    [bottomView addSubview:codeInfoLab];
    [codeInfoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(codeImgView.mas_right).offset(AUTO(8));
        make.centerY.equalTo(codeImgView);

    }];
    
    UILabel *titleLab = [UILabel initWithTitle:@"支付宝账户:" andFont:AUTO(16) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    [bottomView addSubview:titleLab];
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(codeImgView);
        make.top.equalTo(codeImgView.mas_bottom).offset(AUTO(25));
        make.height.mas_equalTo(AUTO(25));

    }];

    [bottomView addSubview:self.accountTF];
    [self.accountTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(titleLab.mas_right);
        make.centerY.equalTo(titleLab);
        make.right.offset(AUTO(-15));
        make.height.mas_equalTo(AUTO(25));
    }];
    
    
    UIView *lineView = [UIView new];
    lineView.backgroundColor = COLOR_F0F0F0;
    [bottomView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.top.equalTo(self.accountTF.mas_bottom).offset(AUTO(15));
        make.height.mas_equalTo(1);
    }];
    
    UILabel *nameLab = [UILabel initWithTitle:@"支付宝账号姓名:" andFont:AUTO(16) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    [bottomView addSubview:nameLab];
    [nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(codeImgView);
        make.top.equalTo(lineView.mas_bottom).offset(AUTO(15));
        make.height.mas_equalTo(AUTO(25));

    }];

    [bottomView addSubview:self.nameTF];
    [self.nameTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(nameLab.mas_right);
        make.centerY.equalTo(nameLab);
        make.right.offset(AUTO(-15));
        make.height.mas_equalTo(AUTO(25));
    }];
    
    
    UIView *lineView1 = [UIView new];
    lineView1.backgroundColor = COLOR_F0F0F0;
    [bottomView addSubview:lineView1];
    [lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.top.equalTo(self.nameTF.mas_bottom).offset(AUTO(15));
        make.height.mas_equalTo(1);
    }];
    
    UIImageView *attenImgView = [UIImageView new];
    attenImgView.image = JCIMAGE(@"jc_atten_gray");
    [bottomView addSubview:attenImgView];
    [attenImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView1.mas_bottom).offset(AUTO(15));
        make.left.offset(AUTO(15));
        make.width.height.mas_equalTo(AUTO(12));
    }];
    
    UILabel *infoLab = [UILabel initWithTitle:@"我们将在 24 小时之内将现金提现至您的支付宝账户" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    infoLab.numberOfLines = 0;
    [self.view addSubview:infoLab];
    [infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(attenImgView);
        make.left.equalTo(attenImgView.mas_right).offset(AUTO(5));
    }];
    
    UIButton *withDrawBtn = [UIButton initWithText:@"确认提现" FontSize:AUTO(16) BackGroundColor:COLOR_EF2F2F TextColor:JCWhiteColor];
     [bottomView addSubview:withDrawBtn];
     [withDrawBtn hg_setAllCornerWithCornerRadius:AUTO(24)];
     [withDrawBtn mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.equalTo(infoLab.mas_bottom).offset(AUTO(50));
         make.centerX.equalTo(self.view);
         make.left.offset(AUTO(15));
         make.right.offset(AUTO(-15));
         make.height.mas_equalTo(AUTO(48));
     }];
    
    


//
    WeakSelf;
     [withDrawBtn bk_whenTapped:^{
         if (weakSelf.accountTF.text.length==0) {
             [JCWToastTool showHint:@"请输入支付宝账号"];
             return;
         }
         [weakSelf withDrawAction];

     }];

}

//获取信息
- (void)getMyAllSmallPrice {
//    if (!self.tx_all) {
//        return;
//    }
    NSString *type = @"1";
    NSString *hongbao_id = self.model.id;
    if (self.tx_all) {
        type = @"2";
        hongbao_id = @"";
    }
    
    
    JCUserService_New * service = [[JCUserService_New alloc] init];
    [service getHongbaoSubmitWithType:type hongbao_id:hongbao_id Email:@"" name:@"" success:^(id  _Nullable object) {
        if ([JCWJsonTool isSuccessResponse:object]) {
            NSString *total = object[@"data"][@"total"];
            NSString *email = object[@"data"][@"account"];
            NSString *name = object[@"data"][@"ali_name"];
            NSString *money = [NSString stringWithFormat:@"¥%@",@([total floatValue]/100.0f)];
            NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:money];
            NSRange range = [money rangeOfString:@"¥"];
            if (range.location!=NSNotFound) {
                [attr addAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(18)]} range:range];
            }
            self.moneyLab.attributedText = attr;
            self.accountTF.text = email;
            self.nameTF.text = name;
        }else {
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        
    }];

}


//提现单个小额
- (void)withDrawAction {
    if (self.accountTF.text.length==0) {
        [JCWToastTool showHint:@"请输入账号"];
        return;
    }
    if (self.nameTF.text.length==0) {
        [JCWToastTool showHint:@"请填写您的真实姓名"];
        return;
    }
    BOOL name_isRight =([self isChineseCharacter:self.nameTF.text]);
    if (!name_isRight) {
        [JCWToastTool showHint:@"账号姓名仅支持汉字，请重新填写！"];
        return;
    }
    if (self.tx_all) {
        [self txAllSmallPrice];
        return;
    }
    
    //小额红包提现
    JCUserService_New * service = [[JCUserService_New alloc] init];
    [service getHongbaoSubmitWithType:@"3" hongbao_id:self.model.id Email:self.accountTF.text name:self.nameTF.text success:^(id  _Nullable object) {
        if ([JCWJsonTool isSuccessResponse:object]) {
//            [JCWToastTool showHint:@"提现成功"];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"JCSmallPriceWithDrawSubmit" object:nil];
                [self.navigationController pushViewController:[JCSmallPriceWithDrawWaittingVC new] animated:YES];;
            
        }else{
//           [JCWToastTool showHint:object[@"msg"]];
            NSString *errorString = object[@"msg"];
            JCYuCeHongBaoWithDrawErrorView *view = [JCYuCeHongBaoWithDrawErrorView new];
            view.errorString = errorString;
            view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
            @weakify(view);
            view.JCSureBlock = ^{
                @strongify(view);
                [view removeFromSuperview];
                [self.navigationController popViewControllerAnimated:YES];
            };
            [[UIApplication sharedApplication].keyWindow addSubview:view];
        }
    } failure:^(NSError * _Nonnull error) {
        
    }];


}


//提现所有小额
- (void)txAllSmallPrice {
    [self.view showLoading];
    JCUserService_New * service = [[JCUserService_New alloc] init];
    [service getHongbaoSubmitWithType:@"4" hongbao_id:@"" Email:self.accountTF.text name:self.nameTF.text success:^(id  _Nullable object) {
        [self.view endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
    //            [JCWToastTool showHint:@"提现成功"];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"JCSmallPriceWithDrawSubmit" object:nil];
                [self.navigationController pushViewController:[JCSmallPriceWithDrawWaittingVC new] animated:YES];;
            
        }else{
               [JCWToastTool showHint:object[@"msg"]];

        }

    } failure:^(NSError * _Nonnull error) {
        [self.view endLoading];
    }];

}
- (BOOL)isChineseCharacter:(NSString*)source {
    NSString *regex = @"^[\\u4E00-\\u9FEA]+$";
    return ([source rangeOfString:regex options:NSRegularExpressionSearch].length>0);
}
- (UILabel *)moneyLab {
    if (!_moneyLab) {
        _moneyLab = [UILabel initWithTitle:@"" andFont:AUTO(48) andWeight:2 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _moneyLab;
}

- (UITextField *)accountTF {
    if (!_accountTF) {
        _accountTF = [UITextField new];
        _accountTF.textAlignment = NSTextAlignmentRight;
        _accountTF.font = [UIFont systemFontOfSize:AUTO(16)];
        _accountTF.placeholder = @"请填写您的支付宝账号";
    }
    return _accountTF;
}

- (UITextField *)nameTF {
    if (!_nameTF) {
        _nameTF = [UITextField new];
        _nameTF.textAlignment = NSTextAlignmentRight;
        _nameTF.font = [UIFont systemFontOfSize:AUTO(16)];
        _nameTF.placeholder = @"请填写您的真实姓名";
    }
    return _nameTF;
}

@end
