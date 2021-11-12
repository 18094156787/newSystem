//
//  JCPoissonDataModelStickVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/10.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCPoissonDataModelStickVC.h"
#import "JCHistoryPayHeadView.h"
#import "JCPoissonDataModelVC.h"
#import "NSDate+BRPickerView.h"
#import "JCMatchTimeModel.h"
#import "JCPayShowView.h"
static CGFloat const kWMMenuViewHeight = 0;
@interface JCPoissonDataModelStickVC ()

@property (nonatomic, strong) JCHistoryPayHeadView *headView;

@property (nonatomic, strong) JCPoissonDataModelVC *dataVC;

@property (nonatomic, strong) NSArray *titleArray;

@property (nonatomic,strong) UIView *topColorView;

@property (nonatomic, assign) float height;

@property (nonatomic,strong) NSString *time;

@property (nonatomic,strong) NSArray *timeArray;

@end

@implementation JCPoissonDataModelStickVC

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
        self.height = AUTO(280)+kNavigationBarHeight;
        self.titleSizeNormal = 16;
        self.titleSizeSelected = 16;
        self.titleColorSelected = COLOR_2F2F2F;//COLOR_FE1F19
        self.titleColorNormal = [COLOR_2F2F2F colorWithAlphaComponent:0.6];
        self.menuViewStyle = WMMenuViewStyleLine;
        self.progressWidth = 32;
        self.progressColor = JCBaseColor;
        self.progressViewBottomSpace = 1;
        self.viewTop = AUTO(280)+kNavigationBarHeight;
        self.menuViewHeight = kWMMenuViewHeight;
//        self.progressColor = [UIColor redColor];
        self.menuItemWidth = SCREEN_WIDTH/4.0f;
        self.maximumHeaderViewHeight = self.height-kNavigationBarHeight-AUTO(72);
//        self.minimumHeaderViewHeight = kNavigationBarHeight;

        self.contentView.bounces = YES;
    }
    return self;
}

