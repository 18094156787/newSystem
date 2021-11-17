
//  JCBigDataWMVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/24.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBigDataWMVC.h"
#import "JCJingCaiAIWMStickVC.h"
#import "JCDatabaseViewController.h"
#import "JCMyBuyPlanWMViewController.h"
#import "JCJingCaiAIBigDataHomeVC.h"
#import "JCJingCaiAIBigDataStickVC.h"
#import "UISegmentedControl+Extension.h"
#import "LMJTab.h"
#import "JCMainTabBarController.h"
#import "JCShowModel.h"
#import "JCDataModelHomeVC.h"
@interface JCBigDataWMVC ()<LMJTabDelegate>

@property (nonatomic, strong) NSArray *titleArray;

@property (nonatomic, strong) UISegmentedControl *segControl;

@property (nonatomic, strong) LMJTab * tabSegment;//

@property (nonatomic, strong) UIBarButtonItem *buyRecordItem;

@property (nonatomic, strong) NSMutableArray *dataArray;

@property (nonatomic, strong) NSMutableArray *itemWidthArray;

@property (nonatomic,assign) BOOL needNextGetData;//是否需要下次页面出现的时候请求数据

@end

@implementation JCBigDataWMVC


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
     self.navigationBarStyle = JCNavigationBarStyleDefault;
    [self hideNavShadow];
    if (self.needNextGetData) {
        [self showActivityTipView];
    }
}


- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
      self.navigationBarStyle = JCNavigationBarStyleDefault;

}

- (instancetype)init {
    if (self = [super init]) {
//        self.height = kWMTopHeadHeight;
        [self defaultData];
        self.titleSizeNormal = 18;
        self.titleSizeSelected = 20;
        self.titleColorSelected = JCBaseColor;//COLOR_FE1F19
        self.titleColorNormal = COLOR_9F9F9F;
//        self.menuViewStyle = WMMenuViewStyleFloodHollow;
        self.itemsWidths = @[@(120),@(90),@(60)];
//        self.menuItemWidth = AUTO(90);
        self.menuViewLayoutMode = WMMenuViewLayoutModeLeft;
//        self.menuViewContentMargin = -20;
//        self.menuViewContentMargin = 30;
        self.progressHeight =30;
        self.progressColor = [UIColor redColor];
        self.titleFontName = @"PingFangSC-Medium";
        self.showOnNavigationBar = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"资料库";
    [self initViews];
    [self getHomeTab];
    [self showActivityTipView];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(isInCurrentVC) name:NotificationUserLogin object:nil];
}

- (void)defaultData {
    self.titleArray = @[@"数据模型",@"鲸猜AI",@"资料库"];
    for (int i=0; i<3; i++) {
        JCShowModel *model = [JCShowModel new];
        if (i==0) {
            model.title = @"数据模型";
            model.is_show_dataModel = @"1";
        }
        if (i==1) {
            model.title = @"鲸猜AI";
            model.is_show_whale_ai = @"1";
        }
        if (i==2) {
            model.title = @"资料库";
            model.is_show_database = @"1";
        }
        [self.dataArray addObject:model];
    }
}

