//
//  JCMatchDetailWMStickVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/16.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCMatchDetailWMStickVC.h"
#import "JNMatchDetailView_New.h"
#import "JCMatchFanganViewController.h"
#import "JNMatchDetailZBVC.h"
#import "JNMatchDetailQBVC.h"
#import "JCMatchDetailZSVC.h"
#import "JNMatchDetailZRVC.h"
#import "JNMatchDetailSJVC.h"
#import "JCMatchDetailDataModelVC.h"
#import "JCMatchDetailTopTitleView.h"
static CGFloat const kWMMenuViewHeight = 44;
@interface JCMatchDetailWMStickVC ()

@property (nonatomic, strong) NSArray *titleArray;

@property (nonatomic,strong) UIView *lineView;

@property (nonatomic, strong) JNMatchDetailView_New *topHeadView;

@property (strong, nonatomic) JCMatchFanganViewController   * faVC;

@property (strong, nonatomic) JNMatchDetailZBVC * zbVC;

@property (strong, nonatomic) JNMatchDetailQBVC * qbVC;

@property (strong, nonatomic) JCMatchDetailZSVC * zsVC;

@property (strong, nonatomic) JNMatchDetailZRVC * zrVC;

@property (strong, nonatomic) JNMatchDetailSJVC * sjVC;

@property (strong, nonatomic) JCMatchBall * matchBall;

@property (strong, nonatomic) UILabel *titleLab;

@property (strong, nonatomic) JCMatchDetailTopTitleView *titleView;

@property (strong, nonatomic) UIImageView *topImgView;

@property (nonatomic, assign) float height;

@property (nonatomic, assign) BOOL hideNavBar;

@property (nonatomic, assign) BOOL showAnimation;

@end

@implementation JCMatchDetailWMStickVC

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self.zbVC destoryTimer];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationBarStyle = JCNavigationBarStyleTransparent;
    [self hideNavShadow];
    [self setNavBackImgWhiteColor];
    UIImage *navImg =[UIImage imageNamed:@"match_top_nav"];
      navImg = [navImg resizableImageWithCapInsets:UIEdgeInsetsZero resizingMode:UIImageResizingModeStretch];
    [self.navigationController.navigationBar setBackgroundImage:navImg forBarMetrics:UIBarMetricsDefault];
    if (@available(iOS 15.0, *)) {
        [self configNavBarImage:@"match_top_nav"];
    }
    self.navigationController.navigationBar.hidden = self.hideNavBar;
    
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationBarStyle = JCNavigationBarStyleDefault;
    self.navigationController.navigationBar.hidden = NO;
    
    if (@available(iOS 15.0, *)) {
        [self configNavBarImageToNormal];
    }
    
    
}

- (void)back:(UIButton *)sender {
    if ([self.topHeadView.topView.subviews containsObject:self.topHeadView.wkWebView]) {
        self.navigationController.navigationBar.hidden = NO;
        [self.topHeadView.wkWebView removeFromSuperview];
        self.height = kWMMatchDetailHeaderViewHeight;
        self.viewTop = self.height;
        self.maximumHeaderViewHeight = kWMMatchDetailHeaderViewHeight-kNavigationBarHeight;
        [self.contentView scrollToTop];
        self.topHeadView.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), self.height);
        return;
    }
    [self.navigationController popViewControllerAnimated:YES];
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
        self.menuItemWidth = (SCREEN_WIDTH-AUTO(20))/7.0f;
        self.viewTop = kWMMatchDetailHeaderViewHeight;
        self.menuViewHeight = 0;
        self.maximumHeaderViewHeight = kWMMatchDetailHeaderViewHeight-kNavigationBarHeight;
        self.contentView.bounces = NO;
        self.preloadPolicy = WMPageControllerPreloadPolicyNeighbour;//预加载下个vc
        if ([[NSUserDefaults standardUserDefaults] objectForKey:@"show_odds"]) {
            NSString *show = [[NSUserDefaults standardUserDefaults] objectForKey:@"show_odds"];
            self.show_odds = [show integerValue];
            if (self.show_odds==1) {
                self.titleArray = @[@"方案",@"直播",@"情报",@"指数",@"阵容",@"数据",@"模型"];
            }else{
                self.titleArray = @[@"方案",@"直播",@"情报",@"阵容",@"数据",@"模型"];
            }
        }else {
            self.titleArray = @[@"方案",@"直播",@"情报",@"阵容",@"数据",@"模型"];
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

    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"match_top_nav"] forBarMetrics:UIBarMetricsDefault];
    
     self.titleView.frame = CGRectMake(0, 0, 300, 44);
     self.navigationItem.titleView = self.titleView;
    

    self.topHeadView.frame = CGRectMake(0, 0, SCREEN_WIDTH, kWMMatchDetailHeaderViewHeight);
