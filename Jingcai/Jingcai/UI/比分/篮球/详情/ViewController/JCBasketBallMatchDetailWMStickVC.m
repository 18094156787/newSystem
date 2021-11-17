//
//  JCBasketBallMatchDetailWMStickVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/4.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBasketBallMatchDetailWMStickVC.h"
#import "JCBasketMatchDetailTopView.h"
#import "JCBasketBallMatchFanganVC.h"
#import "JCBasketMatchDetailZBVC.h"
#import "JCBasketBallMatchTongJiC.h"
#import "JCMatchDetailZSVC.h"
#import "JNMatchDetailZRVC.h"
#import "JNMatchDetailSJVC.h"
#import "JCMatchDetailTopTitleView.h"
#import "JCBasketBallMatchZhiShuVC.h"
static CGFloat const kWMMenuViewHeight = 44;
@interface JCBasketBallMatchDetailWMStickVC ()

@property (nonatomic, strong) NSArray *titleArray;

@property (nonatomic,strong) UIView *lineView;

@property (nonatomic, strong) JCBasketMatchDetailTopView *topHeadView;

@property (strong, nonatomic) JCMatchDetailZSVC * zsVC;

@property (strong, nonatomic) JNMatchDetailZRVC * zrVC;

@property (strong, nonatomic) JNMatchDetailSJVC * sjVC;

@property (strong, nonatomic) JCBasketBallMatchBall * matchBall;

@property (strong, nonatomic) UILabel *titleLab;

@property (strong, nonatomic) JCMatchDetailTopTitleView *titleView;

@property (strong, nonatomic) UIImageView *topImgView;

@property (nonatomic, assign) float height;

@property (nonatomic, assign) BOOL hideNavBar;

@end

@implementation JCBasketBallMatchDetailWMStickVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationBarStyle = JCNavigationBarStyleDefault;
    UIImageView * navBarHairlineImageView = [self findHairlineImageViewUnder:self.navigationController.navigationBar];
    navBarHairlineImageView.hidden = YES;
    [self setNavBackImgWhiteColor];

    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    UIImage *navImg =[UIImage imageNamed:@"match_top_nav_basketBall"];
      navImg = [navImg resizableImageWithCapInsets:UIEdgeInsetsZero resizingMode:UIImageResizingModeStretch];
    [self.navigationController.navigationBar setBackgroundImage:navImg forBarMetrics:UIBarMetricsDefault];
    if (@available(iOS 15.0, *)) {
        [self configNavBarImage:@"match_top_nav_basketBall"];
    }
    self.navigationController.navigationBar.hidden = self.hideNavBar;
    

}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
//    [self setNavBackImgWhiteColor];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationBarStyle = JCNavigationBarStyleDefault;
    self.navigationController.navigationBar.hidden = NO;
    if (@available(iOS 15.0, *)) {
        [self configNavBarImageToNormal];
    }
}

- (NSArray *)titleArray {
    if (!_titleArray) {
        _titleArray = @[@"方案",@"直播",@"统计",@"指数"];
    }
    return _titleArray;
}

- (instancetype)init {
    if (self = [super init]) {
        self.height = kWMMatchDetailHeaderViewHeight;
        self.menuViewStyle = WMMenuViewStyleLine;
        self.progressViewBottomSpace = 1;
        self.progressColor= JCBaseColor;
        self.titleColorSelected = COLOR_2F2F2F;
        self.titleColorNormal = COLOR_2F2F2F;
        self.titleSizeNormal = 14;
        self.titleSizeSelected = 14;
        self.progressHeight = 2;
        self.progressWidth = 28;
        self.menuItemWidth = (SCREEN_WIDTH-AUTO(20))/6.0f;
        self.viewTop = kWMMatchDetailHeaderViewHeight;
        self.menuViewHeight = 0;
        self.maximumHeaderViewHeight = kWMMatchDetailHeaderViewHeight-kNavigationBarHeight;
        self.contentView.bounces = NO;
        if ([[NSUserDefaults standardUserDefaults] objectForKey:@"show_odds"]) {
            NSString *show = [[NSUserDefaults standardUserDefaults] objectForKey:@"show_odds"];
            self.show_odds = [show integerValue];
            if (self.show_odds==1) {
                self.titleArray = @[@"方案",@"直播",@"统计",@"指数"];
            }else{
                self.titleArray = @[@"方案",@"直播",@"统计"];
            }
        }else {
            self.titleArray = @[@"方案",@"直播",@"统计"];
        }

    }
    return self;
}

