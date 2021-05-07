//
//  JCYCExpertWMStickyVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/4/16.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCYCExpertWMStickyVC.h"
#import "JCYCExpertTopView.h"
#import "JCYCExpertYcViewController.h"
#import "JCYCUserInfoModel.h"
#import "JCYCTopUserInfoModel.h"
static CGFloat const kWMMenuViewHeight = 0;
@interface JCYCExpertWMStickyVC ()
@property (nonatomic, strong) NSArray *titleArray;

@property (nonatomic, strong) JCYCExpertTopView *topHeadView;

@end

@implementation JCYCExpertWMStickyVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationBarStyle = JCNavigationBarStyleTransparent;
    [self hideNavShadow];
    [self setNavBackImg];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationBarStyle = JCNavigationBarStyleDefault;
}

- (NSArray *)titleArray {
    if (!_titleArray) {
        _titleArray = @[@""];
    }
    return _titleArray;
}


- (instancetype)init {
    if (self = [super init]) {
        self.menuViewStyle = WMMenuViewStyleLine;
        self.progressViewBottomSpace = 5;
        self.progressColor= JCBaseColor;
        self.titleColorSelected = JCBaseColor;
        self.titleColorNormal = JCWhiteColor;
        self.titleSizeNormal = 14;
        self.titleSizeSelected = 14;
        self.progressHeight = 4;
        self.progressWidth = 28;
        self.viewTop = kWExpertHeaderViewHeight;
        self.menuViewHeight = 0;
        self.maximumHeaderViewHeight = 30+NavigationStatusBarHeight-kBottomTabSafeAreaHeight;
        self.minimumHeaderViewHeight = 0;
        self.contentView.bounces = NO;
    }
    return self;
}

- (void)viewDidLoad {

//    self.view.backgroundColor = [UIColor greenColor]
        [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = COLOR_F0F0F0;
    [self initViews];
    [self getUserInfo];
}
- (void)initViews {
    self.topHeadView.frame = CGRectMake(0, 0, SCREEN_WIDTH, kWExpertHeaderViewHeight);
    self.topHeadView.expertID = self.expertID;
    [self.view addSubview:self.topHeadView];
}



- (void)getUserInfo {
    JCJingCaiService_New *service = [JCJingCaiService_New new];
    [service getUserYuCeListWithUserID:self.expertID page:1 success:^(id  _Nullable object) {
        [self.view endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
            JCYCTopUserInfoModel *model = (JCYCTopUserInfoModel *)[JCWJsonTool entityWithJson:object[@"data"] class:[JCYCTopUserInfoModel class]];
            self.topHeadView.userModel = model;
            self.title = [NSString stringWithFormat:@"%@的预测",model.user_info.user_name];
        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        [self.view endLoading];
    }];

}


- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];

    CGFloat headerViewHeight = kWExpertHeaderViewHeight;
//    CGFloat headerViewHeight = kWExpertHeaderViewHeight;
    CGFloat headerViewX = 0;
    UIScrollView *scrollView = (UIScrollView *)self.view;
    if (scrollView.contentOffset.y < 0) {
        headerViewX = scrollView.contentOffset.y;
        headerViewHeight -= headerViewX;

    }
    self.topHeadView.frame = CGRectMake(0, headerViewX, CGRectGetWidth(self.view.bounds), kWExpertHeaderViewHeight);
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
    CGFloat maxOffsetY = 70;
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
    JCYCExpertYcViewController *vc = [JCYCExpertYcViewController new];
    vc.expertID = self.expertID;
    vc.type= self.type;
    return vc;

}

- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    return self.titleArray[index];
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForMenuView:(WMMenuView *)menuView {
    menuView.backgroundColor = JCWhiteColor;
//    [menuView hg_setCornerOnTopWithRadius:AUTO(15)];
    return CGRectMake(0, _viewTop, self.view.frame.size.width, 0);

}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForContentView:(WMScrollView *)contentView {
    CGFloat originY = _viewTop + kWMMenuViewHeight;
    return CGRectMake(12, originY, SCREEN_WIDTH-24, SCREEN_HEIGHT-kBottomTabSafeAreaHeight-50-kWMMenuViewHeight-kNavigationBarHeight);
}





- (JCYCExpertTopView *)topHeadView {
    if (!_topHeadView) {
        _topHeadView = [JCYCExpertTopView new];
    }
    return _topHeadView;
}

@end