//    self.topHeadView.expertID = self.expertID;
    [self.view addSubview:self.topHeadView];
    
    
    
    
    WeakSelf;
    self.topHeadView.addAniBlock = ^(float height) {
        weakSelf.hideNavBar = YES;
        weakSelf.showAnimation = YES;
        weakSelf.navigationController.navigationBar.hidden = YES;
        weakSelf.height = height;
        weakSelf.viewTop = weakSelf.height;
        weakSelf.maximumHeaderViewHeight = 0;
        [weakSelf.contentView scrollToTop];
        weakSelf.topHeadView.frame = CGRectMake(0, 0, CGRectGetWidth(weakSelf.view.bounds), weakSelf.height);
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"openScoreBallAnimation" object:nil];

        
    };
    

    self.topHeadView.JCBackBlock = ^{
        weakSelf.hideNavBar = NO;
        weakSelf.showAnimation = NO;
        if ([weakSelf.topHeadView.topView.subviews containsObject:weakSelf.topHeadView.wkWebView]) {
            weakSelf.navigationController.navigationBar.hidden = NO;
            [weakSelf.topHeadView.wkWebView removeFromSuperview];
            weakSelf.height = kWMMatchDetailHeaderViewHeight;
            weakSelf.viewTop = weakSelf.height;
            weakSelf.maximumHeaderViewHeight = kWMMatchDetailHeaderViewHeight-kNavigationBarHeight;
            [weakSelf.contentView scrollToTop];
            weakSelf.topHeadView.frame = CGRectMake(0, 0, CGRectGetWidth(weakSelf.view.bounds), weakSelf.height);
            [[NSNotificationCenter defaultCenter] postNotificationName:@"closeScoreBallAnimation" object:nil];
            
            return;
        }
        [weakSelf.navigationController popViewControllerAnimated:YES];
        
    };
    


}



