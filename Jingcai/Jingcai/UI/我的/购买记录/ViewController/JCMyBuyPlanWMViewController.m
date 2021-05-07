//
//  JCMyBuyPlanWMViewController.m
//  Jingcai
//
//  Created by 陈继伟 on 2019/8/16.
//  Copyright © 2019年 blockstar. All rights reserved.
//

#import "JCMyBuyPlanWMViewController.h"
#import "JCMyBuyTuijianViewController.h"
#import "JCMyBuyDakaViewController.h"
#import "JCMyBuyAIViewController.h"
#import "JCMyBuyOrderDataViewController.h"
@interface JCMyBuyPlanWMViewController ()

@property (nonatomic,strong) UIView *lineView;

@end

@implementation JCMyBuyPlanWMViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationBarStyle = JCNavigationBarStyleDefault;
    [self hideNavShadow];
}


- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];

}
- (void)viewDidLoad {
    [self initWMViews];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self initViews];
    self.title = @"购买记录";
    
}

- (NSArray<NSString *> *)titles {
    return @[@"公众号方案",@"达人方案",@"AI方案",@"数据订阅"];
//    return @[@"公众号方案",@"达人方案",@"数据订阅"];
}
- (void)initWMViews {
    self.menuViewStyle = WMMenuViewStyleLine;
    self.progressViewBottomSpace = 1;
    self.progressColor= JCBaseColor;
    self.progressWidth = AUTO(28);
    self.titleColorSelected = COLOR_2F2F2F;
    self.titleColorNormal = COLOR_2F2F2F;
    self.titleSizeNormal = 14;
    self.titleSizeSelected = 14;

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
    if (index==0) {
        JCMyBuyDakaViewController *vc = [JCMyBuyDakaViewController new];
        vc.fatherView = self.view;
        return vc;
    }
    if (index==1) {
        JCMyBuyTuijianViewController *vc = [JCMyBuyTuijianViewController new];
        vc.fatherView = self.view;
        return vc;
    }
    if (index==2) {
        JCMyBuyAIViewController *vc = [JCMyBuyAIViewController   new];
        vc.fatherView = self.view;
        return vc;
    }
    JCMyBuyOrderDataViewController *vc = [JCMyBuyOrderDataViewController new];
    vc.fatherView = self.view;
    return vc;

    
//    if (index==0) {
//        JCMyBuyDakaViewController *vc = [JCMyBuyDakaViewController new];
//        return vc;
//    }
//    if (index==1) {
//        JCMyBuyTuijianViewController *vc = [JCMyBuyTuijianViewController new];
//        return vc;
//    }
//
//    JCMyBuyOrderDataViewController *vc = [JCMyBuyOrderDataViewController new];
//    return vc;
    

    
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


#pragma mark Button Click



@end
