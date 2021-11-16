//
//  JCExpertWMViewController.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/4/30.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCExpertWMViewController.h"
#import "JCDakaExpertVC.h"
@interface JCExpertWMViewController ()

@end

@implementation JCExpertWMViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationBarStyle = JCNavigationBarStyleDefault;
    [self setNavBackImg];
    [self hideNavShadow];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationBarStyle = JCNavigationBarStyleDefault;
}



- (void)viewDidLoad {
    [self initWMViews];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self initViews];
    self.title = @"专家/达人";
}


- (void)initWMViews {
    self.menuViewStyle = WMMenuViewStyleLine;
    self.progressViewBottomSpace = 0;
    self.progressColor= JCBaseColor;
    self.titleColorSelected = COLOR_2F2F2F;
    self.titleColorNormal = COLOR_2F2F2F;
    self.titleSizeNormal = 14;
    self.titleSizeSelected = 14;
    self.progressHeight = 2;
    self.progressWidth = AUTO(28);
//    self.progressWidth = SCREEN_WIDTH/2.0f;
//    self.pageAnimatable = NO;
//    self.titleFontName = @"PingFangSC-Medium";
    self.itemMargin = 0;
    self.menuView.backgroundColor = [UIColor whiteColor];
//    self.menuItemWidth =50;
    self.automaticallyCalculatesItemWidths = YES;
    

}


#pragma mark <WMPageControllerDelegate>
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController * _Nonnull)pageController {
    return  self.titles.count;
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForMenuView:(WMMenuView *)menuView {
    menuView.scrollView.backgroundColor = JCClearColor;
    menuView.backgroundColor = JCWhiteColor;
    return CGRectMake(0, 0, SCREEN_WIDTH, 44);
}

-(CGRect)pageController:(WMPageController *)pageController preferredFrameForContentView:(WMScrollView *)contentView {
    return CGRectMake(0, 44, SCREEN_WIDTH, SCREEN_HEIGHT-kNavigationBarHeight-44);
    
}

- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
    if (index==0) {
       JCDakaExpertVC *vc = [JCDakaExpertVC new];
        vc.type = @"1";
        return vc;
    }
    JCDakaExpertVC *vc = [JCDakaExpertVC new];
    vc.type = @"2";
    return vc;
    
}

- (void)pageController:(WMPageController *)pageController didEnterViewController:(__kindof UIViewController *)viewController withInfo:(NSDictionary *)info {

    
}


- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    return self.titles[index];
}






- (NSArray<NSString *> *)titles {
    return @[@"鲸猜专家",@"红榜达人"];
}

@end