- (void)viewDidLoad {

//    self.view.backgroundColor = [UIColor greenColor]
        [super viewDidLoad];
    [self initViews];
//    [self getTopInfoData];
    [self getTimeList];
    
    UIButton *customView = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    [customView addTarget:self action:@selector(backItemClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:customView];
    
}

- (void)backItemClick {
    [self.navigationController popViewControllerAnimated:YES];
}


//- (void)getTopInfoData {
//    [self.jcWindow showLoading];
//    JCDataBaseService_New *service = [JCDataBaseService_New service];
//    [service getBigDataTopInfoWithsuccess:^(id  _Nullable object) {
//        [self.jcWindow endLoading];
//        [self.contentView.mj_header endRefreshing];
//        if ([JCWJsonTool isSuccessResponse:object]) {
//            JCBigDataMonthProduceModel *productModel = (JCBigDataMonthProduceModel *)[JCWJsonTool entityWithJson:object[@"data"] class:[JCBigDataMonthProduceModel class]];
//            NSArray *noticeArray = [JCWJsonTool arrayWithJson:object[@"data"][@"now_match"] class:[JCJingCaiAINoticeModel class]];
//            self.headView.productModel = productModel;
//            self.headView.titleArray = noticeArray;
//
//            NSArray*mzArray = [JCWJsonTool arrayWithJson:object[@"data"][@"win_mark"] class:[JCBigDataMingZhongModel class]];
////            mzArray = @[];
//            self.headView.dataArray = mzArray;
////            self.height = kWJingCaiBigDataHeaderViewHeight;
//
//            self.height = AUTO(208)+NavigationStatusBarHeight+AUTO(117)+AUTO(12);
//            if (noticeArray.count>0) {
//                self.height = AUTO(262)+NavigationStatusBarHeight+AUTO(117)+AUTO(12);
//            }
//            if (mzArray.count>0) {
//                self.height =self.height+ AUTO(28)*mzArray.count+AUTO(80);
//            }
//            self.headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, self.height);
//
////            self.height = 300;
//
//            self.maximumHeaderViewHeight = self.height-kNavigationBarHeight-AUTO(77);
//            self.viewTop = self.height;
////            [self reloadData];
//        }else{
//            [JCWToastTool showHint:object[@"msg"]];
//        }
//
//    } failure:^(NSError * _Nonnull error) {
//        [self.contentView.mj_header endRefreshing];
//        [self.jcWindow endLoading];
//    }];
//
//
//}

- (void)getTimeList {
    JCMatchService_New * service = [JCMatchService_New new];
    [service getMatchTimeListWithType:@"1" success:^(id  _Nullable object) {
//        [self endRefresh];
         
        if ([JCWJsonTool isSuccessResponse:object]) {
            NSString *today = object[@"data"][@"time"];
            self.time = today;
//            [self refreshData];
            NSArray *timeArray = [JCWJsonTool arrayWithJson:object[@"data"][@"time_array"] class:[JCMatchTimeModel class]];
            self.timeArray = timeArray;
//            if ([self.type integerValue]==2) {
//                timeArray =  [[timeArray reverseObjectEnumerator] allObjects];
//            }
            if (today.length>0) {
                NSDate *today_date = [NSDate br_getDate:today format:@"yyyy-MM-dd"];
                [timeArray enumerateObjectsUsingBlock:^(JCMatchTimeModel *obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    NSDate *another_date = [NSDate br_getDate:obj.time format:@"yyyy-MM-dd"];
                    NSInteger result = [today_date br_compare:another_date format:@"yyyy-MM-dd"];
                    if (result==0) {
                        obj.select = YES;
                        self.headView.dateHeadView.currentModel = obj;
                        *stop = YES;
                    }
                }];
            }
            self.headView.dateHeadView.currentDay = self.time;
//            self.dateHeadView.hidden = NO;
            self.headView.dateHeadView.dataArray = [NSMutableArray arrayWithArray:timeArray];
            


        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {

    }];

    
}

- (void)initViews {

    self.headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, self.height);
    [self.view addSubview:self.headView];
    
    WeakSelf;
    self.headView.JCBuyClickBlock = ^{
//        if (![JCWUserBall currentUser]) {
//            [weakSelf presentLogin];
//            return;
//        }
//        JCJingCaiAIBigDataBuyVC *vc = [JCJingCaiAIBigDataBuyVC new];
//        [weakSelf.navigationController pushViewController:vc animated:YES];
        
        JCPayShowView *payView = [JCPayShowView new];
        payView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        [weakSelf.jcWindow addSubview:payView];
        payView.JCSureBlock = ^(NSString * _Nonnull hb_id) {
//          [payView ]
        };
        [payView show];
    };
    
    self.contentView.mj_header = [JCFootBallHeader headerWithRefreshingBlock:^{
//        [weakSelf getTopInfoData];
//        if (weakSelf.selectIndex==0) {
//            [weakSelf.bigDataVC refreshData];
//        }
//        if (weakSelf.selectIndex==1) {
//            [weakSelf.matchVC refreshData];
//        }
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
    self.headView.dateHeadView.clearBg = self.dataVC.isTop?NO:YES;
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
    if (!self.dataVC) {
        self.dataVC = [JCPoissonDataModelVC new];
    }
    return self.dataVC;

}

- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    return self.titleArray[index];
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForMenuView:(WMMenuView *)menuView {
    return CGRectMake(0, _viewTop, self.view.frame.size.width, kWMMenuViewHeight);

}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForContentView:(WMScrollView *)contentView {
    CGFloat originY = _viewTop + kWMMenuViewHeight;
    return CGRectMake(0, originY, self.view.frame.size.width, self.view.frame.size.height-kWMMenuViewHeight-AUTO(10));
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
    
    UILabel *titleLab = [UILabel initWithTitle:@"泊松分布" andFont:17 andWeight:3 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    [self.topColorView addSubview:titleLab];
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(backBtn);
        make.centerX.equalTo(self.topColorView);
    }];
    

}


- (JCHistoryPayHeadView *)headView {
    if (!_headView) {
        _headView = [JCHistoryPayHeadView new];
        _headView.type = 1;
    }
    return _headView;
}

@end
