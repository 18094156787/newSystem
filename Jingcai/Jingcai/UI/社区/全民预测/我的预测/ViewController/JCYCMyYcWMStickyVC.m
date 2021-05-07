//
//  JCYCMyYcWMStickyVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/4/13.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCYCMyYcWMStickyVC.h"
#import "JCYCMyYcTopView.h"
#import "JCYCMyYcViewController.h"
#import "JCYCHomeViewController.h"
#import "JCYCHongBaoWMVC.h"
#import "JCYCUserInfoModel.h"
#import "JCYuceCommomModel.h"
static CGFloat const kWMMenuViewHeight = 0;
@interface JCYCMyYcWMStickyVC ()
@property (nonatomic, strong) NSArray *titleArray;

@property (nonatomic, strong) JCYCMyYcTopView *topHeadView;
@end

@implementation JCYCMyYcWMStickyVC

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
        self.viewTop = kWMMyHeaderViewHeight;
        self.menuViewHeight = 0;
        self.maximumHeaderViewHeight = 90+NavigationStatusBarHeight;
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
    self.title= @"我的预测";
    self.topHeadView.frame = CGRectMake(0, 0, SCREEN_WIDTH, kWMMyHeaderViewHeight);
    [self.view addSubview:self.topHeadView];
    [self initViews];
    [self getUserInfo];

}

- (void)getUserInfo {
    [self.view showLoading];
    JCJingCaiService_New *service = [JCJingCaiService_New service];
    [service getJingcaiMyYuceInfoWithSuccess:^(id  _Nullable object) {
        [self.view endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
            JCYuceCommomModel *model = (JCYuceCommomModel *)[JCWJsonTool entityWithJson:object[@"data"] class:[JCYuceCommomModel class]];
            self.topHeadView.commom_Model = model;
        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        [self.view endLoading];
    }];

}


- (void)initViews {
     UIBarButtonItem *redPacketItem = [[UIBarButtonItem alloc] initWithImage:JCIMAGE(@"jc_hongbao_top") style:0 target:self action:@selector(redPacketItemClick)];
    redPacketItem.tintColor = JCWhiteColor;
    self.navigationItem.rightBarButtonItem = redPacketItem;
}




- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];

    CGFloat headerViewHeight = kWMMyHeaderViewHeight;
//    CGFloat headerViewHeight = kWMMyHeaderViewHeight;
    CGFloat headerViewX = 0;
    UIScrollView *scrollView = (UIScrollView *)self.view;
    if (scrollView.contentOffset.y < 0) {
        headerViewX = scrollView.contentOffset.y;
        headerViewHeight -= headerViewX;

    }
    self.topHeadView.frame = CGRectMake(0, headerViewX, CGRectGetWidth(self.view.bounds), kWMMyHeaderViewHeight);
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
    JCYCMyYcViewController *vc = [JCYCMyYcViewController new];
    vc.fatherView = self.view;
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
    return CGRectMake(12, originY, SCREEN_WIDTH-24, SCREEN_HEIGHT-kNavigationBarHeight-50);
}

- (void)redPacketItemClick {
    [self.navigationController pushViewController:[JCYCHongBaoWMVC new] animated:YES];
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



- (JCYCMyYcTopView *)topHeadView {
    if (!_topHeadView) {
        _topHeadView = [JCYCMyYcTopView new];
    }
    return _topHeadView;
}

@end
