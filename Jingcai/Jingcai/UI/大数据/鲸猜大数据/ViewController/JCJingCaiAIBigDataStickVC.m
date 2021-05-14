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
static CGFloat const kWMMenuViewHeight = 44.0;

@interface JCJingCaiAIBigDataStickVC ()

@property (nonatomic,strong) UIView *lineView;

@property (nonatomic, strong) NSArray *titleArray;

@property (nonatomic, strong) JCJingCaiAIBigDataHomeVC *bigDataVC;

@property (nonatomic, strong) JCJingCaiAIBigDataMatchListVC *matchVC;

@property (nonatomic, strong) JCJingCaiAIBigDataHeadView *headView;

@property (nonatomic, assign) float height;


@end

@implementation JCJingCaiAIBigDataStickVC

- (NSArray *)titleArray {
    if (!_titleArray) {
        _titleArray = @[@"大数据实例",@"预测的比赛"];
    }
    return _titleArray;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    [self initViews];

}


- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
//      self.navigationBarStyle = JCNavigationBarStyleTransparent;

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
        self.maximumHeaderViewHeight = kWJingCaiBigDataHeaderViewHeight;
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
}

- (void)getTopInfoData {
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
            self.headView.dataArray = mzArray;
//            self.height = kWJingCaiBigDataHeaderViewHeight;
            
            self.height = AUTO(200);
            if (noticeArray.count>0) {
                self.height = AUTO(240);
            }
            if (mzArray.count>0) {
                self.height =self.height+ AUTO(20)*mzArray.count+AUTO(70);
            }
            self.headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, self.height);
        
            self.viewTop = self.height;
            self.maximumHeaderViewHeight = self.height;
//            [self reloadData];
        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        [self.jcWindow endLoading];
    }];


}

- (void)initViews {

    self.headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, kWJingCaiBigDataHeaderViewHeight);
    [self.view addSubview:self.headView];
    
    WeakSelf;
    self.headView.JCBuyClickBlock = ^{
        if (![JCWUserBall currentUser]) {
            [weakSelf presentLogin];
            return;
        }
        JCJingCaiAIBigDataBuyVC *vc = [JCJingCaiAIBigDataBuyVC new];
        [weakSelf.navigationController pushViewController:vc animated:YES];
    };
    
    self.contentView.mj_header = [JCFootBallHeader headerWithRefreshingBlock:^{
        [weakSelf getTopInfoData];
        if (weakSelf.selectIndex==0) {
            [weakSelf.bigDataVC refreshData];
        }
        if (weakSelf.selectIndex==1) {
            [weakSelf.matchVC refreshData];
        }
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
    if (index==0) {
        return self.bigDataVC;
    }
    return self.matchVC;

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
    return CGRectMake(0, originY, self.view.frame.size.width, self.view.frame.size.height-kWMMenuViewHeight-AUTO(10));
}

- (void)pageController:(WMPageController *)pageController willEnterViewController:(__kindof UIViewController *)viewController withInfo:(NSDictionary *)info {

}

- (JCJingCaiAIBigDataHomeVC *)bigDataVC {
    if (!_bigDataVC) {
        _bigDataVC = [JCJingCaiAIBigDataHomeVC new];
    }
    return _bigDataVC;
}

- (JCJingCaiAIBigDataMatchListVC *)matchVC {
    if (!_matchVC) {
        _matchVC = [JCJingCaiAIBigDataMatchListVC new];
    }
    return _matchVC;
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

@end
