//
//  JCLoginWMStickVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/11/14.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCLoginWMStickVC.h"
#import "JCLoginWMHeadView.h"
#import "JCLoginViewController.h"
#import "JCSmsLoginViewController.h"
#import "IQKeyboardManager.h"
static CGFloat const kWMMenuViewHeight = 44;
static CGFloat const kWMMenuViewUserHeight = 134;
@interface JCLoginWMStickVC ()

@property (nonatomic, assign) float height;

@property (nonatomic, strong) NSArray *titleArray;

@property (nonatomic,strong) UIView *lineView;

@property (nonatomic, strong) JCLoginWMHeadView *topHeadView;

@end

@implementation JCLoginWMStickVC

- (NSArray *)titleArray {
    if (!_titleArray) {
        _titleArray = @[@"账号登录",@"短信登录"];
    }
    return _titleArray;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
     self.navigationBarStyle = JCNavigationBarStyleTransparent;
    [self hideNavShadow];
    [self setNavBackImg];
    
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"signin_logo_topAlpha"] forBarMetrics:UIBarMetricsDefault];
}


- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
      self.navigationBarStyle = JCNavigationBarStyleDefault;

}

- (instancetype)init {
    if (self = [super init]) {
        self.height = kWMMenuViewUserHeight+kNavigationBarHeight;
        self.titleSizeNormal = 15;
        self.titleSizeSelected = 15;
        self.menuViewStyle = WMMenuViewStyleLine;
        self.progressColor = JCBaseColor;
        self.progressWidth = AUTO(28);
        self.progressViewBottomSpace = 1;
        self.viewTop = self.height;
        self.menuViewHeight = kWMMenuViewHeight;
        self.maximumHeaderViewHeight = kWMMenuViewUserHeight;
        self.minimumHeaderViewHeight = 0;
//        self.contentView.bounces = NO;
        self.titleColorSelected = COLOR_2F2F2F;
        self.titleColorNormal = COLOR_2F2F2F;
    }
    return self;
}




- (void)viewDidLoad {

    [super viewDidLoad];
    self.title = @"";
    self.view.backgroundColor = JCWhiteColor;
    self.scrollView.shouldIgnoreScrollingAdjustment = YES;
    self.scrollView.shouldRestoreScrollViewContentOffset = YES;
    self.topHeadView = [[JCLoginWMHeadView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, kWMMenuViewUserHeight)];
    self.topHeadView.backgroundColor = JCWhiteColor;
    [self.view addSubview:self.topHeadView];
//    [self initViews];
 

}


- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    CGFloat headerViewHeight = self.height;
//    CGFloat headerViewHeight = kWMMenuViewUserHeight;
    CGFloat headerViewX = 0;
    UIScrollView *scrollView = (UIScrollView *)self.view;
    if (scrollView.contentOffset.y < 0) {
        headerViewX = scrollView.contentOffset.y;
        headerViewHeight -= headerViewX;

    }
    self.topHeadView.frame = CGRectMake(0, headerViewX, CGRectGetWidth(self.view.bounds), self.height);

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
     CGFloat offsetY = self.contentView.contentOffset.y;
     CGFloat maxOffsetY = kWMMenuViewUserHeight;
     float percent = offsetY/maxOffsetY;
     
//     if (percent>=1) {
//         self.topHeadView.alpha = 0;
//     }else{
//         self.topHeadView.alpha = 1-percent;
//     }

}

#pragma mark - Datasource & Delegate
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController {
    return self.titleArray.count;
}

- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
    if (index==0) {
        return [JCLoginViewController new];
    }
     return [JCSmsLoginViewController new];
}

- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    return self.titleArray[index];
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForMenuView:(WMMenuView *)menuView {
    menuView.backgroundColor = JCWhiteColor;
    menuView.backgroundColor = JCWhiteColor;
    self.lineView.frame = CGRectMake(0, 43, SCREEN_WIDTH, 0.5);
    [menuView addSubview:self.lineView];
    return CGRectMake(0, _viewTop+1, self.view.frame.size.width, kWMMenuViewHeight);

}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForContentView:(WMScrollView *)contentView {
    CGFloat originY = _viewTop+kWMMenuViewHeight;
    return CGRectMake(0, originY, self.view.frame.size.width, SCREEN_HEIGHT-NavigationStatusBarHeight-kBottomTabSafeAreaHeight-kWMMenuViewUserHeight);
}
- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [UIView new];
        _lineView.backgroundColor = COLOR_DDDDDD;
    }
    return _lineView;;
}
@end
