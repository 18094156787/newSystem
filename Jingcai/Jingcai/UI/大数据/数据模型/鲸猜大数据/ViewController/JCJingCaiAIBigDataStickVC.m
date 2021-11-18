//
//  JCJingCaiAIBigDataStickVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/3/15.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCJingCaiAIBigDataStickVC.h"
//#import "WMPanGestureRecognizer.h"

#import "JCFootBallAuthorNewPlaneDetailVC.h"
#import "JCFootBall_GZH_AuthorHeadView.h"
#import "JCFootBallAuthorHistoryPlaneDetailVC.h"
#import "WMMagicScrollView.h"
#import "JCDakaFreePlanListVC.h"
#import "JCDakaGanHuoListVC.h"
#import "JCJingCaiAIBigDataHomeVC.h"
#import "JCJingCaiAIBigDataHeadView.h"
#import "JCJingCaiAINoticeModel.h"
#import "JCBigDataMonthProduceModel.h"
#import "JCJingCaiAIBigDataBuyVC.h"
#import "JCBigDataMingZhongModel.h"
#import "JCJingCaiAIBigDataMatchListVC.h"
#import "NSDate+BRPickerView.h"
#import "JCPayShowView.h"
#import "JCChargeVC.h"
static CGFloat const kWMMenuViewHeight = 0;

@interface JCJingCaiAIBigDataStickVC ()

@property (nonatomic,strong) UIView *lineView;

@property (nonatomic, strong) NSArray *titleArray;

@property (nonatomic, strong) JCJingCaiAIBigDataHomeVC *bigDataVC;

@property (nonatomic, strong) JCJingCaiAIBigDataMatchListVC *dataVC;

@property (nonatomic, strong) JCJingCaiAIBigDataHeadView *headView;

@property (nonatomic,strong) UIView *topColorView;

@property (nonatomic, assign) float height;

@property (nonatomic,strong) NSMutableArray *timeArray;

@property (nonatomic,strong) JCKellyDataModelPayInfoModel *buyInfoModel;




@end

@implementation JCJingCaiAIBigDataStickVC

- (NSArray *)titleArray {
    if (!_titleArray) {
        _titleArray = @[@""];
    }
    return _titleArray;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationBarStyle = JCNavigationBarStyleTransparent;
//    [self initViews];
    if (!self.topColorView) {
        [self setupColorView];
    }else{
        [self setNavEffect];
    }


}

- (void)setNavEffect {

    CGFloat offsetY = self.contentView.contentOffset.y;
    CGFloat maxOffsetY = AUTO(208);
    float percent = offsetY/maxOffsetY;
    self.topColorView.alpha = percent;
//    NSLog(@"%.2f",percent);
//    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    if (percent>=1) {
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

}

- (instancetype)init {
    
    if (self = [super init]) {
        self.height = kWJingCaiBigDataHeaderViewHeight;
        self.titleSizeNormal = 16;
        self.titleSizeSelected = 16;
        self.titleColorSelected = COLOR_2F2F2F;//COLOR_FE1F19
        self.titleColorNormal = [COLOR_2F2F2F colorWithAlphaComponent:0.6];
        self.menuViewStyle = WMMenuViewStyleLine;
        self.progressWidth = 32;
        self.progressColor = JCBaseColor;
        self.progressViewBottomSpace = 1;
        self.viewTop = kWJingCaiBigDataHeaderViewHeight;
        self.menuViewHeight = kWMMenuViewHeight;
//        self.progressColor = [UIColor redColor];
        self.menuItemWidth = SCREEN_WIDTH/4.0f;
        self.maximumHeaderViewHeight = AUTO(300);
//        self.minimumHeaderViewHeight = kNavigationBarHeight;

        self.contentView.bounces = YES;
    }
    return self;
}

- (void)viewDidLoad {

//    self.view.backgroundColor = [UIColor greenColor]
        [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = JCNavColor;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getTopInfoData) name:NotificationUserLogin object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getTopInfoData) name:NotificationUserLogout object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getTopInfoData) name:JingcaiAIProduceBuy object:nil];//包月购买
    [self initViews];
    [self getTopInfoData];
    [self getDataInfoData];