- (void)getHomeTab {
    
//    [self.view showLoading];
    JCHomeService_New *service = [JCHomeService_New service];
    [service getHomeTabWithsuccess:^(id  _Nullable object) {
        //        self.titleArray = @[@"推荐",@"干货",@"情报"];
         if ([JCWJsonTool isSuccessResponse:object]) {
             if (object[@"data"][@"is_show_expert_qr_code"]) {
                 NSString *is_show_expert_qr_code = object[@"data"][@"is_show_expert_qr_code"];
                 [[NSUserDefaults standardUserDefaults] setObject:is_show_expert_qr_code forKey:@"is_show_expert_qr_code"];
             }
             if (object[@"data"][@"show_odds"]) {
                 NSString *show_odds = object[@"data"][@"show_odds"];
                 [[NSUserDefaults standardUserDefaults] setObject:show_odds forKey:@"show_odds"];
             }
             
             
             NSString *is_show_big_data   = object[@"data"][@"is_show_big_data"];
//             is_show_big_data = @"1";
             NSString *is_show_whale_ai   = object[@"data"][@"is_show_whale_ai"];
//             is_show_whale_ai = @"1";
             if ([is_show_big_data integerValue]==1&&[is_show_whale_ai integerValue]==1) {
                 return;
             }
             NSMutableArray *titleArray = [NSMutableArray array];
             [self.dataArray removeAllObjects];
//             if ([is_show_big_data intValue]==1) {
//                 JCShowModel *is_show_big_data_model = [JCShowModel new];
//                 is_show_big_data_model.title = @"鲸猜大数据";
//                 is_show_big_data_model.is_show_big_data = @"1";
//                 [self.dataArray addObject:is_show_big_data_model];
//                 [titleArray addObject:@"鲸猜大数据"];
//                 [self.itemWidthArray addObject:@(120)];
////                 self.itemsWidths = @[@(AUTO(90)),@(AUTO(90)),@(AUTO(50))];
//             }
             JCShowModel *is_data_model = [JCShowModel new];
             is_data_model.title = @"数据模型";
             is_data_model.is_show_dataModel = @"1";
             [self.dataArray addObject:is_data_model];
             [titleArray addObject:@"数据模型"];
             [self.itemWidthArray addObject:@(90)];
             if ([is_show_whale_ai intValue]==1) {
                 JCShowModel *is_show_whale_ai_model = [JCShowModel new];
                 is_show_whale_ai_model.title = @"鲸猜AI";
                 is_show_whale_ai_model.is_show_whale_ai = @"1";
                 [self.dataArray addObject:is_show_whale_ai_model];
                 [titleArray addObject:@"鲸猜AI"];
                 [self.itemWidthArray addObject:@(80)];
             }
             JCShowModel *is_show_big_data_model = [JCShowModel new];
             is_show_big_data_model.title = @"资料库";
             is_show_big_data_model.is_show_database = @"1";
             [self.dataArray addObject:is_show_big_data_model];
             [titleArray addObject:@"资料库"];
             [self.itemWidthArray addObject:@(68)];
             
             self.titleArray = [NSArray arrayWithArray:titleArray];

//             if (self.titleArray.count==1) {
//                 UILabel *titleView = [UILabel initWithTitle:@"资料库" andFont:AUTO(18) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
//                 titleView.frame = CGRectMake(50, 0, SCREEN_WIDTH-100, 44);
//                 self.navigationItem.titleView = titleView;
//                 
//                 UIBarButtonItem *leftItem =  [[UIBarButtonItem alloc] initWithImage:JCIMAGE(@"icon_fagm") style:0 target:nil action:nil];
//                 leftItem.tintColor = JCClearColor;
//                 self.navigationItem.leftBarButtonItem = leftItem;
//                 
//             }
//             self.itemsWidths = @[@(110),@(90)];
             self.itemsWidths = [NSArray arrayWithArray:self.itemWidthArray];
             [self forceLayoutSubviews];
             [self reloadData];

            
         }
        

    } failure:^(NSError * _Nonnull error) {
        [self reloadData];
    }];

}

- (void)showActivityTipView {
    self.needNextGetData = NO;
    [self showActivityPresentWithPosition:@"4" ViewController:self];//获取活动弹窗
}

//当前页面处于JCMainTabBarController的选中页面
- (void)isInCurrentVC {
    
    JCMainTabBarController *tabBarController = (JCMainTabBarController *)[UIApplication sharedApplication].delegate.window.rootViewController;
    BOOL value =  [tabBarController isCurrentBaseVCWtihIndex:3]&&self.navigationController.topViewController==self;
    self.needNextGetData = !value;//是否需要下次页面出现的时候请求数据
    if (value) {
        [self showActivityTipView];
    }
}


