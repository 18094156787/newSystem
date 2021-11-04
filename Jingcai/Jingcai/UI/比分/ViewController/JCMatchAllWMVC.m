//
//  JCMatchAllWMVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/4.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCMatchAllWMVC.h"
#import "LMJTab.h"
#import "JCMatchHomeWMVC.h"
#import "JCBasketBallHomeMatchWMVC.h"
#import "JCMatchFootBallSearchVC.h"
#import "JCMatchBasketBallSearchVC.h"
#import "JCMainTabBarController.h"
#import "JPUSHService.h"
#import "JCMatchTipSettingVC.h"
//#import "JCJPushManager.h"
@interface JCMatchAllWMVC ()<LMJTabDelegate>

@property (nonatomic,strong) UIBarButtonItem *spaceItem;

@property (nonatomic,strong) UIBarButtonItem *fileterItem;

@property (nonatomic,strong) UIBarButtonItem *settingItem;

@property (nonatomic,strong) UIBarButtonItem *settingBtn;

@property (nonatomic,strong) UIBarButtonItem *searchItem;

@property (nonatomic, strong) NSArray *titleArray;

@property (nonatomic, strong) UISegmentedControl *segControl;

@property (nonatomic, strong) LMJTab * tabSegment;//

@property (nonatomic, strong)JCMatchHomeWMVC *footBallVC;

@property (nonatomic, strong)JCBasketBallHomeMatchWMVC *basketBallVC;

@property (nonatomic, assign)NSInteger footBall_Index;

@property (nonatomic, assign)NSInteger basketBall_Index;

@property (nonatomic,assign) BOOL needNextGetData;//是否需要下次页面出现的时候请求数据

@end

@implementation JCMatchAllWMVC

- (NSArray *)titleArray {
    if (!_titleArray) {
        
        _titleArray = @[@"足球",@"篮球"];
    }
    return _titleArray;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
     self.navigationBarStyle = JCNavigationBarStyleDefault;
    if (self.needNextGetData) {
        [self showActivityTipView];
    }
    
//    [JPUSHService deleteAlias:^(NSInteger iResCode, NSString *iAlias, NSInteger seq) {
////        if (show) {
////            [SVProgressHUD dismiss];
////        }
////        if (iResCode == 0 && completion) {
////            completion(YES);
////            return ;
////        }
////        completion(NO);
//    } seq:1];

    [JPUSHService getAlias:^(NSInteger iResCode, NSString *iAlias, NSInteger seq) {
        NSLog(@"当前别名%@",iAlias);
        
    } seq:1];
    
    
    
}


- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
      self.navigationBarStyle = JCNavigationBarStyleDefault;

}

- (instancetype)init {
    if (self = [super init]) {
//        self.height = kWMTopHeadHeight;
        self.titleSizeNormal = 15;
        self.titleSizeSelected = 15;
        self.titleColorSelected = JCWhiteColor;//COLOR_FE1F19
        self.titleColorNormal = JCBaseColor;
        self.menuViewStyle = WMMenuViewStyleFloodHollow;
        self.itemsWidths = @[@(70),@(90),@(70)];
        self.progressHeight =30;
        self.progressColor = [UIColor redColor];

//        self.showOnNavigationBar = YES;
//        self.progressColor = [UIColor colorWithRed:168.0/255.0 green:20.0/255.0 blue:4/255.0 alpha:1];
//        self.showOnNavigationBar = YES;
        self.menuViewLayoutMode = WMMenuViewLayoutModeCenter;
//        self.titleFontName = @"PingFangSC-Medium";
//        [self setNavBackImg];
//        self.contentView.bounces = NO;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initViews];
    [self showActivityTipView];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(isInCurrentVC) name:NotificationUserLogin object:nil];
    

}

- (void)showActivityTipView {
    self.needNextGetData = NO;
    [self showActivityPresentWithPosition:@"2" ViewController:self];//获取活动弹窗
}