//    [self getTimeList];
    
    UIButton *customView = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    [customView addTarget:self action:@selector(backItemClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:customView];
    
    UIButton *exampleView = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    [exampleView addTarget:self action:@selector(exampleItemClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:exampleView];

}

- (void)backItemClick {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)exampleItemClick {
    [self.navigationController pushViewController:[JCJingCaiAIBigDataHomeVC new] animated:YES];
}

- (void)getDataInfoData {
    [self.jcWindow showLoading];
    JCDataBaseService_New *service = [JCDataBaseService_New service];
    [service getBigDataTopInfoWithsuccess:^(id  _Nullable object) {
        [self.jcWindow endLoading];
        [self.contentView.mj_header endRefreshing];
        if ([JCWJsonTool isSuccessResponse:object]) {
            JCBigDataMonthProduceModel *productModel = (JCBigDataMonthProduceModel *)[JCWJsonTool entityWithJson:object[@"data"] class:[JCBigDataMonthProduceModel class]];
            NSArray *noticeArray = [JCWJsonTool arrayWithJson:object[@"data"][@"now_match"] class:[JCJingCaiAINoticeModel class]];
            self.headView.productModel = productModel;
            self.headView.titleArray = noticeArray;
            
            NSArray*mzArray = [JCWJsonTool arrayWithJson:object[@"data"][@"win_mark"] class:[JCBigDataMingZhongModel class]];
//            mzArray = @[];
            self.headView.dataArray = mzArray;
//            self.height = kWJingCaiBigDataHeaderViewHeight;
            
            self.height = AUTO(208)+NavigationStatusBarHeight+AUTO(117)+AUTO(0);
            if (noticeArray.count>0) {
                self.height = AUTO(262)+NavigationStatusBarHeight+AUTO(117)+AUTO(0);
            }
            if (mzArray.count>0) {
                self.height =self.height+ AUTO(28)*mzArray.count+AUTO(80);
            }
            self.headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, self.height);
        
//            self.height = 300;
            
            self.maximumHeaderViewHeight = self.height-kNavigationBarHeight-AUTO(77);
            self.viewTop = self.height;
//            [self reloadData];
        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        [self.contentView.mj_header endRefreshing];
        [self.jcWindow endLoading];
    }];


}

- (void)getTopInfoData {
    [self.timeArray removeAllObjects];
    [self.jcWindow showLoading];
    JCDataBaseService_New *service = [JCDataBaseService_New service];
    [service getDataModelPayInfoWithModel_id:self.model_id Success:^(id  _Nullable object) {
        [self.jcWindow endLoading];
        [self.contentView.mj_header endRefreshing];
        if ([JCWJsonTool isSuccessResponse:object]) {
            JCKellyDataModelPayInfoModel *buyInfoModel = (JCKellyDataModelPayInfoModel *)[JCWJsonTool entityWithJson:object[@"data"] class:[JCKellyDataModelPayInfoModel class]];
            NSString *today = [NSDate timeStringWithIntervalWithFormat:@"yyyy-MM-dd" time:buyInfoModel.server_time];
            self.dataVC.date = today;
//            buyInfoModel.show_status = 2;
//            buyInfoModel.model_status = 4;
            self.headView.model = buyInfoModel;
            [self initTimeArrayWithToday:buyInfoModel.server_time];

            self.buyInfoModel = buyInfoModel;
//            self.dataVC.buyInfoModel = self.buyInfoModel;
            [self.dataVC refreshData];


        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        [self.contentView.mj_header endRefreshing];
        [self.jcWindow endLoading];
    }];



}

- (void)initViews {
    self.headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, kWJingCaiBigDataHeaderViewHeight);
    [self.view addSubview:self.headView];
    WeakSelf;
    self.headView.JCBuyClickBlock = ^{
        [weakSelf payAction];
    };
    
    self.contentView.mj_header = [JCFootBallHeader headerWithRefreshingBlock:^{
        [weakSelf getTopInfoData];
        [weakSelf getDataInfoData];
        [weakSelf.dataVC refreshData];
    }];
        
    self.headView.JCTimeBlock = ^(NSString * _Nonnull time) {
        weakSelf.dataVC.date = time;
        [weakSelf.dataVC refreshData];
    };

    


}

- (void)backBtnClick {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];

//    self.headView.frame = CGRectMake(0, headerViewX, CGRectGetWidth(self.view.bounds), self.height);
}




