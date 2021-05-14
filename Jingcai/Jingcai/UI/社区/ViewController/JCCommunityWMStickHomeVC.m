//
//  JCCommunityWMStickHomeVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/10/27.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCCommunityWMStickHomeVC.h"
#import "JCCommunityWMHeadView.h"
#import "JCCommunity_GZHVC.h"
#import "JCYCHomeWMStickVC.h"
#import "JCYCHomeViewController.h"
#import "JCCommunity_HBVC.h"
#import "JCPostCheckingVC.h"
#import "JCPostCheckRuleVC.h"
#import "JCBaseTitleAlertView.h"
#import "JCPostCheckFailVC.h"
#import "JCHomeSearchVC.h"
#import "JCPostPlanMatchTypeSelecView.h"
#import "JCPostPlanVC.h"
#import "JCPostCheckPlanVC.h"
#import "JCPostCheckUserInfoVC.h"
static CGFloat const kWMMenuViewHeight = 44;
@interface JCCommunityWMStickHomeVC ()<UISearchBarDelegate>

@property (nonatomic, assign) float height;

@property (nonatomic, strong) JCCommunityWMHeadView *topHeadView;

@property (nonatomic,strong) UIView *lineView;

@property (nonatomic,strong) UISearchBar *searchBar;

@property (nonatomic,strong) UIView *topColorView;

@property (nonatomic,strong) UIBarButtonItem *jingcaiItem;

@property (nonatomic,strong) UILabel *fbLab;

@property (nonatomic,strong) UIView *navShadow;

@end

@implementation JCCommunityWMStickHomeVC

- (NSArray *)titleArray {
    if (!_titleArray) {
        _titleArray = @[@"公众号专家",@"红榜达人"];
    }
    return _titleArray;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
     self.navigationBarStyle = JCNavigationBarStyleTransparent;
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
    
//    [self hideNavShadow];
    if (!self.topColorView) {
        self.topColorView = [UIView new];
        self.topColorView.backgroundColor = JCWhiteColor;
        self.topColorView.alpha = 0;
        self.topColorView.frame = CGRectMake(0, 0, SCREEN_WIDTH, kNavigationBarHeight);
        [self.navigationController.view insertSubview:self.topColorView belowSubview:self.navigationController.navigationBar];
        
//        self.navShadow = [UIView new];
        self.navShadow.frame = CGRectMake(0, kNavigationBarHeight-0.5, SCREEN_WIDTH, 0.5);
        [self.navigationController.navigationBar addSubview:self.navShadow];
        [self.navigationController.view insertSubview:self.navShadow belowSubview:self.navigationController.navigationBar];
    }else{
        [self setNavEffect];
    }

//      [[UINavigationBar appearance]setShadowImage:[self imageWithColor:color];
//    self.navigationController.navigationBar.layer.masksToBounds = NO;

     //设置阴影的高度

     
}


- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationBarStyle = JCNavigationBarStyleDefault;
    self.topColorView.alpha = 0;
    self.navShadow.alpha = 0;

}
//kWMCommunityTopHeadHeight
- (instancetype)init {
    if (self = [super init]) {
        self.height = kNavigationBarHeight+AUTO(190);
        self.titleSizeNormal = 14;
        self.titleSizeSelected = 14;
        self.menuViewStyle = WMMenuViewStyleLine;
        self.menuItemWidth = AUTO(100);
//        self.menuViewLayoutMode = WMMenuViewLayoutModeLeft;
        self.progressWidth = AUTO(28);
        self.viewTop = kNavigationBarHeight+AUTO(190);
        self.menuViewHeight = kWMMenuViewHeight;
        self.progressColor = JCBaseColor;
        self.progressViewBottomSpace = 1;
        self.progressHeight=2;
        self.maximumHeaderViewHeight = kNavigationBarHeight+AUTO(190);;
        self.minimumHeaderViewHeight = kNavigationBarHeight+AUTO(20);
        self.titleColorSelected = COLOR_2F2F2F;
        self.titleColorNormal = COLOR_2F2F2F;
//        self.titleFontName = @"PingFangSC-Medium";
        self.contentView.bounces = NO;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupSearchView];
    [self initViews];
    [self getCache];
    [self getHomeTab];
    [self getBannerData];
    [self showActivityPresentWithPosition:@"3" ViewController:self];//获取活动弹窗

}

