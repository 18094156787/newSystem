//
//  JCTeamDetailZhuanHuiWMVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/16.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCTeamDetailZhuanHuiWMVC.h"
#import "JCTeamDetailZhuanHuiVC.h"
#import "JCTeamDetailZhuanHuiModel.h"
@interface JCTeamDetailZhuanHuiWMVC ()

@end

@implementation JCTeamDetailZhuanHuiWMVC

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
    self.title = @"转会记录";

}

- (NSArray<NSString *> *)titles {
    return @[@"转入记录",@"转出记录"];
}
- (void)initWMViews {
    self.menuViewStyle = WMMenuViewStyleLine;
    self.progressViewBottomSpace = 0;
    self.progressColor= JCBaseColor;
    self.progressWidth = AUTO(28);
    self.titleColorSelected = COLOR_2F2F2F;
    self.titleColorNormal = COLOR_2F2F2F;
    self.titleSizeNormal = 15;
    self.titleSizeSelected = 15;
//    self.menuItemWidth = SCREEN_WIDTH/2.0f;
//    self.progressWidth = SCREEN_WIDTH/2.0f;
    //    self.pageAnimatable = YES;
//    self.titleFontName = @"PingFangSC-Medium";
    
//    self.itemMargin = 20;
    self.menuView.backgroundColor = JCWhiteColor;
    self.automaticallyCalculatesItemWidths = YES;
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
    return CGRectMake(0, 40, SCREEN_WIDTH, SCREEN_HEIGHT-40-kNavigationBarHeight);
    
}

- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {

    if (index==0) {
        JCTeamDetailZhuanHuiVC *inVC = [JCTeamDetailZhuanHuiVC new];
        inVC.type = index+1;
        inVC.team_id = self.team_id;
        return inVC;
    }
    JCTeamDetailZhuanHuiVC *outVC = [JCTeamDetailZhuanHuiVC new];
    outVC.type = index+1;
    outVC.team_id = self.team_id;
    return outVC;
    
    
}
- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    return self.titles[index];
}

- (void)pageController:(WMPageController *)pageController didEnterViewController:(__kindof UIViewController *)viewController withInfo:(NSDictionary *)info {

}


@end