- (void)initViews {
    UIView *titleView = [UIView new];
    titleView.frame = CGRectMake(0, 0, 270, 26);
    self.segControl.frame = CGRectMake(0, 0, 270, 26);

    self.buyRecordItem = [[UIBarButtonItem alloc] initWithImage:JCIMAGE(@"icon_fagm") style:0 target:self action:@selector(recordItemClick)];//购买记录
    self.buyRecordItem.tintColor = JCBaseColor;
    self.navigationItem.rightBarButtonItem = self.buyRecordItem;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - ScrollViewDelegate



#pragma mark - Datasource & Delegate
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController {
    return self.dataArray.count;
}

- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
    JCShowModel *model = self.dataArray[index];
//    if ([model.is_show_big_data integerValue]==1) {
//        JCJingCaiAIBigDataStickVC *vc = [JCJingCaiAIBigDataStickVC new];
//        return vc;
//    }
    if ([model.is_show_dataModel integerValue]==1) {
        JCDataModelHomeVC *vc = [JCDataModelHomeVC new];
        return vc;
    }

    if ([model.is_show_whale_ai integerValue]==1) {
        JCJingCaiAIWMStickVC *vc = [JCJingCaiAIWMStickVC new];
         return vc;
    }

    JCDatabaseViewController *vc = [JCDatabaseViewController new];
    return vc;
    


}

- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    JCShowModel *model = self.dataArray[index];
    return model.title;
}

- (void)pageController:(WMPageController *)pageController willEnterViewController:(__kindof UIViewController *)viewController withInfo:(NSDictionary *)info {

    JCShowModel *model = self.dataArray[self.selectIndex];
    if ([model.is_show_database integerValue]==1) {
        UIBarButtonItem *righItem =  [[UIBarButtonItem alloc] initWithImage:JCIMAGE(@"icon_fagm") style:0 target:nil action:nil];
        righItem.tintColor = JCClearColor;
        self.navigationItem.rightBarButtonItem = righItem;
        
        
    }else{
        self.navigationItem.rightBarButtonItem = self.buyRecordItem;
    }
}

- (void)pageController:(WMPageController *)pageController didEnterViewController:(__kindof UIViewController *)viewController withInfo:(NSDictionary *)info {
//    NSLog(@"已经%d",self.selectIndex);
//    [self.segControl setSelectedSegmentIndex:(NSInteger)self.selectIndex];
    self.tabSegment.selectIndex = (NSInteger)self.selectIndex;

}
- (CGRect)pageController:(WMPageController *)pageController preferredFrameForMenuView:(WMMenuView *)menuView {
//    menuView.backgroundColor = COLOR_F0F0F0;
    float height = 44;
    if (self.dataArray.count==1) {
        height = 0;
    }
    return CGRectMake(0, 0, SCREEN_WIDTH-60, height);

}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForContentView:(WMScrollView *)contentView {

    return CGRectMake(0, 0, self.view.frame.size.width, SCREEN_HEIGHT-NavigationStatusBarHeight-kTabBarHeight);
}



-(void)tab:(LMJTab *)tab didSelectedItemNumber:(NSInteger)number{
    NSLog(@"CLICKED:%ld",number);
    self.selectIndex = (int)number;
    [self.scrollView setContentOffset:CGPointMake(SCREEN_WIDTH*number, 0) animated:NO];
}

- (void)recordItemClick {
    if (![JCWUserBall currentUser]) {
        [self presentLogin];
        return;
    }
    JCMyBuyPlanWMViewController *vc = [JCMyBuyPlanWMViewController new];
    JCShowModel *model = self.dataArray[self.selectIndex];
    if ([model.is_show_big_data integerValue]==1) {
        vc.selectIndex = 4;
    }
    if ([model.is_show_whale_ai integerValue]==1) {
        vc.selectIndex = 3;
    }
    
    [self.navigationController pushViewController:vc animated:YES];//JCJingCaiAIWMStickVC,
}


- (UISegmentedControl *)segControl {
    if (!_segControl) {
        _segControl = [[UISegmentedControl alloc] initWithItems:self.titleArray];
    }
    return _segControl;
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
- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (NSMutableArray *)itemWidthArray {
    if (!_itemWidthArray) {
        _itemWidthArray = [NSMutableArray array];
    }
    return _itemWidthArray;
}

@end
