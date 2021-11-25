//
//  JCHistoryPayDataModelDetailStickVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/10.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCHistoryPayDataModelDetailStickVC.h"
#import "JCHistoryPayDataModelDetailTopView.h"
#import "JCHistoryPayDataModelDetailVC.h"
#import "NSDate+BRPickerView.h"
#import "JCMatchTimeModel.h"
#import "JCPayShowView.h"
#import "JCKellyDataDetailModel.h"
#import "JNMatchSJAgainstTipView.h"
#import "JCPayShowView.h"
#import "JCChargeVC.h"
static CGFloat const kWMMenuViewHeight = 44;

@interface JCHistoryPayDataModelDetailStickVC ()

@property (nonatomic, strong) JCHistoryPayDataModelDetailTopView *headView;

@property (nonatomic, strong) NSArray *titleArray;

@property (nonatomic,strong) UIView *topColorView;

@property (nonatomic,strong) JNMatchSJAgainstTipView *tipView;

@property (nonatomic, assign) float height;

@property (nonatomic,strong) NSString *time;

@property (nonatomic,strong) NSArray *timeArray;

@property (nonatomic,strong) JCKellyDataDetailModel *detailModel;

@property (nonatomic,strong) JCHistoryPayDataModelDetailVC *chuVC;

@property (nonatomic,strong) JCHistoryPayDataModelDetailVC *jiVC;

@end

@implementation JCHistoryPayDataModelDetailStickVC

- (NSArray *)titleArray {
    if (!_titleArray) {
        _titleArray = @[@"初指",@"即指"];
    }
    return _titleArray;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationBarStyle = JCNavigationBarStyleTransparent;
//    [self initViews];
    if (!self.hidetopMatch) {
        if (!self.topColorView) {
            [self setupColorView];
        }else{
            [self setNavEffect];
        }
    }


}

- (void)setNavEffect {

    CGFloat offsetY = self.contentView.contentOffset.y;
    CGFloat maxOffsetY = AUTO(208);
    float percent = offsetY/maxOffsetY;
    self.topColorView.alpha = percent;
//    NSLog(@"%.2f",percent);
//    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    if (percent>=0.98) {
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;//
    }else{
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    }
//    self.navShadow.alpha= percent;

}


- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
//      self.navigationBarStyle = JCNavigationBarStyleTransparent;
    self.topColorView.alpha = 0;
    [self.topColorView removeFromSuperview];

}
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self.topColorView removeAllSubviews];
    [self.topColorView removeFromSuperview];
    self.topColorView = nil;
}
- (instancetype)init {
    
    if (self = [super init]) {
        self.height = AUTO(625)+kNavigationBarHeight;
        self.titleSizeNormal = 16;
        self.titleSizeSelected = 16;
        self.titleColorSelected = JCBaseColor;//COLOR_FE1F19
        self.titleColorNormal = UIColorFromRGB(0x606062);
        self.menuViewStyle = WMMenuViewStyleTriangle;
        self.menuViewLayoutMode = WMMenuViewLayoutModeLeft;
        self.progressWidth = 8;
        self.progressHeight = 4;
        self.progressColor = JCBaseColor;
        self.progressViewBottomSpace = 1;
        self.viewTop = self.height;
        self.menuViewHeight = kWMMenuViewHeight;
//        self.progressColor = [UIColor redColor];
        self.menuItemWidth = AUTO(50);
        self.maximumHeaderViewHeight = self.height;
//        self.minimumHeaderViewHeight = kNavigationBarHeight;

        self.contentView.bounces = YES;
    }
    return self;
}

