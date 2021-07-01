//
//  JCMatchHomeWMVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/6/16.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCMatchHomeWMVC.h"
#import "JCMatchViewController.h"
#import "JCMatchFilterWMVC.h"
#import "JCMatchConcernVC.h"
#import "JCMatchTipSettingVC.h"
#import "JCMathEnterGaolTipView.h"
#import "JCActivityTipView.h"
#import "JCActivityDetailCommomVC.h"
@interface JCMatchHomeWMVC ()

@property (nonatomic,strong) JCMatchViewController *scVC;//赛程

@property (nonatomic,strong) JCMatchViewController *goingVC;//进行中

@property (nonatomic,strong) JCMatchViewController *endVC;//已完成

@property (nonatomic,strong) JCMatchConcernVC *concernVC;//关注

@property (nonatomic,strong) JCMatchFilterWMVC *filterVC;//筛选

@property (nonatomic,strong) JCMathEnterGaolTipView *goalTipView;

@property (nonatomic,strong) UIView *lineView;

@end

@implementation JCMatchHomeWMVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self hideNavShadow];
    self.navigationBarStyle = JCNavigationBarStyleDefault;
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationBarStyle = JCNavigationBarStyleDefault;
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
}

- (void)viewDidLoad {
    [self initWMViews];
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}

- (void)initWMViews {
    self.menuViewStyle = WMMenuViewStyleLine;
    self.progressViewBottomSpace = 1;
    self.progressColor= JCBaseColor;
    self.titleColorSelected = COLOR_2F2F2F;
    self.titleColorNormal = COLOR_2F2F2F;
    self.titleSizeNormal = AUTO(14);
    self.titleSizeSelected = AUTO(14);
    self.progressHeight = 2;

    self.menuViewContentMargin = 0;
    self.itemsMargins = @[@(1),@(1),@(1),@(1),@(1)];
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
    menuView.backgroundColor = JCClearColor;
    self.lineView.frame = CGRectMake(0, 44-1, SCREEN_WIDTH, 1);
    [menuView addSubview:self.lineView];
    return CGRectMake(0, 0, SCREEN_WIDTH, 44);
}

-(CGRect)pageController:(WMPageController *)pageController preferredFrameForContentView:(WMScrollView *)contentView {

    return CGRectMake(0, 44, SCREEN_WIDTH, SCREEN_HEIGHT-kNavigationBarHeight-44-kTabBarHeight-10);
    
}

- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
    if (index==0) {
        return self.scVC;
    }
    if (index==1) {
        return self.goingVC;
    }
    if (index==2) {
        return self.endVC;
        
    }
    return self.concernVC;
    
    
}

- (void)pageController:(WMPageController *)pageController willEnterViewController:(__kindof UIViewController *)viewController withInfo:(NSDictionary *)info {
    NSLog(@"%d",self.selectIndex);



}
- (void)pageController:(WMPageController *)pageController didEnterViewController:(__kindof UIViewController *)viewController withInfo:(NSDictionary *)info {
    if (self.JCIndexBlock) {
        self.JCIndexBlock(self.selectIndex);
    }
}




- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    return self.titles[index];
}

- (NSArray<NSString *> *)titles {
    return @[@"赛程",@"进行中",@"已完场",@"关注"];
}

- (void)filterItemClick {
    WeakSelf;
    NSString *type = [NSString stringWithFormat:@"%d",self.selectIndex];
    self.filterVC.selectIndex = 0;
    self.filterVC.type = type;
    if (self.selectIndex==0) {
        self.filterVC.time = self.scVC.time;
    } else   if (self.selectIndex==2) {
        self.filterVC.time = self.endVC.time;
    }else{
        self.filterVC.time = @"";
    }

    [self.navigationController pushViewController:self.filterVC animated:YES];
    self.filterVC.JCFilterBlock = ^(NSArray * _Nonnull eventIdArray, NSString * _Nonnull screening) {
        NSString *jsonStr = @"";
        for (int i=0; i<eventIdArray.count; i++) {
            NSString *str = eventIdArray[i];
            if (i==0) {
                jsonStr = str;
            }else{
                jsonStr = [NSString stringWithFormat:@"%@,%@",jsonStr,str];
            }
        }
//        screening;//筛选类别 1首页重要 等于 重要+筛选+北单 并集 2筛选-重要 3筛选-全部 4筛选-竟足 5筛选-北单 默认3
        if (self.selectIndex==0) {
            weakSelf.scVC.eventArray = jsonStr;
            weakSelf.scVC.screening = screening;
            [weakSelf.scVC filtertAll];
            [weakSelf.scVC filterData];
        }
        if (self.selectIndex==1) {
            weakSelf.goingVC.eventArray = jsonStr;
            weakSelf.goingVC.screening = screening;
            [weakSelf.goingVC filtertAll];
            [weakSelf.goingVC filterData];
        }
        if (self.selectIndex==2) {
            weakSelf.endVC.eventArray = jsonStr;
            weakSelf.endVC.screening = screening;
            [weakSelf.endVC filtertAll];
            [weakSelf.endVC filterData];
        }
        
        [weakSelf.navigationController popViewControllerAnimated:YES];

    };

}

- (void)settingItemClick {
    [self.navigationController pushViewController:[JCMatchTipSettingVC new] animated:YES];
}



- (JCMatchViewController *)scVC {
    if (!_scVC) {
        _scVC = [JCMatchViewController new];
        _scVC.type = @"0";
    }
    return _scVC;
}


- (JCMatchViewController *)goingVC {
    if (!_goingVC) {
        _goingVC = [JCMatchViewController new];
        _goingVC.type = @"1";
    }
    return _goingVC;
}


- (JCMatchViewController *)endVC {
    if (!_endVC) {
        _endVC = [JCMatchViewController new];
        _endVC.type = @"2";
    }
    return _endVC;
}

- (JCMatchConcernVC *)concernVC {
    if (!_concernVC) {
        _concernVC = [JCMatchConcernVC new];
        _concernVC.type = @"3";
    }
    return _concernVC;
}

- (JCMatchFilterWMVC *)filterVC {
    if (!_filterVC) {
        _filterVC = [JCMatchFilterWMVC new];
        _filterVC.type = [NSString stringWithFormat:@"%d",self.selectIndex];
    }
    return _filterVC;
}
- (JCMathEnterGaolTipView *)goalTipView {
    if (!_goalTipView) {
        _goalTipView = [JCMathEnterGaolTipView new];
    }
    return _goalTipView;
}
- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [UIView new];
        _lineView.backgroundColor = COLOR_DDDDDD;
    }
    return _lineView;;
}
@end