- (void)viewDidLoad {

//    self.view.backgroundColor = [UIColor greenColor]
        [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = COLOR_F0F0F0;
    [self initViews];
    [self loadMatchInfo];

    
}
- (void)initViews {

    
     self.titleView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 44);
     self.navigationItem.titleView = self.titleView;
    

    self.topHeadView.frame = CGRectMake(0, -kNavigationBarHeight, SCREEN_WIDTH, kWMMatchDetailHeaderViewHeight);
    self.topHeadView.bgImgView.image = JCIMAGE(@"match_top_bg_basketBall");
//    self.topHeadView.expertID = self.expertID;
    [self.view addSubview:self.topHeadView];
    WeakSelf;
    self.topHeadView.addAniBlock = ^(float height) {
        weakSelf.hideNavBar = YES;
        weakSelf.navigationController.navigationBar.hidden = YES;
        weakSelf.height = height;
        weakSelf.viewTop = weakSelf.height;
        weakSelf.maximumHeaderViewHeight = 0;
        [weakSelf.contentView scrollToTop];
        weakSelf.topHeadView.frame = CGRectMake(0, 0, CGRectGetWidth(weakSelf.view.bounds), weakSelf.height);
        
    };
    

    self.topHeadView.JCBackBlock = ^{
        weakSelf.hideNavBar = NO;
        if ([weakSelf.topHeadView.topView.subviews containsObject:weakSelf.topHeadView.wkWebView]) {
            weakSelf.navigationController.navigationBar.hidden = NO;
            [weakSelf.topHeadView.wkWebView removeFromSuperview];
            weakSelf.height = kWMMatchDetailHeaderViewHeight;
            weakSelf.viewTop = weakSelf.height;
            weakSelf.maximumHeaderViewHeight = kWMMatchDetailHeaderViewHeight-kNavigationBarHeight;
            [weakSelf.contentView scrollToTop];
            weakSelf.topHeadView.frame = CGRectMake(0, 0, CGRectGetWidth(weakSelf.view.bounds), weakSelf.height);
            return;
        }
        [weakSelf.navigationController popViewControllerAnimated:YES];
        
    };
    


}



- (void)loadMatchInfo {
    [self.view showLoading];
    WeakSelf;
    JCBasketBallMatchService_New * service = [JCBasketBallMatchService_New service];//3574634
    [service getMatchtDetailWithMatch_id:self.matchNum success:^(id  _Nullable object) {
        [weakSelf.view endLoading];
        
        if ([JCWJsonTool isSuccessResponse:object]) {
            JCBasketBallMatchBall * matchBall = (JCBasketBallMatchBall *)[JCWJsonTool entityWithJson:object[@"data"] class:[JCBasketBallMatchBall class]];
//            matchBall.is_ai = 3;
            weakSelf.matchBall = matchBall;
            weakSelf.topHeadView.basketBallMatch = matchBall;
//
            weakSelf.titleView.basketBallMatch = matchBall;
            
            weakSelf.titleLab.alpha =  0;
            weakSelf.titleLab.text= [NSString stringWithFormat:@"%@ VS %@",matchBall.home_name,matchBall.away_name];
            [weakSelf reloadData];
            return ;
        }
        [JCWToastTool showHint:object[@"msg"]];
    } failure:^(NSError * _Nonnull error) {
        [weakSelf.view endLoading];
        [JCWToastTool showHint:@"网络异常"];
    }];


}


- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];

    CGFloat headerViewHeight = kWMMatchDetailHeaderViewHeight;
//    CGFloat headerViewHeight = kWMMatchDetailHeaderViewHeight;
    CGFloat headerViewX = 0;
    UIScrollView *scrollView = (UIScrollView *)self.view;
    if (scrollView.contentOffset.y < 0) {
        headerViewX = scrollView.contentOffset.y;
        headerViewHeight -= headerViewX;

    }
    self.topHeadView.frame = CGRectMake(0, headerViewX-kNavigationBarHeight, CGRectGetWidth(self.view.bounds), self.height);
    self.topImgView.frame = CGRectMake(0, 0, SCREEN_WIDTH, kNavigationBarHeight);
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
    self.topImgView.frame = CGRectMake(0, 0, SCREEN_WIDTH, kNavigationBarHeight);
    if (scrollView.contentOffset.y < 0) {
        [self.view setNeedsLayout];
    }
    CGFloat offsetY = self.contentView.contentOffset.y;
    CGFloat maxOffsetY = self.height-kNavigationBarHeight;
    float percent = offsetY/maxOffsetY;
    if (percent>=1) {
        self.titleView.infoView.alpha = 0;
        self.titleView.matchView.alpha =  1;
    }else{
        self.titleView.infoView.alpha = 1-percent;
//        self.titleView.matchView.alpha = percent;
        self.titleView.matchView.alpha = 0;
    }
