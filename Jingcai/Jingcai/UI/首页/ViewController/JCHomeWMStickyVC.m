//
//  JCHomeWMStickyVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/24.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCHomeWMStickyVC.h"
#import "JCHomeWM_HeadView.h"
#import "JCWMatchBall.h"
#import "JCYCNewUserGiftBagView.h"
#import "JCMainTabBarController.h"
#import "JCRedPacketActivityView.h"
#import "JCYesterdayAllRedTipView.h"
#import "JCShareView.h"
#import "JCHomeGanHuoVC.h"
#import "JCHomeSearchVC.h"
#import "JNTabBar.h"
#import "JCHomeHongBangVC.h"
#import "JCUserLoginRedPacketView.h"
#import "JCYCHongBaoWMVC.h"
#import "JCActivityModuleWMVC.h"
#import "JCActivityTipView.h"
#import "JCActivityDetailCommomVC.h"
#import "JCAppGuideView.h"
static CGFloat const kWMMenuViewHeight = 44;
@interface JCHomeWMStickyVC ()<UISearchBarDelegate>

@property (nonatomic,strong) UISearchBar *searchBar;

@property (nonatomic, strong) NSArray *titleArray;

@property (nonatomic, strong) JCHomeWM_HeadView *topHeadView;

@property (nonatomic, strong) UIView *lineView;

@property (nonatomic,strong) NSMutableArray *expertArray;//专家数据

@property (nonatomic,strong) NSMutableArray *matchArray;//比赛数据

@property (nonatomic,strong)JCRedPacketActivityView *redPacketView;//节日红包

@property (nonatomic,strong) JCShareView *shareView;

@property (nonatomic,strong)  JCHomeHongBangVC *hbVC;

@property (nonatomic,strong)  JCHomeGanHuoVC *ganhuoVC;

@property (nonatomic,strong)  JCHomeGanHuoVC *qbVC;

@property (nonatomic,strong)  JCHomeGanHuoVC *shisiVC;

@property (nonatomic,strong) UIBarButtonItem *jingcaiItem;

@property (nonatomic,assign) float headerViewHeigh;

@property (nonatomic,strong) UIView *topColorView;

@property (nonatomic,strong) UIImageView *topBgImageView;

@property (nonatomic,strong) UIView *navShadow;

@property (nonatomic,strong) UIImageView *activityImgView;

@property (nonatomic,assign) NSInteger show_activity;

@property (nonatomic,assign) NSInteger newPeople;//新人

@property (nonatomic,assign) NSInteger first_login;//首登

@property (nonatomic,assign) BOOL is_hide;

@property (nonatomic,assign) BOOL needNextGetData;//是否需要下次页面出现的时候请求数据

@end

@implementation JCHomeWMStickyVC

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationBarStyle = JCNavigationBarStyleTransparent;
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
    [self getAppSign];//获取app标识,客户端用不到,提供给服务端用
    [self getAppInfo];//getKefuWX
//    [self hideNavShadow];
    if (!self.topColorView) {
        self.topColorView = [UIView new];
        self.topColorView.backgroundColor = JCWhiteColor;
        self.topColorView.alpha = 0;
        self.topColorView.frame = CGRectMake(0, 0, SCREEN_WIDTH, kNavigationBarHeight);
        [self.navigationController.view insertSubview:self.topColorView belowSubview:self.navigationController.navigationBar];
        self.navShadow.frame = CGRectMake(0, kNavigationBarHeight-0.5, SCREEN_WIDTH, 0.5);
        [self.navigationController.navigationBar addSubview:self.navShadow];
        [self.navigationController.view insertSubview:self.navShadow belowSubview:self.navigationController.navigationBar];
    }else{
        [self setNavEffect];
    }
    if (self.needNextGetData) {
        [self getCommomData];
    }
    self.activityImgView.hidden = self.show_activity==1?NO:YES;
    self.is_hide = NO;
}


- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
//    self.navigationBarStyle = JCNavigationBarStyleTransparent;
    self.topColorView.alpha = 0;
    self.navShadow.alpha = 0;
    self.activityImgView.hidden = YES;
    self.is_hide = YES;
}


