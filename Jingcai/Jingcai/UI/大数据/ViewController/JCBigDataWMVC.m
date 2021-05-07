//
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

@interface JCBigDataWMVC ()<LMJTabDelegate>

@property (nonatomic, strong) NSArray *titleArray;

@property (nonatomic, strong) UISegmentedControl *segControl;

@property (nonatomic, strong) LMJTab * tabSegment;//

@property (nonatomic, strong) UIBarButtonItem *buyRecordItem;

@end

@implementation JCBigDataWMVC

- (NSArray *)titleArray {
    if (!_titleArray) {
        
        _titleArray = @[@"鲸猜大数据",@"鲸猜AI",@"资料库"];
//        _titleArray = @[@"鲸猜大数据",@"资料库"];
    }
    return _titleArray;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
     self.navigationBarStyle = JCNavigationBarStyleDefault;
//    [self setNavBackImg];
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
    [self showActivityPresentWithPosition:@"4" ViewController:self];//获取活动弹窗
}



- (void)initViews {
    UIView *titleView = [UIView new];
    titleView.frame = CGRectMake(0, 0, 270, 26);
    self.segControl.frame = CGRectMake(0, 0, 270, 26);
//    [titleView addSubview:self.segControl];
////    self.segControl.frame = CGRectMake(0, 0, 270, 26);
//    self.navigationItem.titleView = titleView;
//    self.segControl.backgroundColor= JCClearColor;
//    [self.segControl setTitleTextAttributes:@{NSForegroundColorAttributeName:COLOR_9F9F9F,NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Regular" size:12]} forState:UIControlStateNormal];
//    [self.segControl setTitleTextAttributes:@{NSForegroundColorAttributeName:JCWhiteColor,NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Regular" size:12]} forState:UIControlStateSelected];
//    [self.segControl setTintColor:JCBaseColor normalColor:COLOR_9F9F9F];
//
//
//    self.segControl.selectedSegmentIndex = 0;
//    [self.segControl addTarget:self action:@selector(segControlClick:) forControlEvents:UIControlEventValueChanged];

    
    
    LMJTab * tab = [[LMJTab alloc] initWithFrame:CGRectMake(0, 0, 270, 26) lineWidth:1 lineColor:[UIColor whiteColor]];
    [tab setItemsWithTitle:self.titleArray normalItemColor:COLOR_F0F0F0 selectItemColor:JCBaseColor normalTitleColor:COLOR_9F9F9F selectTitleColor:[UIColor whiteColor] titleTextSize:12 selectItemNumber:0];
    tab.layer.cornerRadius = 5.0;
    self.tabSegment = tab;
    [titleView addSubview:tab];
    tab.delegate = self;
    self.navigationItem.titleView = titleView;
//    tab.selectIndex = 2;
    
    
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
    return self.titleArray.count;
}

- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
    if (index==0) {

        JCJingCaiAIBigDataStickVC *vc = [JCJingCaiAIBigDataStickVC new];
        return vc;
    }
    if (index==1) {
        JCJingCaiAIWMStickVC *vc = [JCJingCaiAIWMStickVC new];
         return vc;
    }

    JCDatabaseViewController *vc = [JCDatabaseViewController new];
    return vc;
    

//    if (index==0) {
//        JCJingCaiAIBigDataHomeVC *vc = [JCJingCaiAIBigDataHomeVC new];
//        return vc;
//    }
//
//    JCDatabaseViewController *vc = [JCDatabaseViewController new];
//    return vc;
    

}

- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    return self.titleArray[index];
}

- (void)pageController:(WMPageController *)pageController willEnterViewController:(__kindof UIViewController *)viewController withInfo:(NSDictionary *)info {
    
//    NSLog(@"将会%d",self.selectIndex);
    if (self.selectIndex==2) {
        self.navigationItem.rightBarButtonItem = nil;
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

- (void)recordItemClick {
    if (![JCWUserBall currentUser]) {
        [self presentLogin];
        return;
    }
    JCMyBuyPlanWMViewController *vc = [JCMyBuyPlanWMViewController new];
    if (self.selectIndex==0) {
        vc.selectIndex = 3;
    }
    if (self.selectIndex==1) {
        vc.selectIndex = 2;
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
@end