- (void)loadMatchInfo {
    [self.view showLoading];
    WeakSelf;
    JCMatchService_New *service = [JCMatchService_New new];
    [service getFootBallMatchDetailTopWithMatchnum:NonNil(self.matchNum) success:^(id  _Nullable object) {
        [weakSelf.view endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
            JCMatchBall * matchBall = (JCMatchBall *)[JCWJsonTool entityWithJson:object[@"data"] class:[JCMatchBall class]];
//            matchBall.is_ai = 3;
            
            weakSelf.topHeadView.matchBall = matchBall;
            weakSelf.matchBall = matchBall;
            weakSelf.titleView.matchBall = matchBall;
            weakSelf.titleLab.alpha =  0;
            weakSelf.titleLab.text= [NSString stringWithFormat:@"%@ VS %@",matchBall.home_team.name_zh,matchBall.away_team.name_zh];
            [self reloadData];
            if (self.model_id.length>0) {
//                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//                    self.selectIndex = 6;
//                });
                self.selectIndex = 6;
                
            }
        }
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
    self.topHeadView.frame = CGRectMake(0, headerViewX, CGRectGetWidth(self.view.bounds), self.height);
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
//    return 1;
}

- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {

    if (self.show_odds==1) {
        if (index==0) {
            JCMatchFanganViewController *faVC = [JCMatchFanganViewController new];
            faVC.matchNum = self.matchNum;
            return faVC;
        }
        if (index==1) {
            self.zbVC = [JNMatchDetailZBVC new];
            self.zbVC.matchBall = self.matchBall;
            return self.zbVC;
        }
        if (index==2) {
            JNMatchDetailQBVC *qbVC = [JNMatchDetailQBVC new];
            qbVC.matchBall = self.matchBall;
            return qbVC;
        }
        if (index==3) {
            JCMatchDetailZSVC *zsVC = [JCMatchDetailZSVC new];
            zsVC.matchBall = self.matchBall;
            return zsVC;
        }
        if (index==4) {
            JNMatchDetailZRVC *zrVC = [JNMatchDetailZRVC new];
            zrVC.matchBall = self.matchBall;
            return zrVC;
        }

        if (index==5) {
            JNMatchDetailSJVC *sjVC = [JNMatchDetailSJVC new];
//            sjVC.is_bigData = self.is_bigData;
            sjVC.matchBall = self.matchBall;
            return sjVC;
        }
        if (index==6) {
            JCMatchDetailDataModelVC *dataVC = [JCMatchDetailDataModelVC new];
            dataVC.model_id = self.model_id;
            dataVC.matchBall = self.matchBall;
            return dataVC;
        }
        
    }else{
        if (index==0) {
            JCMatchFanganViewController *faVC = [JCMatchFanganViewController new];
            faVC.matchNum = self.matchNum;
            return faVC;
        }
        if (index==1) {
            self.zbVC = [JNMatchDetailZBVC new];
            self.zbVC.matchBall = self.matchBall;
            return self.zbVC;
        }
        if (index==2) {
            JNMatchDetailQBVC *qbVC = [JNMatchDetailQBVC new];
            qbVC.matchBall = self.matchBall;
            return qbVC;
        }

        if (index==3) {
            JNMatchDetailZRVC *zrVC = [JNMatchDetailZRVC new];
            zrVC.matchBall = self.matchBall;
            return zrVC;
        }

        if (index==4) {
            JNMatchDetailSJVC *sjVC = [JNMatchDetailSJVC new];
//            sjVC.is_bigData = self.is_bigData;
            sjVC.matchBall = self.matchBall;
            return sjVC;
        }
        if (index==5) {
            JCMatchDetailDataModelVC *dataVC = [JCMatchDetailDataModelVC new];
            dataVC.model_id = self.model_id;
            dataVC.matchBall = self.matchBall;
            return dataVC;
        }
    }

    
    return [UIViewController new];
    
    
    

}

- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    return self.titleArray[index];
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForMenuView:(WMMenuView *)menuView {
    menuView.backgroundColor = JCWhiteColor;
    self.lineView.frame = CGRectMake(0, kWMMenuViewHeight-1, SCREEN_WIDTH, 1);
    [menuView addSubview:self.lineView];
    menuView.backgroundColor = JCWhiteColor;
    return CGRectMake(0, _viewTop, SCREEN_WIDTH, kWMMenuViewHeight);

}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForContentView:(WMScrollView *)contentView {
    CGFloat originY = _viewTop + kWMMenuViewHeight;

    if (self.height>kWMMatchDetailHeaderViewHeight) {
        return CGRectMake(0, originY, SCREEN_WIDTH, SCREEN_HEIGHT-kBottomTabSafeAreaHeight-kWMMenuViewHeight-self.height);
    }else{
        return CGRectMake(0, originY, SCREEN_WIDTH, SCREEN_HEIGHT-kBottomTabSafeAreaHeight-kWMMenuViewHeight-kNavigationBarHeight);
    }
      
}
- (void)pageController:(WMPageController *)pageController didEnterViewController:(__kindof UIViewController *)viewController withInfo:(NSDictionary *)info {
    if (self.selectIndex==3) {
        if (self.showAnimation) {
            [[NSNotificationCenter defaultCenter] postNotificationName:@"openScoreBallAnimation" object:nil];
        }else{
            [[NSNotificationCenter defaultCenter] postNotificationName:@"closeScoreBallAnimation" object:nil];
            
        }
    }
    
}
- (void)dealloc {
    
}

- (JNMatchDetailView_New *)topHeadView {
    if (!_topHeadView) {
        _topHeadView = [JNMatchDetailView_New new];
    }
    return _topHeadView;
}

- (JCMatchFanganViewController *)faVC {
    if (!_faVC) {
        _faVC = [JCMatchFanganViewController new];
    }
    return _faVC;
}

- (JNMatchDetailZBVC *)zbVC {
    if (!_zbVC) {
        _zbVC = [JNMatchDetailZBVC new];
    }
    return _zbVC;
}
- (JNMatchDetailQBVC *)qbVC {
    if (!_qbVC) {
        _qbVC = [JNMatchDetailQBVC new];
    }
    return _qbVC;
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