- (instancetype)init {
    if (self = [super init]) {
//        self.headerViewHeigh = kNavigationBarHeight+AUTO(280)+AUTO(270);
        self.headerViewHeigh = kNavigationBarHeight+AUTO(420);
        self.menuViewStyle = WMMenuViewStyleLine;
        self.progressViewBottomSpace = 1;
        self.progressColor= JCBaseColor;
        self.titleColorSelected = COLOR_2F2F2F;
        self.titleColorNormal = [COLOR_2F2F2F colorWithAlphaComponent:0.6];
        self.titleSizeNormal = 17;
        self.titleSizeSelected = 17;
        self.progressHeight = 2;
        self.viewTop = self.headerViewHeigh;
       self.itemsMargins = @[@(1),@(1),@(AUTO(200))];
//        self.maximumHeaderViewHeight = 30+NavigationStatusBarHeight-kBottomTabSafeAreaHeight;
        self.maximumHeaderViewHeight =   self.headerViewHeigh;
        self.minimumHeaderViewHeight = NavigationStatusBarHeight;
//        self.itemsMargins =
//        self.menuItemWidth = AUTO(100);
        self.automaticallyCalculatesItemWidths = YES;
//        self.titleFontName = @"PingFangSC-Medium";
        self.contentView.bounces = YES;
    }
    return self;
}

- (NSArray *)titleArray {
    if (!_titleArray) {
        _titleArray = @[@"推荐",@"干货",@"情报"];
    }
    return _titleArray;
}

- (void)viewDidLoad {

    [super viewDidLoad];
    [self setupSearchView];
     [self initView];
    [self getHomeCache];
    [self getHomeTab];
    [self getHomeTopCycle];//首页轮播数据
    [self getHomeData];
//    [self getCommomData]
    [self showGuideView];
  
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(isInCurrentVC) name:NotificationUserLogin object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getCommomData) name:UserRegisterSuccess object:nil];//新用户注册成功,获取新人红包
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(topViewClickEnable) name:@"WMPageControllerScrollowStop" object:nil];
#pragma mark test
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(isInCurrentVC) name:NotificationUserLogin object:nil];
    
}



- (void)initView {
    
    self.topBgImageView.frame = CGRectMake(0, -200, SCREEN_WIDTH, 200);
    
    [self.view addSubview:self.topBgImageView];
    
    
    self.view.backgroundColor = COLOR_F0F0F0;
    self.topHeadView.frame = CGRectMake(0, 0, SCREEN_WIDTH, self.headerViewHeigh);
    self.topHeadView.clickEnable = 1;
    [self.view addSubview:self.topHeadView];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithImage:JCIMAGE(@"commnity_jc") style:0 target:self action:nil];
    self.jingcaiItem = item;
    item.tintColor = JCWhiteColor;
    self.navigationItem.leftBarButtonItem = item;
    
    self.contentView.mj_header = [MJRefreshHeader headerWithRefreshingBlock:^{
    //        self.pageNo = 1;
        [self.contentView.mj_header endRefreshing];
            [self getHomeData];
        [self getHomeTopCycle];
        if (self.selectIndex==0) {
            [self.hbVC refreshData];
        }
        if (self.selectIndex==1) {
            [self.ganhuoVC refreshData];
        }
        if (self.selectIndex==2) {
            [self.qbVC refreshData];
        }
        if (self.selectIndex==3) {
            [self.shisiVC refreshData];
        }
        self.topHeadView.clickEnable = 1;
    }];
    
    NSMutableArray *imageArray = [NSMutableArray array];
    for (int i=1; i<9; i++) {
        NSString *name = [NSString stringWithFormat:@"ic_euro%d",i];
        UIImage *img = JCIMAGE(name);
        [imageArray addObject:img];
    }
    

    self.activityImgView.frame = CGRectMake(SCREEN_WIDTH-88, SCREEN_HEIGHT-150-kTabBarHeight, 58, 64);
    self.activityImgView.animationImages = imageArray;
    self.activityImgView.animationDuration = 0.9;
    [self.activityImgView startAnimating];
    [self.jcWindow addSubview:self.activityImgView];
    WeakSelf;
    [self.activityImgView bk_whenTapped:^{
        [weakSelf.navigationController pushViewController:[JCActivityModuleWMVC new] animated:YES];
    }];

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
            searchField.backgroundColor = [COLOR_F0F0F0 colorWithAlphaComponent:0.8];
//            searchField.textColor = COLOR_B2BACD;
            NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"搜索方案，专家，达人" attributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Regular" size:13]}];//NSForegroundColorAttributeName:COLOR_B2BACD
            searchField.attributedPlaceholder = string;
              [searchBar setSearchFieldBackgroundImage:JCIMAGE(@"clearImage") forState:0];