- (void)getHomeTab {
    
//    [self.view showLoading];
    JCHomeService_New *service = [JCHomeService_New service];
    [service getHomeTabWithsuccess:^(id  _Nullable object) {
        self.titleArray = @[@"公众号专家",@"红榜达人"];
//        self.titleArray = @[@"公众号专家",@"红榜达人",@"全民鲸猜"];
         if ([JCWJsonTool isSuccessResponse:object]) {
             NSString *type = object[@"data"][@"show_gusess"];
             if ([type intValue]==1) {
                 self.titleArray = @[@"公众号专家",@"红榜达人",@"全民鲸猜"];
             }
         }
         [self reloadData];

    } failure:^(NSError * _Nonnull error) {
        self.titleArray = @[@"公众号专家",@"红榜达人"];
        [self reloadData];
    }];

}


- (void)getBannerData {
//    [self.jcWindow showLoading];
    JCHomeService_New *service = [JCHomeService_New service];
    [service getAppBannerWithType:@"6" success:^(id  _Nullable object) {
//        [self.jcWindow endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
            [[NSUserDefaults standardUserDefaults] setObject:object forKey:JCCommunity_Banner];
            [self deathWithData:object];
        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }
    } failure:^(NSError * _Nonnull error) {
        [self.jcWindow endLoading];
    }];

}

- (void)getCache {
    id object = [[NSUserDefaults standardUserDefaults] objectForKey:JCCommunity_Banner];
    if (object) {
        [self deathWithData:object];
    }
}

- (void)deathWithData:(id)object {
    NSArray *array = [NSArray yy_modelArrayWithClass:[JCWSlideBall class] json:object[@"data"]];
    self.topHeadView.bannerArray = array;
}

- (void)initViews {
    self.topHeadView.frame = CGRectMake(0, 0, SCREEN_WIDTH, kNavigationBarHeight+AUTO(190));
     [self.view addSubview:self.topHeadView];
 
}

- (void)setupSearchView {
    UIView *titleView = [[UIView alloc] init];
    titleView.frame = CGRectMake(0, 0, SCREEN_WIDTH-AUTO(90), 32);
    titleView.backgroundColor = JCClearColor;
    [titleView hg_setAllCornerWithCornerRadius:4];
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:titleView.bounds];

    
    searchBar.layer.cornerRadius = 16;
    searchBar.layer.masksToBounds = YES;
    [searchBar setImage:JCIMAGE(@"icon_ser") forSearchBarIcon:UISearchBarIconSearch state:UIControlStateNormal];
    [titleView addSubview:searchBar];
    self.navigationItem.titleView = titleView;
    searchBar.delegate = self;
 
    searchBar.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    

        if (@available(iOS 13.0, *)) {

            UITextField *searchField = searchBar.searchTextField;
            searchField.backgroundColor = COLOR_F0F0F0;
//            searchField.textColor = COLOR_B2BACD;
            NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"搜索方案，专家，达人" attributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Regular" size:13]}];//NSForegroundColorAttributeName:COLOR_B2BACD
            searchField.attributedPlaceholder = string;
//              [searchBar setSearchFieldBackgroundImage:JCIMAGE(@"clearImage") forState:0];
//            searchBar.searchTextField.font = [UIFont systemFontOfSize:13];

        }else{
                for (UIView *subView in [[searchBar.subviews lastObject] subviews]) {
                     if([subView isKindOfClass:NSClassFromString(@"UISearchBarSearchFieldBackgroundView")]) {
                         subView.backgroundColor = COLOR_F0F0F0;
                     }
                    float systemVersion = [[[UIDevice currentDevice] systemVersion] floatValue];
            
                    if (systemVersion <13.0) {
                        if([subView isKindOfClass:NSClassFromString(@"UISearchBarBackground")]) {
                            [subView removeFromSuperview];
                        }
                    }
            
            
                     if ([subView isKindOfClass:NSClassFromString(@"UISearchBarTextField")]) {
                         UITextField *textField = (UITextField *)subView;
                         textField.borderStyle = UITextBorderStyleNone;
                         textField.font = [UIFont systemFontOfSize:13];
                         textField.backgroundColor = JCWhiteColor;
                         textField.layer.cornerRadius= 16;
                         textField.layer.masksToBounds = YES;
                         NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"搜索方案，专家，达人" attributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Regular" size:13]}];//NSForegroundColorAttributeName:COLOR_B2BACD
                         textField.attributedPlaceholder = string;
            //             textField.backgroundColor = [UIColor whiteColor];
            //             [textField hg_setAllCornerWithCornerRadius:22];
            
                     }
                 }
        }