//当前页面处于JCMainTabBarController的选中页面
- (void)isInCurrentVC {
    
    JCMainTabBarController *tabBarController = (JCMainTabBarController *)[UIApplication sharedApplication].delegate.window.rootViewController;
    BOOL value =  [tabBarController isCurrentBaseVCWtihIndex:1]&&self.navigationController.topViewController==self;

    self.needNextGetData = !value;//是否需要下次页面出现的时候请求数据
    if (value) {
        [self showActivityTipView];
    }
}

- (void)initViews {
    UIView *titleView = [UIView new];
    titleView.frame = CGRectMake(0, 0, 130, 26);
//    self.segControl.frame = CGRectMake(0, 0, 0, 26);

    
    
    LMJTab * tab = [[LMJTab alloc] initWithFrame:CGRectMake(0, 0, 130, 26) lineWidth:1 lineColor:[UIColor whiteColor]];
    [tab setItemsWithTitle:self.titleArray normalItemColor:COLOR_F0F0F0 selectItemColor:JCBaseColor normalTitleColor:COLOR_9F9F9F selectTitleColor:[UIColor whiteColor] titleTextSize:12 selectItemNumber:0];
    tab.layer.cornerRadius = 5.0;
    self.tabSegment = tab;
    [titleView addSubview:tab];
    tab.delegate = self;
    self.navigationItem.titleView = titleView;
    
//    self.fileterItem = [[UIBarButtonItem alloc] initWithImage:JCIMAGE(@"match_icon_sx") style:0 target:self action:@selector(filterItemClick)];
    self.fileterItem.tintColor = JCBaseColor;
    
    
//    self.settingItem = [[UIBarButtonItem alloc] initWithImage:JCIMAGE(@"jc_jq_setting") style:0 target:self action:@selector(filterItemClick)];
    self.settingItem.tintColor = JCBaseColor;
    
    self.navigationItem.rightBarButtonItems = @[self.fileterItem,self.settingItem];

    self.searchItem = [[UIBarButtonItem alloc] initWithImage:JCIMAGE(@"ic_ser") style:0 target:self action:@selector(searchItemClick)];
    self.searchItem.tintColor = JCBaseColor;
    self.navigationItem.leftBarButtonItem = self.searchItem;


}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - ScrollViewDelegate



#pragma mark - Datasource & Delegate
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController {
    return self.titleArray.count;
}

- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
    if (index==0) {
        self.footBallVC = [JCMatchHomeWMVC new];
        WeakSelf;
        self.footBallVC.JCIndexBlock = ^(int idex) {
            weakSelf.footBall_Index = idex;
            if (idex==3) {


                weakSelf.navigationItem.rightBarButtonItems = @[weakSelf.settingItem];
            }else{
                weakSelf.navigationItem.rightBarButtonItems = @[weakSelf.spaceItem,weakSelf.fileterItem,weakSelf.settingItem];

            }
        };
        return self.footBallVC;
    }
    self.basketBallVC = [JCBasketBallHomeMatchWMVC new];
    WeakSelf;
    self.basketBallVC.JCIndexBlock = ^(int idex) {
        weakSelf.basketBall_Index = idex;
        if (idex==3) {
            weakSelf.navigationItem.rightBarButtonItems = nil;
        }else{
            weakSelf.navigationItem.rightBarButtonItems =  @[weakSelf.fileterItem];
        }
//        if (idex==3) {
//
//
//            weakSelf.navigationItem.rightBarButtonItems = @[weakSelf.settingItem];
//        }else{
//            weakSelf.navigationItem.rightBarButtonItems = @[weakSelf.spaceItem,weakSelf.fileterItem,weakSelf.settingItem];
//
//        }
    };
    return self.basketBallVC;

}

- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    return self.titleArray[index];
}

- (void)pageController:(WMPageController *)pageController willEnterViewController:(__kindof UIViewController *)viewController withInfo:(NSDictionary *)info {

}