//            searchBar.searchTextField.font = [UIFont systemFontOfSize:13];

        }else{
                for (UIView *subView in [[searchBar.subviews lastObject] subviews]) {
                     if([subView isKindOfClass:NSClassFromString(@"UISearchBarSearchFieldBackgroundView")]) {
                         subView.backgroundColor = [COLOR_F0F0F0 colorWithAlphaComponent:0.8];
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
                         textField.backgroundColor = [COLOR_F0F0F0 colorWithAlphaComponent:0.8];
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
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
//    [self.view bringSubviewToFront:self.activityImgView];
}

- (void)showGuideView {
    if (![[NSUserDefaults standardUserDefaults] objectForKey:JCAppGuide]) {
        JCAppGuideView *view = [JCAppGuideView new];
        if (SCREEN_HEIGHT>667) {
            view.dataArray = @[JCIMAGE(@"course_1"),JCIMAGE(@"course_2")];
        }else {
            view.dataArray = @[JCIMAGE(@"course_min_1"),JCIMAGE(@"course_min_2")];
        }
        
        view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        WeakSelf;
        view.JCBlock = ^{
            [weakSelf getCommomData];//,包含拉新,节日红包
        };
        [self.jcWindow addSubview:view];
    }else{
        [self getCommomData];
        [[NSUserDefaults standardUserDefaults] objectForKey:JCAppGuide];
    }

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

    [self setNavEffect];
    
    self.topBgImageView.frame = CGRectMake(0, -200, SCREEN_WIDTH, 200);
    self.topHeadView.clickEnable = 2;
    
    if (scrollView.contentOffset.x>0&&scrollView.contentOffset.y==0) {
        self.topHeadView.clickEnable = 1;
    }

}

- (void)topViewClickEnable {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.topHeadView.clickEnable = 1;
    });
//    self.topHeadView.clickEnable = 1;
}

#pragma mark - Datasource & Delegate
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController {
    return self.titleArray.count;
}

- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
    if (index==0) {
        self.hbVC.fatherView = self.view;
        return self.hbVC;
    }
    if (index==1) {
//        JCHomeGanHuoVC *vc = [JCHomeGanHuoVC new];
//        vc.type = @"2";
        self.ganhuoVC.fatherView = self.view;
        return self.ganhuoVC;
 
    }
    if (index==2) {
//        JCHomeGanHuoVC *vc = [JCHomeGanHuoVC new];
//         vc.type = @"1";
        self.qbVC.fatherView = self.view;
        return self.qbVC;
    }
    
    self.shisiVC.fatherView = self.view;
    return self.shisiVC;
    

    
    

}

- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    return self.titleArray[index];
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForMenuView:(WMMenuView *)menuView {
    
    menuView.backgroundColor = JCWhiteColor;
    self.lineView.frame = CGRectMake(0, kWMMenuViewHeight-1, SCREEN_WIDTH, 0.5);
    [menuView addSubview:self.lineView];
    return CGRectMake(0, _viewTop,SCREEN_WIDTH, kWMMenuViewHeight);

}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForContentView:(WMScrollView *)contentView {
    CGFloat originY = _viewTop + kWMMenuViewHeight;
    return CGRectMake(0, originY, SCREEN_WIDTH, SCREEN_HEIGHT-kNavigationBarHeight-kTabBarHeight-kWMMenuViewHeight-10);
}


#pragma mark UISearchBar Delegate
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar {
    [self.navigationController pushViewController:[JCHomeSearchVC new] animated:YES];
    return NO;
}