- (void)viewDidLoad {

    [super viewDidLoad];
    [self initViews];
    [self getTopInfoData];

    
    UIButton *customView = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    [customView addTarget:self action:@selector(backItemClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:customView];
    
}

- (void)backItemClick {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)getTopInfoData {
    if (self.isMatch&&self.titleModel&&self.titleModel.is_subscrib!=1) {
        // 从联赛详情展示的数据模型,并且没有订阅时,不请求数据,而是展示购买页面
        self.chuVC.view.hidden = YES;
        self.jiVC.view.hidden = YES;
        self.headView.hidden = YES;
        self.menuView.hidden = YES;
        self.contentView.scrollEnabled = NO;
        [self showOrderMsgView];
        return;
    }else{
        self.chuVC.view.hidden = NO;
        self.jiVC.view.hidden = NO;
        self.headView.hidden = NO;
        self.menuView.hidden = NO;
        self.contentView.scrollEnabled = YES;
        self.tipView.hidden = YES;
    }
    [self.jcWindow showLoading];
    JCDataBaseService_New *service = [JCDataBaseService_New new];
    [service getHistoryPayDataModeDetailWithMatch_id:self.match_id Success:^(id  _Nullable object) {
        [self.jcWindow endLoading];

        if ([JCWJsonTool isSuccessResponse:object]) {

            self.detailModel = (JCKellyDataDetailModel *)[JCWJsonTool entityWithJson:object[@"data"] class:[JCKellyDataDetailModel class]];
            self.headView.match_id = self.match_id;
            self.headView.model = self.detailModel;
            self.chuVC.dataArray = [NSMutableArray arrayWithArray:self.detailModel.similar_match.begin_similar_match];
            [self.chuVC reloadData];
            self.jiVC.dataArray = [NSMutableArray arrayWithArray:self.detailModel.similar_match.last_similar_match];
            [self.jiVC reloadData];
            [self reloadData];

        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        [self.jcWindow endLoading];
    }];

}


- (void)initViews {
    if (!self.hidetopMatch) {
        self.headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, self.height);
        [self.view addSubview:self.headView];
    }else{
        self.height = AUTO(390);
        self.headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, self.height);
        self.maximumHeaderViewHeight = self.height;
        self.headView.hidetopMatch = self.hidetopMatch;
        self.viewTop = self.height;
        [self.view addSubview:self.headView];
//        [self reloadData];
    }


    
    WeakSelf;

    
    self.contentView.mj_header = [JCFootBallHeader headerWithRefreshingBlock:^{
        [weakSelf getTopInfoData];
    }];
        

    


}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
//    CGFloat headerViewHeight = self.height;
////    CGFloat headerViewHeight = kWJingCaiBigDataHeaderViewHeight;
//    CGFloat headerViewX = 0;
//    UIScrollView *scrollView = (UIScrollView *)self.view;
//    if (scrollView.contentOffset.y < 0) {
//        headerViewX = scrollView.contentOffset.y;
//        headerViewHeight -= headerViewX;
//
//    }
//    self.headView.frame = CGRectMake(0, headerViewX, CGRectGetWidth(self.view.bounds), self.height);
}

- (void)btnClicked:(id)sender {
    NSLog(@"touch up inside");
}

- (void)backBtnClick {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - ScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [super scrollViewDidScroll:scrollView];
    if (scrollView.contentOffset.y < 0) {
        [self.view setNeedsLayout];
    }
    [self setNavEffect];


    NSLog(@"%.0f",scrollView.contentOffset.y);
}

#pragma mark - Datasource & Delegate
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController {
    return self.titleArray.count;
}

- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index
{
    if (index==0) {
        return self.chuVC;
    }

    return self.jiVC;

}

- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    return self.titleArray[index];
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForMenuView:(WMMenuView *)menuView {
    return CGRectMake(10, _viewTop, self.view.frame.size.width-20, kWMMenuViewHeight);

}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForContentView:(WMScrollView *)contentView {
    CGFloat originY = _viewTop + kWMMenuViewHeight;
    return CGRectMake(0, originY, self.view.frame.size.width, self.view.frame.size.height-kWMMenuViewHeight);
}

- (void)pageController:(WMPageController *)pageController willEnterViewController:(__kindof UIViewController *)viewController withInfo:(NSDictionary *)info {

}

