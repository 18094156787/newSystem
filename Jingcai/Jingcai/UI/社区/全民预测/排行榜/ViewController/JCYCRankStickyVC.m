//
//  JCYCRankStickyVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/4/13.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCYCRankStickyVC.h"
#import "JCYCRankTopView.h"
#import "JCYCRankViewController.h"
#import "JCYCLastWeekRankVC.h"
#import "JCYCUserInfoModel.h"
#import "JCYuceCommomModel.h"
#import "JCYCTenRedRankVC.h"
static CGFloat const kWMMenuViewHeight = 54;
@interface JCYCRankStickyVC ()

@property (nonatomic, strong) NSArray *titleArray;

@property (nonatomic, strong) JCYCRankTopView *topHeadView;

@property (nonatomic, strong) UIView *lineView;

@end

@implementation JCYCRankStickyVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationBarStyle = JCNavigationBarStyleTransparent;
    UIImageView * navBarHairlineImageView = [self findHairlineImageViewUnder:self.navigationController.navigationBar];
    navBarHairlineImageView.hidden = YES;
    [self setNavBackImg];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationBarStyle = JCNavigationBarStyleDefault;
}

- (NSArray *)titleArray {
    if (!_titleArray) {
        _titleArray = @[@"上周入围",@"本周入围",@"10连红俱乐部"];
    }
    return _titleArray;
}


- (instancetype)init {
    if (self = [super init]) {
        self.menuViewStyle = WMMenuViewStyleLine;
        self.progressViewBottomSpace = 0;
        self.progressColor= JCBaseColor;
        self.titleColorSelected = COLOR_27272B;
        self.titleColorNormal = COLOR_27272B;
        self.titleSizeNormal = 14;
        self.titleSizeSelected = 14;
        self.progressHeight = 4;
//        self.progressWidth = 28;
        self.viewTop = kWMRankHeaderViewHeight;
//        self.menuViewHeight = 0;
//        self.itemsMargins = @[@(1),@(1),@(1),@(1)];
        self.maximumHeaderViewHeight = 30+NavigationStatusBarHeight-kBottomTabSafeAreaHeight;
        self.minimumHeaderViewHeight = 0;
//        self.menuItemWidth = AUTO(100);
        self.automaticallyCalculatesItemWidths = YES;
//        self.titleFontName = @"PingFangSC-Medium";
        self.contentView.bounces = NO;
    }
    return self;
}

- (void)viewDidLoad {

//    self.view.backgroundColor = [UIColor greenColor]
        [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = COLOR_F0F0F0;
    self.view.backgroundColor = COLOR_48041F;
//    self.contentView.backgroundColor= COLOR_81060F;
    self.title= @"排行榜";
    self.topHeadView.frame = CGRectMake(0, 0, SCREEN_WIDTH, kWMRankHeaderViewHeight);
    [self.view addSubview:self.topHeadView];
    [self initViews];
    [self getUserInfo];
    

}
- (void)initViews {


}

- (void)getUserInfo {
    [self.view showLoading];
    JCJingCaiService_New *service = [JCJingCaiService_New service];
    [service getJingcaiMyYuceInfoWithSuccess:^(id  _Nullable object) {
        [self.view endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
            JCYuceCommomModel *model = (JCYuceCommomModel *)[JCWJsonTool entityWithJson:object[@"data"] class:[JCYuceCommomModel class]];
            self.topHeadView.model = model;
        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        [self.view endLoading];
    }];

}




- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];

    CGFloat headerViewHeight = kWMRankHeaderViewHeight;
//    CGFloat headerViewHeight = kWMRankHeaderViewHeight;
    CGFloat headerViewX = 0;
    UIScrollView *scrollView = (UIScrollView *)self.view;
    if (scrollView.contentOffset.y < 0) {
        headerViewX = scrollView.contentOffset.y;
        headerViewHeight -= headerViewX;

    }
    self.topHeadView.frame = CGRectMake(0, headerViewX, CGRectGetWidth(self.view.bounds), kWMRankHeaderViewHeight);
}

- (void)btnClicked:(id)sender {
    NSLog(@"touch up inside");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - ScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [super scrollViewDidScroll:scrollView];
    if (scrollView.contentOffset.y < 0) {
        [self.view setNeedsLayout];
    }
    CGFloat offsetY = self.contentView.contentOffset.y;
    CGFloat maxOffsetY = 40;
    float percent = offsetY/maxOffsetY;
    
    if (percent>=1) {
        self.topHeadView.contentBgView.alpha = 0;

    }else{
        self.topHeadView.contentBgView.alpha = 1-percent;

    }


    NSLog(@"%.2f",percent);
}

#pragma mark - Datasource & Delegate
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController {
    return self.titleArray.count;
}

- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
    if (index==0) {
        JCYCLastWeekRankVC *vc = [JCYCLastWeekRankVC new];
        vc.type = index+1;
        return vc;
        
    }
    if (index==1) {
        JCYCRankViewController *vc = [JCYCRankViewController new];
        vc.type = index+1;
        return vc;
    }
    if (index==2) {
        JCYCTenRedRankVC *vc = [JCYCTenRedRankVC new];
        vc.type = index+1;
        return vc;
    }
    return [UIViewController new];

    
    

}

- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    return self.titleArray[index];
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForMenuView:(WMMenuView *)menuView {
    
        menuView.backgroundColor = JCWhiteColor;
        self.lineView.frame = CGRectMake(0, 53, SCREEN_WIDTH, 1);
        [menuView addSubview:self.lineView];
        menuView.backgroundColor = JCWhiteColor;
        [menuView hg_setCornerOnTopWithRadius:AUTO(15)];

    return CGRectMake(12, _viewTop, self.view.frame.size.width-24, kWMMenuViewHeight);

}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForContentView:(WMScrollView *)contentView {
    CGFloat originY = _viewTop + kWMMenuViewHeight;
    return CGRectMake(0, originY, SCREEN_WIDTH, SCREEN_HEIGHT-kBottomTabSafeAreaHeight-50-kWMMenuViewHeight);
}


- (UIImageView *)findHairlineImageViewUnder:(UIView *)view {
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0) {
        return (UIImageView *)view;
    }
    for (UIView *subview in view.subviews) {
        UIImageView *imageView = [self findHairlineImageViewUnder:subview];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
}



- (JCYCRankTopView *)topHeadView {
    if (!_topHeadView) {
        _topHeadView = [JCYCRankTopView new];
    }
    return _topHeadView;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [UIView new];
        _lineView.backgroundColor = COLOR_F2F2F2;
    }
    return _lineView;;
}

@end