//新人红包
- (void)userNewGiftPacket {
    JCHomeService_New *service = [JCHomeService_New  service];
    [service getNewPeoplePrizeWithSuccess:^(id  _Nullable object) {
    if ([JCWJsonTool isSuccessResponse:object]) {
        NSArray *array = [JCWJsonTool arrayWithJson:object[@"data"][@"hb"] class:[JCActivityRedPacketModel class]];
//            weakSelf.headView.bannerArray = self.bannerArray;
        
        JCMainTabBarController *tabbar =  (JCMainTabBarController *)[UIApplication sharedApplication].delegate.window.rootViewController;
       tabbar.tabSelIndex = 0;
        JCYCNewUserGiftBagView *view = [JCYCNewUserGiftBagView new];
        view.dataArray = array;
        view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
//        WeakSelf;
        @weakify(view);
        WeakSelf;
        view.JCBlock = ^{
            @strongify(view);
           
            JCYCHongBaoWMVC *vc =[JCYCHongBaoWMVC new];
            vc.JCBlock = ^{
                if (weakSelf.first_login==1) {
                    [weakSelf firstLoginPacket];
                }else {
                    [self showActivityPresentWithPosition:@"1" ViewController:self];//获取活动弹窗
                }
                
            };
            [self.navigationController pushViewController:vc animated:YES];
            [view removeFromSuperview];
        };
        view.JCCloseBlock = ^{
            if (weakSelf.first_login==1) {
                [weakSelf firstLoginPacket];
            }else {
                [self showActivityPresentWithPosition:@"1" ViewController:self];//获取活动弹窗
            }
        };
        [[UIApplication sharedApplication].keyWindow addSubview:view];


        }
    } failure:^(NSError * _Nonnull error) {
        
    }];

}
//首登红包
- (void)firstLoginPacket {
    
    JCHomeService_New *service = [JCHomeService_New service];
    [service getUserFirstLgoinPrizeWithSuccess:^(id  _Nullable object) {
        if ([JCWJsonTool isSuccessResponse:object]) {
            if ([object[@"data"] isKindOfClass:[NSDictionary class]]) {
                NSArray *array = [JCWJsonTool arrayWithJson:object[@"data"][@"hb"] class:[JCActivityRedPacketModel class]];
                JCMainTabBarController *tabbar =  (JCMainTabBarController *)[UIApplication sharedApplication].delegate.window.rootViewController;
               tabbar.tabSelIndex = 0;
                
                
                JCUserLoginRedPacketView *view = [JCUserLoginRedPacketView new];
                view.dataArray = array;
                view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        //        WeakSelf;
                @weakify(view);
                WeakSelf;
                view.JCBlock = ^{
                    @strongify(view);
                    JCYCHongBaoWMVC *vc =[JCYCHongBaoWMVC new];
                    [weakSelf.navigationController pushViewController:vc animated:YES];
                    [view removeFromSuperview];
                    [self showActivityPresentWithPosition:@"1" ViewController:self];//获取活动弹窗
                };
                view.JCCloseBlock = ^{
                    [self showActivityPresentWithPosition:@"1" ViewController:self];//获取活动弹窗
//                    [weakSelf getPacketData];;
                };
                [[UIApplication sharedApplication].keyWindow addSubview:view];



            }

            }
    } failure:^(NSError * _Nonnull error) {
        
    }];


}


- (void)setNavEffect {
    if (self.contentView.contentOffset.y > kNavigationBarHeight) {
        self.jingcaiItem.tintColor = JCBaseColor;
    }else{
        self.jingcaiItem.tintColor = JCWhiteColor;
    }
    
    
    CGFloat offsetY = self.contentView.contentOffset.y;
    CGFloat maxOffsetY = kNavigationBarHeight;
    float percent = offsetY/maxOffsetY;
    self.topColorView.alpha = percent;
//    NSLog(@"%.2f",percent);
//    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    if (percent>=1) {
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;//
    }else{
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    }
    self.navShadow.alpha= percent;

}

- (void)getHomeTab {
    
//    [self.view showLoading];
    JCHomeService_New *service = [JCHomeService_New service];
    [service getHomeTabWithsuccess:^(id  _Nullable object) {
        //        self.titleArray = @[@"推荐",@"干货",@"情报"];
         if ([JCWJsonTool isSuccessResponse:object]) {
             
             NSString *show_14 = object[@"data"][@"show_14"];
             if ([show_14 intValue]==1) {
                 self.titleArray = @[@"推荐",@"干货",@"情报",@"14场"];
             }
             
            
         }
         [self reloadData];

    } failure:^(NSError * _Nonnull error) {
        [self reloadData];
    }];

}

- (void)getHomeTopCycle {

    JCHomeService_New *service = [JCHomeService_New service];
    [service getAppBannerWithType:@"7" success:^(id  _Nullable object) {
        if ([JCWJsonTool isSuccessResponse:object]) {
            NSArray *array = [NSArray yy_modelArrayWithClass:[JCWSlideBall class] json:object[@"data"]];
            self.topHeadView.bannerArray = array;
            [[NSUserDefaults standardUserDefaults] setObject:object forKey:JCHomeBannerCache];
        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }
    } failure:^(NSError * _Nonnull error) {
        
    }];

}