//    [self.searchBar becomeFirstResponder];
    self.searchBar = searchBar;
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithImage:JCIMAGE(@"commnity_jc") style:0 target:self action:nil];
    item.tintColor = JCWhiteColor;
    self.navigationItem.leftBarButtonItem = item;
    self.jingcaiItem = item;
    

//    self.contentView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
//
//    }];
    


}


- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [self addCornerWithView:self.menuView type:UIRectCornerTopLeft|UIRectCornerTopRight size:CGSizeMake(5, 5)];
//
//    CGFloat headerViewHeight = kWMCommunityTopHeadHeight;
////    CGFloat headerViewHeight = kWMCommunityTopHeadHeight;
//    CGFloat headerViewX = 0;
//    UIScrollView *scrollView = (UIScrollView *)self.view;
//    if (scrollView.contentOffset.y < 0) {
//        headerViewX = scrollView.contentOffset.y;
//        headerViewHeight -= headerViewX;
//
//    }
//    self.topHeadView.frame = CGRectMake(0, headerViewX, CGRectGetWidth(self.view.bounds), kWMCommunityTopHeadHeight);
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
//        [self.view setNeedsLayout];
//    }



     [self setNavEffect];
}

#pragma mark - Datasource & Delegate
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController {
    return self.titleArray.count;
}

- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
    if (index==0) {
        JCCommunity_GZHVC *vc = [JCCommunity_GZHVC new];
        vc.fatherView = self.view;
        WeakSelf;
        vc.JCRefreshBlock = ^{
            [weakSelf getBannerData];
        };
        return vc;
    }
    if (index==1) {
        JCCommunity_HBVC *vc =  [JCCommunity_HBVC new];
        vc.fatherView = self.view;
        WeakSelf;
        vc.JCRefreshBlock = ^{
            [weakSelf getBannerData];
        };
         return vc;
     }
   JCYCHomeWMStickVC *vc = [JCYCHomeWMStickVC new];
    vc.fatherView = self.view;
//    vc.is_sq = YES;
    return vc;
}

- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    return self.titleArray[index];
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForMenuView:(WMMenuView *)menuView {
    menuView.backgroundColor = JCWhiteColor;
    self.lineView.frame = CGRectMake(0, kWMMenuViewHeight-1, SCREEN_WIDTH, 0.5);
    [menuView addSubview:self.lineView];
    [self.contentView bringSubviewToFront:menuView];
    return CGRectMake(0, _viewTop-AUTO(20), self.view.frame.size.width, kWMMenuViewHeight);

}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForContentView:(WMScrollView *)contentView {
    CGFloat originY = _viewTop+44;
    return CGRectMake(0, originY-AUTO(20), self.view.frame.size.width, SCREEN_HEIGHT-44-kTabBarHeight-kNavigationBarHeight-AUTO(10));
}
- (void)pageController:(WMPageController *)pageController willEnterViewController:(__kindof UIViewController *)viewController withInfo:(NSDictionary *)info {
    if (self.selectIndex==1) {
        UIView *postView = [UIView new];
        postView.frame = CGRectMake(0, 0, 40, 40);
        UILabel *fbLab = [UILabel initWithTitle:@"+发布" andFont:14 andWeight:1 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        fbLab.frame = CGRectMake(0, 0, 40, 40);
        [postView addSubview:fbLab];
        self.fbLab = fbLab;
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:postView];
        WeakSelf;
        [postView bk_whenTapped:^{
            [weakSelf postBtnClick];
        }];
    }else{
        self.navigationItem.rightBarButtonItem = nil;
    }
}

#pragma mark UISearchBar Delegate
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar {
    [self.navigationController pushViewController:[JCHomeSearchVC new] animated:YES];
    return NO;
}

#pragma mark

