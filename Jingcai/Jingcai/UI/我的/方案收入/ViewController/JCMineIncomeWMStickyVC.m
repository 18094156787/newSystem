//
//  JCMineIncomeWMStickyVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/8/31.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCMineIncomeWMStickyVC.h"
#import "JCMineIncomeTopView.h"
#import "JCIncomeDetailVC.h"
#import "JCWithDrawRecordVC.h"
#import "JCMyIncomeDetailModel.h"
static CGFloat const kWMMenuViewHeight = 44;
@interface JCMineIncomeWMStickyVC ()

@property (nonatomic, strong) JCMineIncomeTopView *topHeadView;

@property (nonatomic,assign) float headerViewHeigh;

@property (nonatomic, strong) NSArray *titleArray;

@end

@implementation JCMineIncomeWMStickyVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationBarStyle = JCNavigationBarStyleTransparent;
    [self setNavBackImg];
}



- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
//    self.navigationBarStyle = JCNavigationBarStyleDefault;
}

- (instancetype)init {
    if (self = [super init]) {
        self.headerViewHeigh = AUTO(230)+kNavigationBarHeight;

        self.menuViewStyle = WMMenuViewStyleLine;
        self.progressViewBottomSpace = 1;
        self.progressColor= JCBaseColor;
        self.titleColorSelected = COLOR_2F2F2F;
        self.titleColorNormal = COLOR_2F2F2F;
        self.titleSizeNormal = 14;
        self.titleSizeSelected = 14;
        self.progressHeight = 2;
        self.progressWidth = AUTO(28);
        self.viewTop = self.headerViewHeigh;
//       self.itemsMargins = @[@(1),@(1),@(AUTO(200))];
//        self.maximumHeaderViewHeight = 30+NavigationStatusBarHeight-kBottomTabSafeAreaHeight;
        self.maximumHeaderViewHeight =   AUTO(230)+kNavigationBarHeight;
        self.minimumHeaderViewHeight = AUTO(230)+kNavigationBarHeight;
//        self.itemsMargins =
//        self.menuItemWidth = AUTO(100);
        self.automaticallyCalculatesItemWidths = YES;
//        self.titleFontName = @"PingFangSC-Medium";
        self.contentView.bounces = NO;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = COLOR_A32020;
    self.title = @"方案收入";
    self.topHeadView.frame = CGRectMake(0, 0, SCREEN_WIDTH, self.headerViewHeigh);
    [self.view addSubview:self.topHeadView];
    [self initView];
    [self refreshData];
}
- (void)initView {
    WeakSelf;
    self.topHeadView.JCRefreshBlock = ^{
        NSLog(@"刷新");
        [weakSelf refreshData];
    };
//    self.contentView.mj_header = [JCFootBallHeader headerWithRefreshingBlock:^{
////        self.pageNo = 1;
////        [self refreshData];
//    }];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [self addCornerWithView:self.menuView type:UIRectCornerTopLeft|UIRectCornerTopRight size:CGSizeMake(20, 20)];
//    CGFloat headerViewHeight = self.headerViewHeigh;
////    CGFloat headerViewHeight = self.headerViewHeigh;
//    CGFloat headerViewX = 0;
//    UIScrollView *scrollView = (UIScrollView *)self.view;
//    if (scrollView.contentOffset.y < 0) {
//        headerViewX = scrollView.contentOffset.y;
//        headerViewHeight -= headerViewX;
//
//    }
//    self.topHeadView.frame = CGRectMake(0, headerViewX, SCREEN_WIDTH, self.headerViewHeigh);
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
//    if (scrollView.contentOffset.y < 0) {
////        [self.view setNeedsLayout];
//        scrollView.contentOffset = CGPointZero;
//    }
//    CGFloat offsetY = self.contentView.contentOffset.y;
//    CGFloat maxOffsetY = AUTO(160);
//    float percent = offsetY/maxOffsetY;

//    if (percent>=1) {
//        self.topHeadView.topBgView.alpha = 0;
//
//    }else{
//        self.topHeadView.topBgView.alpha = 1-percent;
//
//    }
//
//
//    NSLog(@"%.0f",scrollView.contentOffset.y);
}

#pragma mark - Datasource & Delegate
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController {
    return self.titleArray.count;
}

- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
    if (index==0) {
        JCIncomeDetailVC *vc = [JCIncomeDetailVC new];
        return vc;
    }
    JCWithDrawRecordVC *detailVC = [JCWithDrawRecordVC new];
    return detailVC;
}

- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    return self.titleArray[index];
}


- (CGRect)pageController:(WMPageController *)pageController preferredFrameForMenuView:(WMMenuView *)menuView {
    menuView.backgroundColor = JCWhiteColor;
    return CGRectMake(0, _viewTop,SCREEN_WIDTH, kWMMenuViewHeight);

}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForContentView:(WMScrollView *)contentView {
    CGFloat originY = _viewTop + kWMMenuViewHeight;
    return CGRectMake(0, originY, SCREEN_WIDTH, SCREEN_HEIGHT-kWMMenuViewHeight-self.headerViewHeigh);
}

- (void)refreshData {
    [self.view showLoading];
    JCUserService_New *service = [JCUserService_New service];
    [service getMyIncomeDetailTopInfoWithsuccess:^(id  _Nullable object) {
        [self.view endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
            JCMyIncomeDetailModel *model = (JCMyIncomeDetailModel *)[JCWJsonTool entityWithJson:object[@"data"] class:[JCMyIncomeDetailModel class]];
            self.topHeadView.model = model;
        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        [self.view endLoading];
    }];


}

- (void)addCornerWithView:(UIView *)aView type:(UIRectCorner)aCorners size:(CGSize)aSize
{
    // 根据矩形画带圆角的曲线
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:aView.bounds byRoundingCorners:aCorners cornerRadii:aSize];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = aView.bounds;
    maskLayer.path = maskPath.CGPath;
    aView.layer.mask = maskLayer;
}



- (NSArray *)titleArray {
    if (!_titleArray) {
        _titleArray = @[@"收益明细",@"提现记录"];
    }
    return _titleArray;
}

- (JCMineIncomeTopView *)topHeadView {
    if (!_topHeadView) {
        _topHeadView = [JCMineIncomeTopView new];
    }
    return _topHeadView;
}

@end