- (void)getHomeData {
//    [self.view showLoading];
    JCHomeService_New *service = [JCHomeService_New service];
    [service getHomeDataWithType:@"1" page:1 success:^(id  _Nullable object) {
        self.topHeadView.clickEnable = 1;
        [self.view endLoading];
        [self.contentView.mj_header endRefreshing];
        if ([JCWJsonTool isSuccessResponse:object]) {
            NSData *data = [NSJSONSerialization dataWithJSONObject:object options:NSJSONWritingPrettyPrinted error:nil];
            [[NSUserDefaults standardUserDefaults] setObject:data forKey:JCHomeCache];
//            [ns]
//            [[NSUserDefaults standardUserDefaults] setObject:object forKey:JCHomeCache];
            [self deathWithTopData:object];
            
        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }
    } failure:^(NSError * _Nonnull error) {
        self.topHeadView.clickEnable = 1;
        [self.view endLoading];
        [self.contentView.mj_header endRefreshing];
    }];

}

- (void)deathWithTopData:(id)object {
//    NSArray *array = [NSArray yy_modelArrayWithClass:[JCWSlideBall class] json:object[@"data"][@"slide"]];
//    self.topHeadView.bannerArray = array;
    
    self.expertArray = [NSMutableArray array];
    //专家数据
  NSArray *expertArray = [JCWJsonTool arrayWithJson:object[@"data"][@"hot_expert_info"] class:[JCWExpertBall class]];
    [self.expertArray addObjectsFromArray:expertArray];

    //比赛数据
    self.matchArray = [NSMutableArray array];
    NSArray *matchArray = [JCWJsonTool arrayWithJson:object[@"data"][@"match_recommed"] class:[JCWMatchBall class]];
    [self.matchArray addObjectsFromArray:matchArray];
    
    self.topHeadView.expertArray = self.expertArray;
    self.topHeadView.matchArray = self.matchArray;
//            self.headerViewHeigh = AUTO(275)+AUTO(240);
    if (self.matchArray.count==0) {
        self.headerViewHeigh = kNavigationBarHeight+AUTO(420);
    }else{
        self.headerViewHeigh = kNavigationBarHeight+AUTO(420)+AUTO(115);
    }
    if (object[@"data"][@"is_show_icon"]) {
        NSString *show_activity = object[@"data"][@"is_show_icon"];
        self.show_activity = [show_activity integerValue];
        self.activityImgView.hidden = self.show_activity==1?NO:YES;
        if (self.is_hide == YES) {
            self.activityImgView.hidden = YES;
        }

    }

    self.topHeadView.frame = CGRectMake(0, 0, SCREEN_WIDTH, self.headerViewHeigh);
    self.viewTop = self.headerViewHeigh;
    self.maximumHeaderViewHeight = self.headerViewHeigh;
}

- (void)getCommomData {
    self.needNextGetData = NO;
//    [self.view showLoading];
    if (![JCWUserBall currentUser]) {
        [self showActivityPresentWithPosition:@"1" ViewController:self];//获取活动弹窗
        return;
    }
    JCHomeService_New *service = [JCHomeService_New service];
    [service getHomeCommonDataWithsuccess:^(id  _Nullable object) {
        [self.view endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
            //新人
            NSString * newPeople = object[@"data"][@"new_people"];
            NSString * first_login = object[@"data"][@"first_login"];
            self.newPeople = [newPeople integerValue];
            self.first_login = [first_login integerValue];
            if(self.newPeople==1){
                [self userNewGiftPacket];//显示新人红包
                return;
            }else if (self.first_login==1) {
                [self firstLoginPacket];////首登红包
                return;
            }
            else{
                [self showActivityPresentWithPosition:@"1" ViewController:self];//获取活动弹窗
            }

        }

    } failure:^(NSError * _Nonnull error) {
        [self.view endLoading];
    }];
   
}

- (void)getHomeCache {
    //首页banner
    id banner_object  = [[NSUserDefaults standardUserDefaults] objectForKey:JCHomeBannerCache];
    if (banner_object) {
        NSArray *array = [NSArray yy_modelArrayWithClass:[JCWSlideBall class] json:banner_object[@"data"]];
        self.topHeadView.bannerArray = array;
    }
    
    id object_data = [[NSUserDefaults standardUserDefaults] objectForKey:JCHomeCache];
    id object = [JCWAppTool dictionaryForJsonData:object_data];
    if (object) {
        [self deathWithTopData:object];
    }
}