- (void)postBtnClick {
//    JCPostCheckPlanVC *vc = [JCPostCheckPlanVC new];
//    vc.type = @"2";
//    [self.navigationController pushViewController:vc animated:YES];
//    return;
    
//    JCPostCheckUserInfoVC *vc = [JCPostCheckUserInfoVC new];
////    vc.applyID = model.other_id;
//    [self.navigationController pushViewController:vc animated:YES];
//    return;
    
    JCWUserBall *user =  [JCWUserBall currentUser];



    if (![JCWUserBall currentUser]) {
        [self presentLogin];
        return;
    }
 
    
//fabu 0 不能发布 1 可以发布  2被禁  3审核中 4审核被拒
//
        if ([[JCWUserBall currentUser].fabu intValue]==4) {
            JCPostCheckFailVC *vc = [JCPostCheckFailVC new];
    //        vc.isJingcai = YES;
            [self.navigationController pushViewController:vc animated:YES];
             return;
        }
    if ([[JCWUserBall currentUser].fabu intValue]==3) {
        [self.navigationController pushViewController:[JCPostCheckingVC new] animated:YES];
         return;
    }
//    JCWUserBall *user = [JCWUserBall currentUser];
        if ([[JCWUserBall currentUser].ten_red intValue]==1) {
            //10连红签约
//
            JCPostCheckRuleVC *vc = [JCPostCheckRuleVC new];
            vc.isJingcai = YES;
            [self.navigationController pushViewController:vc animated:YES];
            return;
        }
        if ([[JCWUserBall currentUser].fabu intValue]==0) {

            JCPostCheckRuleVC *vc = [JCPostCheckRuleVC new];

            [self.navigationController pushViewController:vc animated:YES];
            return;
        }


    if ([[JCWUserBall currentUser].fabu intValue]==1) {
        if ([[JCWUserBall currentUser].fabu_count intValue]==0) {
            JCBaseTitleAlertView *alertView = [JCBaseTitleAlertView new];
            [alertView alertTitle:@"" TitleColor:COLOR_333333 Mesasge:@"非常抱歉,您今日发布方案已达上限!\n请明天再来。" MessageColor:COLOR_333333 ComfirmTitle:@"确认" ComfirmColor:JCBaseColor confirmHandler:^{
                [alertView removeFromSuperview];
            }];
            alertView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
            [[UIApplication sharedApplication].keyWindow addSubview:alertView];
            return;
        }
        JCPostPlanMatchTypeSelecView *view = [JCPostPlanMatchTypeSelecView new];
        view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        view.JCPushVCBlick = ^(NSString * _Nonnull type) {
            JCPostPlanVC *vc = [JCPostPlanVC new];
            vc.type = type;
            [self.navigationController pushViewController:vc animated:YES];
        };
        [[UIApplication sharedApplication].keyWindow addSubview:view];
    }
    
    if ([[JCWUserBall currentUser].fabu intValue]==2) {
        JCBaseTitleAlertView *alertView = [JCBaseTitleAlertView new];
        [alertView alertTitle:@"" TitleColor:COLOR_333333 Mesasge:@"您已被禁止发帖\n请联系官方客服处理" MessageColor:COLOR_333333 ComfirmTitle:@"知道了" ComfirmColor:JCBaseColor confirmHandler:^{
            [alertView removeFromSuperview];
        }];
        alertView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        [[UIApplication sharedApplication].keyWindow addSubview:alertView];
         return;
    }


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
- (void)setNavEffect {
    
    if (self.contentView.contentOffset.y > kNavigationBarHeight) {
        self.jingcaiItem.tintColor = JCBaseColor;
        self.fbLab.textColor = JCBaseColor;
    }else{
        self.jingcaiItem.tintColor = JCWhiteColor;
        self.fbLab.textColor = JCWhiteColor;
    }
    
    CGFloat offsetY = self.contentView.contentOffset.y;
    CGFloat maxOffsetY = kNavigationBarHeight;
    float percent = offsetY/maxOffsetY;
    self.topColorView.alpha = percent;
    
    CGFloat scrollow_maxOffsetY = 190;
    float scrollow_percent = offsetY/scrollow_maxOffsetY;
    self.topHeadView.cycleScrollView.alpha = 1-scrollow_percent;
    self.navShadow.alpha= scrollow_percent;
    
    if (percent>=1) {
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;//
    }else{
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    }


    NSLog(@"%.2f",percent);
}

- (JCCommunityWMHeadView *)topHeadView {
    if (!_topHeadView) {
        _topHeadView = [JCCommunityWMHeadView new];
    }
    return _topHeadView;
}
- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [UIView new];
        _lineView.backgroundColor = COLOR_DDDDDD;
    }
    return _lineView;;
}
- (UIImage *)imageWithColor: (UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

- (UIView *)navShadow {
    if (!_navShadow) {
        _navShadow = [UIView new];
        _navShadow.backgroundColor = COLOR_F0F0F0;
        _navShadow.alpha = 0;
    }
    return _navShadow;
}

@end
