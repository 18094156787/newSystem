//
//  JCBasketBallHomeMatchWMVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/4.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBasketBallHomeMatchWMVC.h"
#import "JCMatchViewController.h"
#import "JCMatchFilterWMVC.h"
#import "JCMatchConcernVC.h"
#import "JCMatchTipSettingVC.h"
#import "JCBasketBallSCViewController.h"
#import "JCBasketBallGoingViewController.h"
#import "JCBasketBallConcernViewController.h"
#import "JCBasketBalMatchFilterWMVC.h"
@interface JCBasketBallHomeMatchWMVC ()

@property (nonatomic,strong) JCBasketBallSCViewController *scVC;//未开始

@property (nonatomic,strong) JCBasketBallGoingViewController *beginVC;//进行中

@property (nonatomic,strong) JCBasketBallSCViewController *endVC;//已完成

@property (nonatomic,strong) JCBasketBallConcernViewController *concernVC;//关注

@property (nonatomic,strong) JCBasketBalMatchFilterWMVC *filterVC;//筛选

@property (nonatomic,strong) UIView *lineView;

@property (nonatomic,assign) int index;

@end

@implementation JCBasketBallHomeMatchWMVC

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

//    self.progressWidth = SCREEN_WIDTH/4.0f;
    //    self.pageAnimatable = YES;
//    self.titleFontName = @"PingFangSC-Semibold";
//    self.itemMargin = 20;
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
        return self.beginVC;
    }
    if (index==2) {
        return self.endVC;
        
    }
    return self.concernVC;
    
    
}

- (void)pageController:(WMPageController *)pageController willEnterViewController:(__kindof UIViewController *)viewController withInfo:(NSDictionary *)info {
//    NSString *indexStr = info[@"index"];
//    self.index = [indexStr intValue];
//    NSLog(@"当前%d--%@",self.selectIndex,indexStr);
//    if (self.JCIndexBlock) {
//        self.JCIndexBlock(self.selectIndex);
//    }

}


- (void)pageController:(WMPageController *)pageController didEnterViewController:(__kindof UIViewController *)viewController withInfo:(NSDictionary *)info {
    
    if (self.JCIndexBlock) {
        self.JCIndexBlock(self.selectIndex);
    }
//    NSString *indexStr = info[@"index"];
//    NSLog(@"已经%d--%@",self.selectIndex,indexStr);
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
    }else if (self.selectIndex==2) {
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

        if (self.selectIndex==0) {
            weakSelf.scVC.eventArray = jsonStr;
            weakSelf.scVC.screening = screening;
            weakSelf.scVC.type = type;
            [weakSelf.scVC filterData];
        }
        if (self.selectIndex==1) {
            weakSelf.beginVC.eventArray = jsonStr;
            weakSelf.beginVC.screening = screening;
            weakSelf.beginVC.type = type;
            [weakSelf.beginVC filterData];
        }
        if (self.selectIndex==2) {
            weakSelf.endVC.eventArray = jsonStr;
            weakSelf.endVC.screening = screening;
            weakSelf.endVC.type = type;
            [weakSelf.endVC filterData];
        }

        [weakSelf.navigationController popViewControllerAnimated:YES];
    };

}

- (void)settingItemClick {
    [self.navigationController pushViewController:[JCMatchTipSettingVC new] animated:YES];
}

- (JCBasketBallSCViewController *)scVC {
    if (!_scVC) {
        _scVC = [JCBasketBallSCViewController new];
        _scVC.type = @"0";
    }
    return _scVC;
}

- (JCBasketBallGoingViewController *)beginVC {
    if (!_beginVC) {
        _beginVC = [JCBasketBallGoingViewController new];
        _beginVC.type = @"1";
    }
    return _beginVC;
}

- (JCBasketBallSCViewController *)endVC {
    if (!_endVC) {
        _endVC = [JCBasketBallSCViewController new];
        _endVC.type = @"2";
    }
    return _endVC;
}


- (JCBasketBallConcernViewController *)concernVC {
    if (!_concernVC) {
        _concernVC = [JCBasketBallConcernViewController new];
        _concernVC.type = @"4";
    }
    return _concernVC;
}

- (JCBasketBalMatchFilterWMVC *)filterVC {
    if (!_filterVC) {
        _filterVC = [JCBasketBalMatchFilterWMVC new];
        _filterVC.type = [NSString stringWithFormat:@"%d",self.selectIndex];
    }
    return _filterVC;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [UIView new];
        _lineView.backgroundColor = COLOR_DDDDDD;
    }
    return _lineView;;
}

@end