//获取客户端唯一标识
- (void)getAppSign {
    NSString *sign = [[NSUserDefaults standardUserDefaults] objectForKey:@"app_sign"];
    if (sign.length==0) {
        JCAppService_New *service = [JCAppService_New new];
        [service getAppSignXWithsuccess:^(id  _Nullable object) {
            if ([JCWJsonTool isSuccessResponse:object]) {
                NSString *app_sign = object[@"data"];
                if (app_sign.length>0) {
                    [[NSUserDefaults standardUserDefaults] setObject:app_sign forKey:@"app_sign"];
                    [self getAppInfo];
                }
            }
            
        } failure:^(NSError * _Nonnull error) {
            
        }];

    }

}

//获取app信息
- (void)getAppInfo {
    JCAppService_New *service = [JCAppService_New new];
    [service getKefuWXWithsuccess:^(id  _Nullable object) {
        if ([JCWJsonTool isSuccessResponse:object]) {
            JCConfigModel *configModel = (JCConfigModel *)[JCWJsonTool entityWithJson:object[@"data"] class:[JCConfigModel class]];
            if (configModel.customer.length==0) {
                configModel.customer = @"jingcaigood2";
            }
            [JCConfigModel save:configModel];
        }else{
            JCConfigModel *configModel = [JCConfigModel new];
            configModel.customer = @"jingcaigood2";
            [JCConfigModel save:configModel];
        }
    } failure:^(NSError * _Nonnull error) {
        JCConfigModel *configModel = [JCConfigModel new];
        configModel.customer = @"jingcaigood2";
        [JCConfigModel save:configModel];
    }];
}


//当前页面处于JCMainTabBarController的选中页面
- (void)isInCurrentVC {
    
    JCMainTabBarController *tabBarController = (JCMainTabBarController *)[UIApplication sharedApplication].delegate.window.rootViewController;
    BOOL value =  [tabBarController isCurrentBaseVCWtihIndex:0]&&self.navigationController.topViewController==self;
    self.needNextGetData = !value;//是否需要下次页面出现的时候请求数据
    if (value) {
        [self getCommomData];
    }
}


- (JCHomeHongBangVC *)hbVC {
    if (!_hbVC) {
        _hbVC = [JCHomeHongBangVC new];
        _hbVC.type = @"1";
    }
    return _hbVC;
}

- (JCHomeGanHuoVC *)ganhuoVC {
    if (!_ganhuoVC) {
        _ganhuoVC = [JCHomeGanHuoVC new];
        _ganhuoVC.type = @"100";
    }
    return _ganhuoVC;
}

- (JCHomeGanHuoVC *)qbVC {
    if (!_qbVC) {
        _qbVC = [JCHomeGanHuoVC new];
        _qbVC.type = @"101";
    }
    return _qbVC;
}

- (JCHomeGanHuoVC *)shisiVC {
    if (!_shisiVC) {
        _shisiVC = [JCHomeGanHuoVC new];
        _shisiVC.type = @"102";
    }
    return _shisiVC;
}


- (JCHomeWM_HeadView *)topHeadView {
    if (!_topHeadView) {
        _topHeadView = [JCHomeWM_HeadView new];
//        _topHeadView.hidden = YES;
        _topHeadView.clickEnable = 1;
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

- (JCShareView *)shareView {
    if (!_shareView) {
        _shareView = [JCShareView viewFromXib];
//        _shareView.titleString = @"分享方案";
        _shareView.image = JCIMAGE(@"icon_app");
    }
    return _shareView;
}
- (UIImageView *)topBgImageView {
    if (!_topBgImageView) {
        _topBgImageView = [UIImageView new];
        _topBgImageView.image = JCIMAGE(@"homeTopImage");
    }
    return _topBgImageView;
}
- (UIView *)navShadow {
    if (!_navShadow) {
        _navShadow = [UIView new];
        _navShadow.backgroundColor = COLOR_F0F0F0;
        _navShadow.alpha = 0;
    }
    return _navShadow;
}

- (UIImageView *)activityImgView {
    if (!_activityImgView) {
        _activityImgView = [UIImageView new];
        _activityImgView.userInteractionEnabled = YES;
        _activityImgView.hidden = YES;
    }
    return _activityImgView;
}

@end