- (void)pageController:(WMPageController *)pageController didEnterViewController:(__kindof UIViewController *)viewController withInfo:(NSDictionary *)info {
//    NSLog(@"已经%d",self.selectIndex);
//    [self.segControl setSelectedSegmentIndex:(NSInteger)self.selectIndex];
//    self.tabSegment.selectIndex = (NSInteger)self.selectIndex;
//
    if (self.selectIndex==0) {
        if (self.footBall_Index==3) {
            self.navigationItem.rightBarButtonItems = @[self.settingItem];
        }else{
            self.navigationItem.rightBarButtonItems = @[self.spaceItem,self.fileterItem,self.settingItem];
        }


    }else{
        if (self.basketBall_Index==3) {
            self.navigationItem.rightBarButtonItems = @[];
        }else{
            self.navigationItem.rightBarButtonItems = @[self.fileterItem];
        }
    }

}
- (CGRect)pageController:(WMPageController *)pageController preferredFrameForMenuView:(WMMenuView *)menuView {
    menuView.backgroundColor = COLOR_F0F0F0;
    return CGRectMake(0, 0, self.view.frame.size.width, 0);

}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForContentView:(WMScrollView *)contentView {

    return CGRectMake(0, 0, self.view.frame.size.width, SCREEN_HEIGHT-NavigationStatusBarHeight-kTabBarHeight);
}



-(void)tab:(LMJTab *)tab didSelectedItemNumber:(NSInteger)number{
    NSLog(@"CLICKED:%ld",number);
    self.selectIndex = (int)number;
    [self.scrollView setContentOffset:CGPointMake(SCREEN_WIDTH*number, 0) animated:NO];
}


- (void)filterItemClick {
    if (self.selectIndex==0) {
        [self.footBallVC filterItemClick];
    }else{
        [self.basketBallVC filterItemClick];
    }

}

- (void)settingItemClick {
    JCMatchTipSettingVC *vc = [JCMatchTipSettingVC new];
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (void)searchItemClick {
    if (self.selectIndex==0) {
        JCMatchFootBallSearchVC *searchVC = [JCMatchFootBallSearchVC new];
        [self.navigationController pushViewController:searchVC animated:YES];
    }else{
        JCMatchBasketBallSearchVC *searchVC = [JCMatchBasketBallSearchVC new];
        [self.navigationController pushViewController:searchVC animated:YES];
    }

}

- (UISegmentedControl *)segControl {
    if (!_segControl) {
        _segControl = [[UISegmentedControl alloc] initWithItems:self.titleArray];
    }
    return _segControl;
}
- (UIBarButtonItem *)fileterItem {
    if (!_fileterItem) {
        UIButton *setBtn = [UIButton new];
        setBtn.frame = CGRectMake(0, 0, 30, 44);
        [setBtn setImage:JCIMAGE(@"match_icon_sx") forState:0];
        [setBtn setImage:JCIMAGE(@"match_icon_sx") forState:UIControlStateHighlighted];
        _fileterItem= [[UIBarButtonItem alloc] initWithCustomView:setBtn];
        [setBtn addTarget:self action:@selector(filterItemClick) forControlEvents:UIControlEventTouchUpInside];
        _fileterItem.tintColor = JCBaseColor;
//        _fileterItem = [[UIBarButtonItem alloc] initWithImage:JCIMAGE(@"match_icon_sx") style:0 target:self action:@selector(filterItemClick)];
//        _fileterItem.tintColor = JCBaseColor;
    }
    return _fileterItem;
}

- (UIBarButtonItem *)settingItem {
    if (!_settingItem) {
        UIButton *setBtn = [UIButton new];
        setBtn.frame = CGRectMake(0, 0, 30, 44);
        [setBtn setImage:JCIMAGE(@"jc_jq_setting") forState:0];
        [setBtn setImage:JCIMAGE(@"jc_jq_setting") forState:UIControlStateHighlighted];
        [setBtn addTarget:self action:@selector(settingItemClick) forControlEvents:UIControlEventTouchUpInside];
        _settingItem= [[UIBarButtonItem alloc] initWithCustomView:setBtn];
        _settingItem.tintColor = JCBaseColor;
    }
    return _settingItem;
}



- (UIBarButtonItem *)spaceItem {
    if (!_spaceItem) {
        _spaceItem =   [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
        _spaceItem.width = -40;
    }
    return _spaceItem;
}

//UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
//spaceItem.width = 15;
@end
