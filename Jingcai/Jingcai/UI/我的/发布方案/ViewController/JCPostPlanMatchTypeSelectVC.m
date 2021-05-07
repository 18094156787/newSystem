//
//  JCPostPlanMatchTypeSelectVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/4/8.
//  Copyright © 2020 jingcai. All rights reserved.
//

#import "JCPostPlanMatchTypeSelectVC.h"
#import "JCPostPlanVC.h"
@interface JCPostPlanMatchTypeSelectVC ()

@property (nonatomic,strong) UILabel *fbCountLab;//剩余可发布次数

@end

@implementation JCPostPlanMatchTypeSelectVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationBarStyle = JCNavigationBarStyleTransparent;
    [self setNavBackImg];
    [self configPostCount];
}


- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationBarStyle = JCNavigationBarStyleDefault;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.title = @"选择类型";
    self.view.backgroundColor = [JCBlackColor colorWithAlphaComponent:0.5];
    [self initViews];
}

- (void)initViews {

//    if (self.isAddArticle) {
//        //添加审核认证,不计算发布次数
//        [self showSelTypeView];
//    }else{
//        if ([[JCWUserBall currentUser].fabu_count integerValue]>0) {
//            [self showSelTypeView];
//        }else{
//            self.title = @"发布达人方案";
//            [self showNoDataView];
//        }
//    }
    [self showSelTypeView];
    
    
    
    [self.view addSubview:self.fbCountLab];
    [self.fbCountLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.bottom.offset(-kBottomTabSafeAreaHeight-AUTO(50));
    }];
    

    
}
//剩余发布次数
- (void)configPostCount {
    if ([JCWUserBall currentUser].fabu_count) {
        NSString *countStr = [NSString stringWithFormat:@"今日还可发布%@篇达人方案",[JCWUserBall currentUser].fabu_count];
        NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:countStr];
        NSRange range = [countStr rangeOfString:[JCWUserBall currentUser].fabu_count];
        if (range.location!=NSNotFound) {
            [attributedStr setAttributes:@{NSForegroundColorAttributeName:JCBaseColor,NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Semibold" size:AUTO(23)]} range:range];
            self.fbCountLab.attributedText = attributedStr;
        }
    }
}

- (void)showSelTypeView {
    UIView *opView = [UIView new];
    NSInteger topY = 100;
    opView.frame = CGRectMake(0, topY, 100, 100);
    opView.centerX = self.view.centerX;
    [self.view addSubview:opView];
    

    // gradient
    CAGradientLayer *opGl = [CAGradientLayer layer];
    opGl.frame = CGRectMake(0,0,100,100);
    opGl.startPoint = CGPointMake(0, 0);
    opGl.endPoint = CGPointMake(0.88, 1);
    opGl.colors = @[(__bridge id)[UIColor colorWithRed:250/255.0 green:146/255.0 blue:160/255.0 alpha:1.0].CGColor, (__bridge id)[UIColor colorWithRed:239/255.0 green:110/255.0 blue:110/255.0 alpha:1.0].CGColor];
    opGl.locations = @[@(0), @(1.0f)];
    opView.layer.cornerRadius = 50;
    opView.layer.masksToBounds = YES;
    opView.layer.shadowColor = [UIColor colorWithRed:95/255.0 green:195/255.0 blue:255/255.0 alpha:0.43].CGColor;
    opView.layer.shadowOffset = CGSizeMake(0,2);
    opView.layer.shadowOpacity = 1;
    opView.layer.shadowRadius = 4;
    [opView.layer addSublayer:opGl];
    
    UILabel *opLab = [UILabel new];
    opLab.font = [UIFont fontWithName:@"PingFangSC-Medium" size:15];
    opLab.textAlignment = NSTextAlignmentCenter;
    opLab.textColor = JCWhiteColor;
    opLab.text = @"竞足";
    opLab.frame = opView.bounds;
    opLab.userInteractionEnabled = YES;
    [opView addSubview:opLab];
    topY = topY+120;
    
    
    
    UIView *ypView = [UIView new];
    ypView.frame = CGRectMake(0, topY, 100, 100);
    ypView.centerX = self.view.centerX;
    [self.view addSubview:ypView];
    // gradient
    CAGradientLayer *ypGl = [CAGradientLayer layer];
    ypGl.frame = CGRectMake(0,0,100,100);
    ypGl.startPoint = CGPointMake(0.5, 0);
    ypGl.endPoint = CGPointMake(0.5, 1);
    ypGl.colors = @[(__bridge id)[UIColor colorWithRed:255/255.0 green:230/255.0 blue:136/255.0 alpha:1.0].CGColor, (__bridge id)[UIColor colorWithRed:255/255.0 green:201/255.0 blue:80/255.0 alpha:1.0].CGColor];
    ypGl.locations = @[@(0), @(1.0f)];
    ypView.layer.cornerRadius = 50;
    ypView.layer.masksToBounds = YES;
    ypView.layer.shadowColor = [UIColor colorWithRed:255/255.0 green:213/255.0 blue:82/255.0 alpha:0.45].CGColor;
    ypView.layer.shadowOffset = CGSizeMake(0,2);
    ypView.layer.shadowOpacity = 1;
    ypView.layer.shadowRadius = 4;
    [ypView.layer addSublayer:ypGl];
    
    UILabel *ypLab = [UILabel new];
    ypLab.font = [UIFont fontWithName:@"PingFangSC-Medium" size:15];
    ypLab.textAlignment = NSTextAlignmentCenter;
    ypLab.textColor = JCWhiteColor;
    ypLab.text = @"让球";
    ypLab.frame = ypView.bounds;
    ypLab.userInteractionEnabled = YES;
    [ypView addSubview:ypLab];
    
    topY = topY+120;
    
    UIView *dxqView = [UIView new];
    dxqView.frame = CGRectMake(0, topY, 100, 100);
    dxqView.centerX = self.view.centerX;
    [self.view addSubview:dxqView];
    // gradient
    CAGradientLayer *dxqGl = [CAGradientLayer layer];
    dxqGl.frame = CGRectMake(0,0,100,100);
    dxqGl.startPoint = CGPointMake(0, 0);
    dxqGl.endPoint = CGPointMake(0.86, 0.97);
    dxqGl.colors =  @[(__bridge id)[UIColor colorWithRed:130/255.0 green:204/255.0 blue:255/255.0 alpha:1.0].CGColor, (__bridge id)[UIColor colorWithRed:115/255.0 green:188/255.0 blue:255/255.0 alpha:1.0].CGColor];
    dxqGl.locations = @[@(0), @(1.0f)];
    dxqView.layer.cornerRadius = 50;
    dxqView.layer.masksToBounds = YES;
    dxqView.layer.shadowColor = [UIColor colorWithRed:153/255.0 green:146/255.0 blue:248/255.0 alpha:0.5].CGColor;
    dxqView.layer.shadowOffset = CGSizeMake(0,2);
    dxqView.layer.shadowOpacity = 1;
    dxqView.layer.shadowRadius = 4;
    [dxqView.layer addSublayer:dxqGl];
    
    UILabel *dxqLab = [UILabel new];
    dxqLab.font = [UIFont fontWithName:@"PingFangSC-Medium" size:15];
    dxqLab.textAlignment = NSTextAlignmentCenter;
    dxqLab.textColor = JCWhiteColor;
    dxqLab.text = @"进球数";
    dxqLab.frame = dxqView.bounds;
    dxqLab.userInteractionEnabled = YES;
    [dxqView addSubview:dxqLab];
    

    
    
    WeakSelf;
    [opLab bk_whenTapped:^{
        [weakSelf pushVCWithType:@"1"];
    }];
    
    [ypLab bk_whenTapped:^{
        [weakSelf pushVCWithType:@"2"];

    }];
    
    [dxqLab bk_whenTapped:^{
        [weakSelf pushVCWithType:@"3"];
    }];
}

- (void)showNoDataView {
    UIImageView *nodateView = [UIImageView new];
    nodateView.image = JCIMAGE(@"nodata_icon");
    [self.view addSubview:nodateView];
    [nodateView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(100));
        make.centerX.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(AUTO(200), AUTO(154)));
    }];
    UILabel *label = [UILabel initWithTitle:@"今日已达发布上限，明天再来吧~" andFont:AUTO(13) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];;
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(nodateView.mas_bottom);
    }];
}


- (void)pushVCWithType:(NSString *)type {
    if (self.isAddArticle&&self.JCPushVCBlick) {
        self.JCPushVCBlick(type);
        return;
    }
    JCPostPlanVC *vc = [JCPostPlanVC new];
    vc.type = type;
    [self.navigationController pushViewController:vc animated:YES];
}




-(UILabel *)fbCountLab {
    if (!_fbCountLab) {
        _fbCountLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _fbCountLab;
}

@end
