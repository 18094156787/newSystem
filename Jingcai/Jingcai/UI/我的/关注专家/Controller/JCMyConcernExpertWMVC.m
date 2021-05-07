//
//  JCMyConcernExpertWMVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/8/28.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCMyConcernExpertWMVC.h"
#import "JCMyConcernExpertVC.h"
@interface JCMyConcernExpertWMVC ()

@property (nonatomic,strong) UIView *lineView;

@end

@implementation JCMyConcernExpertWMVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationBarStyle = JCNavigationBarStyleDefault;
    [self setNavBackImg];
}


- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];

}
- (void)viewDidLoad {
    [self initWMViews];
    [super viewDidLoad];
    self.title = @"我的关注";
    
}

- (NSArray<NSString *> *)titles {
    return @[@"公众号专家",@"红榜达人",];
}
- (void)initWMViews {
    self.menuViewStyle = WMMenuViewStyleLine;
    self.progressViewBottomSpace = 1;
    self.progressColor= JCBaseColor;
    self.titleColorSelected = COLOR_2F2F2F;
    self.titleColorNormal = COLOR_2F2F2F;
    self.titleSizeNormal = 14;
    self.titleSizeSelected = 14;
    self.progressWidth = AUTO(28);
//    self.menuView.backgroundColor = COLOR_F4F6F9;
    self.automaticallyCalculatesItemWidths = YES;
}

#pragma mark <WMPageControllerDelegate>
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController * _Nonnull)pageController {
    return  self.titles.count;
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForMenuView:(WMMenuView *)menuView {
    menuView.scrollView.backgroundColor = JCWhiteColor;
    menuView.backgroundColor = JCWhiteColor;
    self.lineView.frame = CGRectMake(0, 43, SCREEN_WIDTH, 0.5);
    [menuView addSubview:self.lineView];
    menuView.backgroundColor = JCWhiteColor;
    return CGRectMake(0.0f, 0.0f, SCREEN_WIDTH, 44);
}

-(CGRect)pageController:(WMPageController *)pageController preferredFrameForContentView:(WMScrollView *)contentView {
    return CGRectMake(0, 44, SCREEN_WIDTH, SCREEN_HEIGHT-44-kNavigationBarHeight);
    
}

- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
    
    JCMyConcernExpertVC *vc = [JCMyConcernExpertVC new];
    if (index==0) {
        vc.type = @"2";
    }
    if (index==1) {
        vc.type = @"1";
    }
    return vc;
    
}
- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    return self.titles[index];
}

- (void)pageController:(WMPageController *)pageController didEnterViewController:(__kindof UIViewController *)viewController withInfo:(NSDictionary *)info {

}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [UIView new];
        _lineView.backgroundColor = COLOR_DDDDDD;
    }
    return _lineView;;
}

@end
