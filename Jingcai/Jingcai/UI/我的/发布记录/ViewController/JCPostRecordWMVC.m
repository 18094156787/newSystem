//
//  JCPostRecordWMVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/11/6.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCPostRecordWMVC.h"
#import "JCPostRecordVC.h"
@interface JCPostRecordWMVC ()

@property (nonatomic,strong) UIView *lineView;

@end

@implementation JCPostRecordWMVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationBarStyle = JCNavigationBarStyleDefault;
//    [self setNavBackImg];
    [self hideNavShadow];
}


- (void)viewDidLoad {
    [self initWMViews];
    [super viewDidLoad];
    self.title = @"发布记录";
    [self refreshData];
}

- (void)refreshData {


}

- (NSArray<NSString *> *)titles {
    return @[@"待审核",@"已发布"];
}
- (void)initWMViews {
    self.menuViewStyle = WMMenuViewStyleLine;
    self.progressViewBottomSpace = 1;
    self.progressColor= JCBaseColor;
    self.titleColorSelected = COLOR_2F2F2F;
    self.titleColorNormal = COLOR_2F2F2F;
    self.titleSizeNormal = 14;
    self.titleSizeSelected = 14;
    self.menuItemWidth = SCREEN_WIDTH/3.0f;
    self.progressWidth = AUTO(28);
    //    self.pageAnimatable = YES;
//    self.titleFontName = @"PingFangSC-Semibold";
    
//    self.itemMargin = 20;
    self.menuView.backgroundColor = COLOR_F4F6F9;
//    self.automaticallyCalculatesItemWidths = YES;
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
    JCPostRecordVC *vc = [JCPostRecordVC new];
    if (index==0) {
        vc.type = 1;
    }
    if (index==1) {
        vc.type = 2;
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
