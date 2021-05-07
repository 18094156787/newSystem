//
//  JCYuCeHongBaoWithDrawVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/4/19.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCYuCeHongBaoWithDrawVC.h"

@interface JCYuCeHongBaoWithDrawVC ()

@property(nonatomic,strong) UILabel *moneyLab;


@end

@implementation JCYuCeHongBaoWithDrawVC

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
    codeImgView.image = JCIMAGE(@"jc_yuce_Code");
    [bottomView addSubview:codeImgView];
    [codeImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(20));
        make.left.offset(AUTO(20));
        make.height.mas_equalTo(AUTO(24));
    }];
    
    UILabel *codeInfoLab = [UILabel initWithTitle:@"提现校验码" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    [bottomView addSubview:codeInfoLab];
    [codeInfoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(codeImgView.mas_right).offset(AUTO(8));
        make.centerY.equalTo(codeImgView);
    }];
    
    UILabel *codeLab = [UILabel initWithTitle:self.model.name andFont:AUTO(24) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    [bottomView addSubview:codeLab];
    [codeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(codeImgView);
        make.top.equalTo(codeImgView.mas_bottom).offset(AUTO(25));
        make.right.offset(AUTO(-15));
        make.height.mas_equalTo(AUTO(25));
    }];

    
    
    UIView *lineView = [UIView new];
    lineView.backgroundColor = COLOR_F0F0F0;
    [bottomView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.top.equalTo(codeLab.mas_bottom).offset(AUTO(10));
        make.height.mas_equalTo(1);
    }];
    
    UIImageView *attenImgView = [UIImageView new];
    attenImgView.image = JCIMAGE(@"jc_atten_gray");
    [bottomView addSubview:attenImgView];
    [attenImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView.mas_bottom).offset(AUTO(15));
        make.left.offset(AUTO(15));
        make.width.height.mas_equalTo(AUTO(12));
    }];
    
    UILabel *infoLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:0];
    
    NSString *info = @"";
    if ([JCConfigModel currentConfigModel].customer_award.length>0) {
        info = [NSString stringWithFormat:@"超过 5 元的提现需要联系微信客服完成\n请添加客服微信号 %@，输入下方的校验码",[JCConfigModel currentConfigModel].customer_award];
    }else {
        info = [NSString stringWithFormat:@"超过 5 元的提现需要联系微信客服完成\n请添加客服微信号 %@，输入下方的校验码",self.model.wx_name];
    }
    infoLab.text = info;
    infoLab.numberOfLines = 0;
    [self.view addSubview:infoLab];
    [infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(attenImgView).offset(-3);
        make.left.equalTo(attenImgView.mas_right).offset(AUTO(5));
    }];
    self.infoLab = infoLab;

    UIButton *withDrawBtn = [UIButton initWithText:@"一键复制微信号" FontSize:AUTO(16) BackGroundColor:COLOR_EF2F2F TextColor:JCWhiteColor];
     [bottomView addSubview:withDrawBtn];
     [withDrawBtn hg_setAllCornerWithCornerRadius:AUTO(24)];
     [withDrawBtn mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.equalTo(infoLab.mas_bottom).offset(AUTO(50));
         make.centerX.equalTo(self.view);
         make.left.offset(AUTO(15));
         make.right.offset(AUTO(-15));
         make.height.mas_equalTo(AUTO(48));
     }];

    WeakSelf;
    [withDrawBtn bk_whenTapped:^{
        UIPasteboard * pasteBoard = [UIPasteboard generalPasteboard];
        pasteBoard.string = weakSelf.model.wx_name;
        [JCWToastTool showHint:@"已复制到黏贴版"];
    }];
//
//    NSString *money = [NSString stringWithFormat:@"¥%@",@([self.model.total floatValue]/100.0f)];
//    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:money];
//    NSRange range = [money rangeOfString:@"¥"];
//    if (range.location!=NSNotFound) {
//        [attr addAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(18)]} range:range];
//    }
//    self.moneyLab.attributedText = attr;

}

- (void)getMyAllSmallPrice {
//    if (!self.tx_all) {
//        return;
//    }
    NSString *type = @"1";
    NSString *hongbao_id = self.model.id;
    JCUserService_New * service = [[JCUserService_New alloc] init];
    [service getHongbaoSubmitWithType:type hongbao_id:hongbao_id Email:@"" success:^(id  _Nullable object) {
        if ([JCWJsonTool isSuccessResponse:object]) {
            NSString *total = object[@"data"][@"total"];
            NSString *money = [NSString stringWithFormat:@"¥%@",@([total floatValue]/100.0f)];
            NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:money];
            NSRange range = [money rangeOfString:@"¥"];
            if (range.location!=NSNotFound) {
                [attr addAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(18)]} range:range];
            }
            self.moneyLab.attributedText = attr;

        }else {
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        
    }];

}


- (UILabel *)moneyLab {
    if (!_moneyLab) {
        _moneyLab = [UILabel initWithTitle:@"" andFont:AUTO(48) andWeight:2 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _moneyLab;
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
