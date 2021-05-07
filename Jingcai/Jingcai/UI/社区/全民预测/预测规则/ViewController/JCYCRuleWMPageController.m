//
//  JCYCRuleWMPageController.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/4/13.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCYCRuleWMPageController.h"
#import "JCYCRuleViewController.h"
#import <YYLabel.h>
#import "JCJingCaiRuleModel.h"
//#import <yytex>
@interface JCYCRuleWMPageController ()

@property (nonatomic,strong) NSMutableArray *titleArray;

@property (nonatomic,strong) NSMutableArray *dataArray;

@property (nonatomic,strong) NSString *wx;

@end

@implementation JCYCRuleWMPageController

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

    self.view.backgroundColor = COLOR_F0F0F0;
    self.scrollView.backgroundColor = JCClearColor;
    self.title = @"预测规则";
    [self initData];
}

- (void)initData {
    if (self.settingModel.select_sum.length>0) {
        [self.titleArray addObject:@"单场"];
        JCJingCaiRuleModel *model = [JCJingCaiRuleModel new];
        model.title = @"单场";
        model.content = self.settingModel.future_rule;
        [self.dataArray addObject:model];
    }
    if (self.settingModel.select_sum.length>0) {
        [self.titleArray addObject:@"连红签约"];
        JCJingCaiRuleModel *model = [JCJingCaiRuleModel new];
        model.title = @"连红签约";
        model.content = self.settingModel.talent_rule;
        [self.dataArray addObject:model];
    }
    [self reloadData];

}



//- (NSArray<NSString *> *)titles {
//    return @[@"总揽",@"单场",@"连红签约"];
//}
- (void)initWMViews {
    self.menuViewStyle = WMMenuViewStyleLine;
    self.progressViewBottomSpace = 0;
    self.progressColor= JCBaseColor;
    self.progressWidth = AUTO(28);
    self.titleColorSelected = COLOR_2F2F2F;
    self.titleColorNormal = COLOR_2F2F2F;
    self.titleSizeNormal = 14;
    self.titleSizeSelected = 14;
    //    self.pageAnimatable = YES;
//    self.titleFontName = @"PingFangSC-Medium";
    
//    self.itemMargin = 20;
    self.menuView.backgroundColor = [UIColor whiteColor];
    self.automaticallyCalculatesItemWidths = YES;
}


#pragma mark <WMPageControllerDelegate>
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController * _Nonnull)pageController {
    return  self.titleArray.count;
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

    JCYCRuleViewController *vc = [JCYCRuleViewController new];

    JCJingCaiRuleModel *model = self.dataArray[index];
    if (model) {
        vc.dataArray = [NSMutableArray arrayWithObject:model];
    }


    return vc;
    
    
}
- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    return self.titleArray[index];
}

- (void)pageController:(WMPageController *)pageController didEnterViewController:(__kindof UIViewController *)viewController withInfo:(NSDictionary *)info {

}

- (NSMutableArray *)titleArray {
    if (!_titleArray) {
        _titleArray = [NSMutableArray array];
    }
    return _titleArray;
}

- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

@end