//    self.titleLab.alpha = 1;

    NSLog(@"%.2f",percent);
}

#pragma mark - Datasource & Delegate
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController {
    return self.titleArray.count;
}

- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
    if (index==0) {
        JCBasketBallMatchFanganVC *faVC = [JCBasketBallMatchFanganVC new];
//        faVC.matchNum = self.matchNum;
        faVC.matchBall = self.matchBall;
        return faVC;
    }
    if (index==1) {
        JCBasketMatchDetailZBVC *zbVC = [JCBasketMatchDetailZBVC new];
        zbVC.matchBall = self.matchBall;
        WeakSelf;
        zbVC.JCRefreshBlock = ^(JCBasketBallMatchBall * _Nonnull matchBall) {
            //同步直播中的比分数据到头部
            weakSelf.matchBall.home_scores_sum = matchBall.home_scores_sum;
            weakSelf.matchBall.home_scores_half_sum = matchBall.home_scores_half_sum;
            weakSelf.matchBall.away_scores_sum = matchBall.away_scores_sum;
            weakSelf.matchBall.away_scores_half_sum = matchBall.away_scores_sum;
            weakSelf.topHeadView.basketBallMatch = weakSelf.matchBall;
        };
        return zbVC;
    }
    if (index==2) {
        JCBasketBallMatchTongJiC *tongjiVC = [JCBasketBallMatchTongJiC new];
//        qbVC.matchBall = self.matchBall;
        tongjiVC.matchBall = self.matchBall;
        return tongjiVC;
    }
    JCBasketBallMatchZhiShuVC *zsVC = [JCBasketBallMatchZhiShuVC new];
    zsVC.matchBall = self.matchBall;
    return zsVC;
    

}

- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    return self.titleArray[index];
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForMenuView:(WMMenuView *)menuView {
    menuView.backgroundColor = JCWhiteColor;
    self.lineView.frame = CGRectMake(0, kWMMenuViewHeight-1, SCREEN_WIDTH, 1);
    [menuView addSubview:self.lineView];
    menuView.backgroundColor = JCWhiteColor;
    return CGRectMake(0, _viewTop-kNavigationBarHeight, SCREEN_WIDTH, kWMMenuViewHeight);

}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForContentView:(WMScrollView *)contentView {
    CGFloat originY = _viewTop + kWMMenuViewHeight;

    if (self.height>kWMMatchDetailHeaderViewHeight) {
        return CGRectMake(0, originY-kNavigationBarHeight, SCREEN_WIDTH, SCREEN_HEIGHT-kBottomTabSafeAreaHeight-kWMMenuViewHeight-self.height);
    }else{
        return CGRectMake(0, originY-kNavigationBarHeight, SCREEN_WIDTH, SCREEN_HEIGHT-kBottomTabSafeAreaHeight-kWMMenuViewHeight-kNavigationBarHeight);
    }
      
}


- (UIImageView *)findHairlineImageViewUnder:(UIView *)view {
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0) {
        return (UIImageView *)view;
    }
    for (UIView *subview in view.subviews) {
        UIImageView *imageView = [self findHairlineImageViewUnder:subview];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
}



- (JCBasketMatchDetailTopView *)topHeadView {
    if (!_topHeadView) {
        _topHeadView = [JCBasketMatchDetailTopView new];
    }
    return _topHeadView;
}



- (JCMatchDetailZSVC *)zsVC {
    if (!_zsVC) {
        _zsVC = [JCMatchDetailZSVC new];
    }
    return _zsVC;
}
- (JNMatchDetailZRVC *)zrVC {
    if (!_zrVC) {
        _zrVC = [JNMatchDetailZRVC new];
    }
    return _zrVC;
}
- (JNMatchDetailSJVC *)sjVC {
    if (!_sjVC) {
        _sjVC = [JNMatchDetailSJVC new];
    }
    return _sjVC;
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(18) andWeight:2 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _titleLab;
}

- (JCMatchDetailTopTitleView *)titleView {
    if (!_titleView) {
        _titleView = [JCMatchDetailTopTitleView new];
    }
    return _titleView;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [UIView new];
        _lineView.backgroundColor = COLOR_DDDDDD;
    }
    return _lineView;;
}

@end
