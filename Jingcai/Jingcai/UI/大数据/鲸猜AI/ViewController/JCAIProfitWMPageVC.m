//
//  JCAIProfitWMPageVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/25.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCAIProfitWMPageVC.h"
#import "JCAiProfitDetailVC.h"
@interface JCAIProfitWMPageVC ()

@property (nonatomic, strong) NSArray *titleArray;

@property (nonatomic,strong) UIView *lineView;

@end

@implementation JCAIProfitWMPageVC

- (NSArray *)titleArray {
    if (!_titleArray) {
        _titleArray = @[@"让球",@"进球数"];
    }
    return _titleArray;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
     self.navigationBarStyle = JCNavigationBarStyleDefault;
    [self setNavBackImg];
}


//- (void)viewWillDisappear:(BOOL)animated {
//    [super viewWillDisappear:animated];
//      self.navigationBarStyle = JCNavigationBarStyleDefault;
//
//}
- (void)initWMViews {
    self.menuViewStyle = WMMenuViewStyleLine;
    self.progressViewBottomSpace = 1;
    self.progressColor= JCBaseColor;
    self.titleColorSelected = COLOR_2F2F2F;
    self.titleColorNormal = COLOR_2F2F2F;
    self.titleSizeNormal = 14;
    self.titleSizeSelected = 14;
    self.progressWidth = AUTO(28);
    self.menuView.backgroundColor = COLOR_F4F6F9;
    self.automaticallyCalculatesItemWidths = YES;
}

//- (instancetype)init {
//    if (self = [super init]) {
////        self.height = kWMTopHeadHeight;
//        self.titleSizeNormal = 15;
//        self.titleSizeSelected = 15;
//        self.titleColorSelected = COLOR_333333;//COLOR_FE1F19
//        self.titleColorNormal = COLOR_999999;
//        self.menuViewStyle = WMMenuViewStyleLine;
////        self.itemsWidths = @[@(70),@(90),@(70)];
//        self.progressHeight = 40;
//        self.progressColor = JCBaseColor;
//
////        self.progressColor = [UIColor colorWithRed:168.0/255.0 green:20.0/255.0 blue:4/255.0 alpha:1];
////        self.showOnNavigationBar = YES;
////        self.menuViewLayoutMode = WMMenuViewLayoutModeCenter;
////        self.titleFontName = @"PingFangSC-Medium";
////        [self setNavBackImg];
////        self.contentView.bounces = NO;
//    }
//    return self;
//}

- (void)viewDidLoad {
    [self initWMViews];
    [super viewDidLoad];
    self.title = @"盈利率数据详情";
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
    if (self.rqArray.count>0) {
        JCAiProfitDetailVC *vc = [JCAiProfitDetailVC new];
        if (index==0) {
            vc.dataSource = self.rqArray;
        }
        if (index==1) {
            vc.dataSource = self.jqsArray;
        }
        return vc;
    }
    
    JCAiProfitDetailVC *vc = [JCAiProfitDetailVC new];
        vc.dataSource = self.jqsArray;
    return vc;
    

}

- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    return self.titleArray[index];
}

- (void)pageController:(WMPageController *)pageController willEnterViewController:(__kindof UIViewController *)viewController withInfo:(NSDictionary *)info {
    
//    NSLog(@"将会%d",self.selectIndex);
}


- (CGRect)pageController:(WMPageController *)pageController preferredFrameForMenuView:(WMMenuView *)menuView {
    menuView.backgroundColor = JCWhiteColor;
    self.lineView.frame = CGRectMake(0, 43, SCREEN_WIDTH, 1);
    [menuView addSubview:self.lineView];
    return CGRectMake(0, 0, self.view.frame.size.width, 44);

}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForContentView:(WMScrollView *)contentView {

    return CGRectMake(0, 44, self.view.frame.size.width, SCREEN_HEIGHT-NavigationStatusBarHeight-kBottomTabSafeAreaHeight-44);
}

- (void)setJqsArray:(NSArray *)jqsArray {
    _jqsArray = jqsArray;
    if (self.rqArray.count==0) {
        self.titleArray = @[@"进球数"];
    }
    
    [self reloadData];
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [UIView new];
        _lineView.backgroundColor = COLOR_DDDDDD;
    }
    return _lineView;;
}
@end