- (void)setupColorView {
    self.topColorView = [UIView new];
    self.topColorView.backgroundColor = JCWhiteColor;
    self.topColorView.alpha = 0;
    self.topColorView.frame = CGRectMake(0, 0, SCREEN_WIDTH, kNavigationBarHeight);
        [self.navigationController.view insertSubview:self.topColorView belowSubview:self.navigationController.navigationBar];
//    [self.navigationController.view addSubview:self.topColorView];
    
    UIButton *backBtn = [UIButton new];
    [self.topColorView addSubview:backBtn];
    [backBtn setImage:JCIMAGE(@"common_title_back_black_bold") forState:0];
    [backBtn setImage:JCIMAGE(@"common_title_back_black_bold") forState:UIControlStateHighlighted];
    [backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(5);
        make.top.offset(StatusBar_HEIGHT);
        make.bottom.offset(0);
        make.width.mas_equalTo(44);
    }];
    [backBtn addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *titleLab = [UILabel initWithTitle:@"同赔分析" andFont:17 andWeight:3 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    [self.topColorView addSubview:titleLab];
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(backBtn);
        make.centerX.equalTo(self.topColorView);
    }];
    

}
#pragma mark -- 购买
- (void)showPayView {
    WeakSelf;
    JCPayShowView *payView = [JCPayShowView new];
    payView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    payView.price = [NSString stringWithFormat:@"%@",@([self.titleModel.big_data_price longValue]/100)];
    [self.jcWindow addSubview:payView];
    payView.JCSureBlock = ^(NSString * _Nonnull hb_id) {
        [weakSelf sureBuy];
    };
    payView.JCProtocolBlock = ^{
        WebViewController *vc = [WebViewController new];
        vc.showBackItem = YES;
            vc.titleStr = @"鲸猜足球用户购买协议";
            NSString *urlStr = [NSString  stringWithFormat:@"%@?dev=1",[JCConfigModel currentConfigModel].get_purchase];
            vc.urlStr = NonNil(urlStr);
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
        [weakSelf presentViewController:nav animated:YES completion:nil];
    };
    [payView show];

}

- (void)FreeExperienceCheck {
    JCBaseTitleAlertView *alertView = [JCBaseTitleAlertView new];
    alertView.contentLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(16)];
    [alertView alertTitle:@"确认开通" TitleColor:COLOR_2F2F2F Mesasge:@"" MessageColor:COLOR_2F2F2F SureTitle:@"确认" SureColor:JCWhiteColor SureHandler:^{
        
        [alertView removeFromSuperview];
        [self FreeExperience];

    } CancleTitle:@"取消" CancleColor:JCBaseColor CancelHandler:^{
       [alertView removeFromSuperview];
    }];
//    NSString *day =  [NSString stringWithFormat:@"%@",self.buyInfoModel.free_day];
    NSString *title = [NSString stringWithFormat:@"是否开通[历史同赔] %@天免费体验",self.titleModel.free_day];
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:title];
    NSRange count_range = [title rangeOfString:NonNil(self.titleModel.free_day)];
    if (count_range.location!=NSNotFound) {
        [attr addAttributes:@{NSForegroundColorAttributeName:JCBaseColor} range:count_range];
    }

    
    alertView.contentLab.attributedText = attr;
    alertView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    [[UIApplication sharedApplication].keyWindow addSubview:alertView];
}