- (void)payAction {
    if (![JCWUserBall currentUser]) {
        [self presentLogin];
        return;
    }
    if (self.buyInfoModel.show_status==1) {
        //免费体验
        [self FreeExperienceCheck];
        return;
    }
    if (self.buyInfoModel.show_status==2) {
        if (self.buyInfoModel.model_status==1) {
            //免费体验中不能续费
            return;
        }
        if (self.buyInfoModel.model_status==3) {
            //下架不能购买
            return;
        }
        if (self.buyInfoModel.model_status==4) {
            //免费,不能购买
            return;
        }
    }
    if (self.buyInfoModel.show_status==4) {
        //下架
        return;
    }

    [self showPayView];
    
}

- (void)showPayView {
    WeakSelf;
    JCPayShowView *payView = [JCPayShowView new];
    payView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
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
    NSString *title = [NSString stringWithFormat:@"是否开通[凯利指数] %@天免费体验",self.buyInfoModel.free_day];
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:title];
    NSRange count_range = [title rangeOfString:self.buyInfoModel.free_day];
    if (count_range.location!=NSNotFound) {
        [attr addAttributes:@{NSForegroundColorAttributeName:JCBaseColor} range:count_range];
    }

    
    alertView.contentLab.attributedText = attr;
    alertView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    [[UIApplication sharedApplication].keyWindow addSubview:alertView];
}

