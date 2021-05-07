//
//  JCYCHongBaoWMVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/3/30.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCYCHongBaoWMVC.h"
#import "JCYuCeHongBaoViewController.h"

@interface JCYCHongBaoWMVC ()

@end

@implementation JCYCHongBaoWMVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationBarStyle = JCNavigationBarStyleDefault;
    [self setNavBackImg];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationBarStyle = JCNavigationBarStyleDefault;
}

- (void)viewDidLoad {
    [self initWMViews];
    [super viewDidLoad];
//    [self initData];
    
    self.title = @"我的红包卡券";

}

- (NSArray<NSString *> *)titles {
    return @[@"优惠券",@"现金红包",@"免单券"];
}
- (void)initWMViews {
    self.menuViewStyle = WMMenuViewStyleLine;
    self.progressViewBottomSpace = 0;
    self.progressColor= COLOR_F74F4F;
    self.titleColorSelected = COLOR_2F2F2F;
    self.titleColorNormal = COLOR_2F2F2F;
    self.titleSizeNormal = 14;
    self.titleSizeSelected = 14;
    self.progressWidth = AUTO(28);
    //    self.pageAnimatable = YES;
//    self.titleFontName = @"PingFangSC-Regular";
    
//    self.itemMargin = 20;
    self.menuView.backgroundColor = [UIColor whiteColor];
    self.automaticallyCalculatesItemWidths = YES;
}

- (void)back:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
    if (self.JCBlock) {
        self.JCBlock();
    }
}

#pragma mark <WMPageControllerDelegate>
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController * _Nonnull)pageController {
    return  self.titles.count;
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForMenuView:(WMMenuView *)menuView {
    menuView.scrollView.backgroundColor = JCWhiteColor;
    menuView.backgroundColor = JCWhiteColor;
    return CGRectMake(0.0f, 0.0f, SCREEN_WIDTH, 40);
}

-(CGRect)pageController:(WMPageController *)pageController preferredFrameForContentView:(WMScrollView *)contentView {
    return CGRectMake(0, 40, SCREEN_WIDTH, SCREEN_HEIGHT-40-kNavigationBarHeight-kBottomTabSafeAreaHeight);
    
}

- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {


    
    JCYuCeHongBaoViewController *vc = [JCYuCeHongBaoViewController new];
    
    if (index==0) {
        vc.type = @"3";
    }
    if (index==1) {
        vc.type = @"1";
     }
    if (index==2) {
        vc.type = @"2";
     }
    
    return vc;
    
    
}
- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    return self.titles[index];
}

- (void)pageController:(WMPageController *)pageController didEnterViewController:(__kindof UIViewController *)viewController withInfo:(NSDictionary *)info {

}

@end