//免费体验
- (void)FreeExperience {
    
    [self.view showLoading];
    JCDataBaseService_New *service = [JCDataBaseService_New service];
    [service getKellyDataModeFreeExperienceWithModel_id:self.titleModel.id Success:^(id  _Nullable object) {
        [self.view endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
            self.titleModel.is_subscrib = 1;
            [self getTopInfoData];
        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

        
    } failure:^(NSError * _Nonnull error) {
        [self.view endLoading];
    }];



}

//确认购买
- (void)sureBuy {
    if ([self.titleModel.big_data_price integerValue]>0&&[[JCWUserBall currentUser].prize floatValue]<[self.titleModel.big_data_price integerValue]/100) {
        [JCWToastTool showHint:@"红币余额不足,请及时充值"];
        [self.navigationController pushViewController:[JCChargeVC new] animated:YES];
        return;
    }
    
    NSString *scene = @"7";
    //1.鲸猜大数据 2指数异动 3历史同赔 4泊松分布 5机构分歧 6.指数分歧
    [self.view showLoading];
    JCHomeService_New *service = [JCHomeService_New new];
    [service getConfirmOrderWithUnique:self.titleModel.id scene:scene source:@"1" price:@"" Success:^(id  _Nullable object) {
        [self.view endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
            NSString *order_key = object[@"data"][@"order_key"];
            [self finalPayWithOrder_key:order_key coupon_id:@"" hongbao_id:@""];

        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        [self.view endLoading];
    }];
    
}
//下单并支付
- (void)finalPayWithOrder_key:(NSString *)order_key coupon_id:(NSString *)coupon_id hongbao_id:(NSString *)hongbao_id {
    [self.jcWindow showLoading];
    JCHomeService_New *service = [JCHomeService_New new];
    [service getPayOrderWithOrder_key:order_key pay_type:@"3" hongbao_id:hongbao_id coupon_id:coupon_id Success:^(id  _Nullable object) {
        [self.jcWindow endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
            NSString *is_pay = object[@"data"][@"is_pay"];
            if ([is_pay intValue]==1) {
                self.titleModel.is_subscrib = 1;
                [self getMyUserInfo];
                [self getTopInfoData];
            }
//            [self.tableView reloadData];

        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }
        
    } failure:^(NSError * _Nonnull error) {
        [self.jcWindow endLoading];
    }];
}

//消息订阅
- (void)showOrderMsgView {
    self.tipView.frame  = CGRectMake(0, 0, SCREEN_WIDTH, AUTO(430));
    self.tipView.tipImgView.image= JCIMAGE(@"nodata_fangan_small");
    self.tipView.titleLab.text = @"您还未订阅该数据模型...";
    self.tipView.contentLab.text = @"统计历史上相同赔率下的开奖结果";
    [self.tipView.buyMonthBtn setTitle:[NSString stringWithFormat:@"订阅此数据模型 %ld红币/月",[self.titleModel.big_data_price integerValue]/100] forState:0];
    if (self.titleModel.is_subscrib==3) {
        self.tipView.is_free = YES;
        self.tipView.tipImgView.image= JCIMAGE(@"nodata_bigdata_yidong");
        self.tipView.titleLab.text = @"";
        [self.tipView.buyMonthBtn setTitle:[NSString stringWithFormat:@"免费体验%@天，点击开通",self.titleModel.free_day] forState:0];
    }
    [self.view addSubview:self.tipView];
    WeakSelf;
    self.tipView.JCSingleMatchBlock = ^(NSInteger type) {
        //is_subscrib 是否订阅，1已订阅,2未订阅（曾经免费体验过）,3未订阅（未免费体验过）
        if (![JCWUserBall currentUser]) {
            JCBaseViewController *vc = (JCBaseViewController *)[weakSelf getViewController];
            [vc presentLogin];
            return;
        }
        if (weakSelf.titleModel.is_subscrib==3) {
            [weakSelf FreeExperienceCheck];
        }
        if (weakSelf.titleModel.is_subscrib==2) {
            [weakSelf showPayView];
        }


    };
}

- (JCHistoryPayDataModelDetailTopView *)headView {
    if (!_headView) {
        _headView = [JCHistoryPayDataModelDetailTopView new];
    }
    return _headView;
}

- (JCHistoryPayDataModelDetailVC *)chuVC {
    if (!_chuVC) {
        _chuVC = [JCHistoryPayDataModelDetailVC new];
        _chuVC.hidetopMatch = self.hidetopMatch;
    }
    return _chuVC;
}

- (JCHistoryPayDataModelDetailVC *)jiVC {
    if (!_jiVC) {
        _jiVC = [JCHistoryPayDataModelDetailVC new];
        _jiVC.hidetopMatch = self.hidetopMatch;
    }
    return _jiVC;
}
- (JNMatchSJAgainstTipView *)tipView {
    if (!_tipView) {
        _tipView = [JNMatchSJAgainstTipView new];
        _tipView.isOnlyMonth = YES;
    }
    return _tipView;
}
@end