//免费体验
- (void)FreeExperience {
    
    [self.jcWindow showLoading];
    JCDataBaseService_New *service = [JCDataBaseService_New service];
    [service getKellyDataModeFreeExperienceWithModel_id:self.model_id Success:^(id  _Nullable object) {
        [self.jcWindow endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
            [self getTopInfoData];
        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

        
    } failure:^(NSError * _Nonnull error) {
        [self.jcWindow endLoading];
    }];



}

//确认购买
- (void)sureBuy {
    if (self.buyInfoModel.big_data_price>0&&[[JCWUserBall currentUser].prize floatValue]<self.buyInfoModel.big_data_price) {
        [JCWToastTool showHint:@"红币余额不足,请及时充值"];
        [self.navigationController pushViewController:[JCChargeVC new] animated:YES];
        return;
    }
    
    NSString *scene = @"7";
    //1.鲸猜大数据 2指数异动 3历史同赔 4泊松分布 5凯利指数 6.离散指数
    [self.jcWindow showLoading];
    JCHomeService_New *service = [JCHomeService_New new];
    [service getConfirmOrderWithUnique:self.model_id scene:scene source:@"1" price:@"" Success:^(id  _Nullable object) {
        [self.jcWindow endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
            NSString *order_key = object[@"data"][@"order_key"];
            [self finalPayWithOrder_key:order_key coupon_id:@"" hongbao_id:@""];

        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        [self.jcWindow endLoading];
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

#pragma mark - ScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [super scrollViewDidScroll:scrollView];
    if (scrollView.contentOffset.y < 0) {
        [self.view setNeedsLayout];
    }
    [self setNavEffect];
//    if ([scrollView isKindOfClass:[WMMagicScrollView class]]) {
//        if (scrollView.contentOffset.y>AUTO(50)) {
//            self.autherHeadView.bgView.hidden = YES;
////            self.title = self.expertDetailModel.user_name;
//        }else {
//            self.autherHeadView.bgView.hidden = NO;
////            self.title = @"";
//        }
//    }

    NSLog(@"%.0f",scrollView.contentOffset.y);
}

#pragma mark - Datasource & Delegate
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController {
    return self.titleArray.count;
}

- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
//    if (index==0) {
//        return self.bigDataVC;
//    }
    return self.dataVC;

}

- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    return self.titleArray[index];
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForMenuView:(WMMenuView *)menuView {

    self.lineView.frame = CGRectMake(0, kWMMenuViewHeight-1, SCREEN_WIDTH, 1);
    [menuView addSubview:self.lineView];
    return CGRectMake(0, _viewTop, self.view.frame.size.width, kWMMenuViewHeight);

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
    
    UILabel *titleLab = [UILabel initWithTitle:@"鲸猜大数据报告" andFont:17 andWeight:3 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    [self.topColorView addSubview:titleLab];
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(backBtn);
        make.centerX.equalTo(self.topColorView);
    }];
    
    UIButton *exampleBtn = [UIButton initWithText:@"示例" FontSize:AUTO(14) Weight:2 BackGroundColor:JCClearColor TextColors:UIColorFromRGB(0x0085C7)];
    [self.topColorView addSubview:exampleBtn];
    [exampleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(0);
        make.centerY.equalTo(backBtn);
        make.size.mas_equalTo(CGSizeMake(60, 44));
    }];
//    [exampleBtn addTarget:self action:@selector(exampleBtnClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)initTimeArrayWithToday:(long)long_today {
    NSString *today = [NSDate timeStringWithIntervalWithFormat:@"yyyy-MM-dd" time:long_today];
    NSString *today_week = [NSDate getChineseWeekFrom:today format:@"yyyy-MM-dd"];
    NSDate *today_date = [NSDate dateWithString:today format:@"yyyy-MM-dd"];
    NSString *today_String_short = [NSDate timeStringWithDate:today_date format:@"MM-dd"];
    NSLog(@"%@-%@",today_String_short,today_week);
    
    {
        for (int i=-5; i<0; i++) {
            NSDate *lastDay = [NSDate getDate:today_date day:i];
            NSString *last_String_short = [NSDate timeStringWithDate:lastDay format:@"MM-dd"];
            NSString *last_String = [NSDate timeStringWithDate:lastDay format:@"yyyy-MM-dd"];
            NSString *last_week = [NSDate getWeekZhouFromDate:lastDay];
            JCMatchTimeModel *lastModel = [JCMatchTimeModel new];
            lastModel.week = last_week;
            lastModel.sort_time = last_String_short;
            lastModel.time = last_String;
            [self.timeArray addObject:lastModel];
        }


    }
    
    JCMatchTimeModel *todayModel = [JCMatchTimeModel new];
    todayModel.week = @"今天";
    todayModel.sort_time = today_String_short;
    todayModel.time = today;
    todayModel.select = YES;
    [self.timeArray addObject:todayModel];
    
    {
        NSDate *tomorrowDay = [NSDate getDate:today_date day:1];
        NSString *tomorrow_String_short = [NSDate timeStringWithDate:tomorrowDay format:@"MM-dd"];
        NSString *tomorrow_String = [NSDate timeStringWithDate:tomorrowDay format:@"yyyy-MM-dd"];
        NSString *tomorrow_week = [NSDate getWeekZhouFromDate:tomorrowDay];
        JCMatchTimeModel *tomorrowModel = [JCMatchTimeModel new];
        tomorrowModel.week = tomorrow_week;
        tomorrowModel.sort_time = tomorrow_String_short;
        tomorrowModel.time = tomorrow_String;
        [self.timeArray addObject:tomorrowModel];

    }
    //
        self.headView.dateHeadView.currentModel = todayModel;
        self.headView.dateHeadView.currentDay = today_String_short;
//            self.dateHeadView.hidden = NO;
        self.headView.dateHeadView.dataArray = [NSMutableArray arrayWithArray:self.timeArray];
    NSLog(@"%@",self.timeArray);
    
}
- (JCJingCaiAIBigDataHomeVC *)bigDataVC {
    if (!_bigDataVC) {
        _bigDataVC = [JCJingCaiAIBigDataHomeVC new];
    }
    return _bigDataVC;
}

- (JCJingCaiAIBigDataMatchListVC *)dataVC {
    if (!_dataVC) {
        _dataVC = [JCJingCaiAIBigDataMatchListVC new];
    }
    return _dataVC;
}

- (JCJingCaiAIBigDataHeadView *)headView {
    if (!_headView) {
        _headView = [JCJingCaiAIBigDataHeadView new];
    }
    return _headView;
}
- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [UIView new];
        _lineView.backgroundColor = COLOR_DDDDDD;
    }
    return _lineView;;
}
- (NSMutableArray *)timeArray {
    if (!_timeArray) {
        _timeArray = [NSMutableArray array];
    }
    return _timeArray;
}
@end
