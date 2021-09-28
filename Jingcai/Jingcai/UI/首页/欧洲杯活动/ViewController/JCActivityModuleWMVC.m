//
//  JCActivityModuleWMVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/3/4.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCActivityModuleWMVC.h"
#import "JCActivityModuleSHeadView.h"
#import "JCActivityNewsVC.h"
#import "JCActivityMatchVC.h"
#import "JCActivityFanganVC.h"
#import "JCActivityHdViewController.h"
@interface JCActivityModuleWMVC ()

@end

@implementation JCActivityModuleWMVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationBarStyle = JCNavigationBarStyleTransparent;
    [self hideNavShadow];
    [self setNavBackImgWhiteColor];
    UIImage *navImg =[UIImage imageNamed:@"euro_img_bg"];
      navImg = [navImg resizableImageWithCapInsets:UIEdgeInsetsZero resizingMode:UIImageResizingModeStretch];
    [self.navigationController.navigationBar setBackgroundImage:navImg forBarMetrics:UIBarMetricsDefault];
    if (@available(iOS 15.0, *)) {
        [self configNavBarImage:@"euro_img_bg"];
    }
//    self.navigationBarStyle = JCNavigationBarStyleDefault;
//    [self hideNavShadow];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationBarStyle = JCNavigationBarStyleDefault;
    if (@available(iOS 15.0, *)) {
        [self configNavBarImageToNormal];
    }

}

- (void)viewDidLoad {
    [self initWMViews];
    [super viewDidLoad];
    self.title = @"欧洲杯";
    self.view.backgroundColor = COLOR_006DAB;
    // Do any additional setup after loading the view.
}

- (void)initWMViews {

    self.menuViewStyle = WMMenuViewStyleLine;
    self.progressViewBottomSpace = 3;
    self.progressColor= UIColorFromRGB(0x8BD827);
    self.titleColorSelected = JCWhiteColor;
    self.titleColorNormal = [JCWhiteColor colorWithAlphaComponent:0.6];
    self.titleSizeNormal = 14;
    self.titleSizeSelected = 14;
    self.progressHeight = 2;
    self.progressWidth = 28;
    self.menuItemWidth = (SCREEN_WIDTH-AUTO(20))/6.0f;

//    self.preloadPolicy = WMPageControllerPreloadPolicyNeighbour;//预加载下个vc
    
}

- (NSArray<NSString *> *)titles {
    return @[@"资讯",@"比赛",@"方案",@"活动"];
}

#pragma mark <WMPageControllerDelegate>
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController * _Nonnull)pageController {
    return  self.titles.count;
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForMenuView:(WMMenuView *)menuView {
//    menuView.scrollView.backgroundColor = JCWhiteColor;
    menuView.backgroundColor = JCClearColor;
    return CGRectMake(0.0f, kNavigationBarHeight, SCREEN_WIDTH, 44);
}

-(CGRect)pageController:(WMPageController *)pageController preferredFrameForContentView:(WMScrollView *)contentView {
    return CGRectMake(0, kNavigationBarHeight+44, SCREEN_WIDTH, SCREEN_HEIGHT-kNavigationBarHeight-44);
    
}

- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
    if (index==0) {
        return [JCActivityNewsVC new];
    }
    if (index==1) {
        JCActivityMatchVC *vc = [JCActivityMatchVC new];
        vc.type = @"9999";
        return vc;
    }
    if (index==2) {
        return [JCActivityFanganVC new];
    }
    
    
    return [JCActivityHdViewController new];
}
- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    return self.titles[index];
}

- (void)pageController:(WMPageController *)pageController didEnterViewController:(__kindof UIViewController *)viewController withInfo:(NSDictionary *)info {

}

@end
