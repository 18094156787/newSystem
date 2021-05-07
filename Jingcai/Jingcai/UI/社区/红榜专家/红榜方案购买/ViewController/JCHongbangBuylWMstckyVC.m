//
//  JCHongbangBuylWMstckyVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/5/19.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCHongbangBuylWMstckyVC.h"
#import "JCHongbangDetailTopView.h"
#import "JCHongbangBuyVC.h"
#import "JCWExpertBall.h"
#import "JCWTjInfoDetailBall.h"
#import "JCHongbangPriceInfoView.h"
#import "JCHongbangBuylWMstckyVC.h"
#import "JCHongbangOrderWMstckyVC.h"
#import "JCHongBangOrderDetailVC.h"
static CGFloat const kWMMenuViewHeight = 0;
static CGFloat const kWMMenuViewUserHeight = 60;

@interface JCHongbangBuylWMstckyVC ()

@property (nonatomic, assign) float height;

@property (nonatomic, strong) NSArray *titleArray;

@property (nonatomic, strong) JCHongbangDetailTopView *autherHeadView;

@property (nonatomic, strong) JCHongbangBuyVC *homeVC;

@property (nonatomic, strong) JCHongbangPriceInfoView *priceInfoView;


@end

@implementation JCHongbangBuylWMstckyVC

- (NSArray *)titleArray {
    if (!_titleArray) {
        _titleArray = @[@""];
    }
    return _titleArray;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
     self.navigationBarStyle = JCNavigationBarStyleTransparent;
    [self setNavBackImg];
//    [self initViews];
//    self.bottomView.frame = CGRectMake(0, SCREEN_HEIGHT-55-kBottomTabSafeAreaHeight+self.scrollView.contentOffset.y, SCREEN_WIDTH, 55+kBottomTabSafeAreaHeight);
}


- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
      self.navigationBarStyle = JCNavigationBarStyleDefault;

}

- (instancetype)init {
    if (self = [super init]) {
        self.height = AUTO(170)+kNavigationBarHeight;
        self.titleSizeNormal = 15;
        self.titleSizeSelected = 15;
        self.menuViewStyle = WMMenuViewStyleLine;
//        self.menuItemWidth = AUTO(40);
        self.progressWidth =0;
        self.viewTop = self.height;
        self.menuViewHeight = kWMMenuViewHeight;
        self.maximumHeaderViewHeight = kNavigationBarHeight+AUTO(20);
        self.minimumHeaderViewHeight = 0;
        self.contentView.bounces = NO;
    }
    return self;
}

- (void)viewDidLoad {
    self.titleColorSelected = COLOR_FF4642;//COLOR_FE1F19
    self.titleColorNormal = COLOR_999999;
//    self.view.backgroundColor = [UIColor greenColor]
    [super viewDidLoad];
    self.title = @"方案详情";
    self.view.backgroundColor = COLOR_F4F6F9;

    [self initViews];
    [self loadDataInfo];
//    [self dataInfoWithdataDic:self.dataDic];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshData) name:NotificationUserLogin object:nil];

}

- (void)initViews {
    
    self.autherHeadView = [[JCHongbangDetailTopView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, kWMMenuViewUserHeight)];
    self.autherHeadView.typeLab.hidden = YES;
    self.autherHeadView.backgroundColor = JCWhiteColor;
    WeakSelf;
    self.autherHeadView.JCPushBlock = ^{
        [weakSelf clearPopVC];
    };
    self.autherHeadView.JCOrderDetailBlock = ^{
            JCHongBangOrderDetailVC *vc = [JCHongBangOrderDetailVC new];
            vc.order_id = weakSelf.tjInfoDetailBall.order_id;
            [weakSelf.navigationController pushViewController:vc animated:YES];
        };
    [self.view addSubview:self.autherHeadView];
    
    
    [self.view addSubview:self.priceInfoView];
    self.priceInfoView.frame = CGRectMake(0, SCREEN_HEIGHT-76-kBottomTabSafeAreaHeight, SCREEN_WIDTH, 76+kBottomTabSafeAreaHeight);
    self.priceInfoView.JCSureBtnClickBlock = ^{
        if (![JCWUserBall currentUser]) {
            [weakSelf presentLogin];
            return;
        }
        [weakSelf sureBtnClick];
    };

}

- (void)sureBtnClick {
    [self.homeVC sureBtnClick];
}

- (void)refreshData {
    WeakSelf;
    [JCTuiJianManager getTuiJianDetailWithTuiJianID:self.tjInfoDetailBall.id orderID:@"" type:@"" WithViewController:self is_push:YES success:^{
//        [weakSelf clearPopVC];
        
    }];
}


- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [self addCornerWithView:self.menuView type:UIRectCornerTopLeft|UIRectCornerTopRight size:CGSizeMake(20, 20)];
    
    CGFloat headerViewHeight = self.height;
//    CGFloat headerViewHeight = kWMMenuViewUserHeight;
    CGFloat headerViewX = 0;
    UIScrollView *scrollView = (UIScrollView *)self.view;
    if (scrollView.contentOffset.y < 0) {
        headerViewX = scrollView.contentOffset.y;
        headerViewHeight -= headerViewX;

    }
    self.autherHeadView.frame = CGRectMake(0, headerViewX, CGRectGetWidth(self.view.bounds), self.height);
    [self.view bringSubviewToFront:self.priceInfoView];
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
     CGFloat maxOffsetY = kNavigationBarHeight;
     float percent = offsetY/maxOffsetY;
     
     if (percent>=1) {
         self.autherHeadView.userView.alpha = 0;
     }else{
         self.autherHeadView.userView.alpha = 1-percent;
     }
    self.priceInfoView.frame = CGRectMake(0, SCREEN_HEIGHT-76-kBottomTabSafeAreaHeight+scrollView.contentOffset.y, SCREEN_WIDTH, 76+kBottomTabSafeAreaHeight);
}

#pragma mark - Datasource & Delegate
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController {
    return self.titleArray.count;
}

- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
    self.homeVC = [JCHongbangBuyVC new];
//    self.homeVC.expertID = self.tjInfoId;
    self.homeVC.detailModel = self.detailModel;
     WeakSelf;
    self.homeVC.JCMatchStatusBlock = ^(BOOL end) {
        if (end) {
            //购买是否截止,截止则隐藏,反之显示
            weakSelf.priceInfoView.sureBtn.userInteractionEnabled = NO;
            weakSelf.priceInfoView.sureBtn.backgroundColor = COLOR_9F9F9F;
            [weakSelf.priceInfoView.sureBtn setTitle:@"无法购买" forState:0];
        }

    };
    return self.homeVC;
//    return [UIViewController new];

}

- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    return self.titleArray[index];
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForMenuView:(WMMenuView *)menuView {
    menuView.backgroundColor = JCWhiteColor;
    return CGRectMake(0, _viewTop+1, self.view.frame.size.width, kWMMenuViewHeight);

}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForContentView:(WMScrollView *)contentView {
    CGFloat originY = _viewTop;
//    return CGRectMake(0, originY, self.view.frame.size.width, SCREEN_HEIGHT-NavigationStatusBarHeight-kBottomTabSafeAreaHeight-76-kWMMenuViewUserHeight);
    return CGRectMake(0, originY, self.view.frame.size.width, SCREEN_HEIGHT-kBottomTabSafeAreaHeight-76-self.height+kNavigationBarHeight);
}

//加载数据
- (void)loadDataInfo {
    if (!self.detailModel) {
        return;
    }
//    JCWExpertBall * tjUserBall = (JCWExpertBall *)[JCWJsonTool entityWithJson:dataDic[@"user"] class:[JCWExpertBall class]];
//    self.autherHeadView.expertDetailModel = tjUserBall;
    self.tjInfoDetailBall = self.detailModel.talent_plan;
    self.autherHeadView.tjInfoDetailBall = self.tjInfoDetailBall;
    self.priceInfoView.tjInfoDetailBall = self.tjInfoDetailBall;

    
    
    CGSize size  =  [self returnTextWidth:self.tjInfoDetailBall.title size:CGSizeMake(SCREEN_WIDTH-AUTO(30), 100) font:[UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(16)]];
    self.height = AUTO(150)+kNavigationBarHeight+size.height;
    self.autherHeadView.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), self.height);
    self.viewTop = self.height;
    self.maximumHeaderViewHeight = self.height;
    self.minimumHeaderViewHeight = self.height-kNavigationBarHeight;
    

}




- (void)addCornerWithView:(UIView *)aView type:(UIRectCorner)aCorners size:(CGSize)aSize
{
    // 根据矩形画带圆角的曲线
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:aView.bounds byRoundingCorners:aCorners cornerRadii:aSize];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = aView.bounds;
    maskLayer.path = maskPath.CGPath;
    aView.layer.mask = maskLayer;
}

#pragma mark --

- (void)clearPopVC {
    NSMutableArray*tempMarr = [NSMutableArray arrayWithArray : self.navigationController.viewControllers];
//    [tempMarr removeObject:weakSelf];
    for (UIViewController *vc in self.navigationController.viewControllers) {
        if ([vc isKindOfClass:[JCHongbangBuylWMstckyVC class]]||[vc isKindOfClass:[JCHongbangOrderWMstckyVC class]]) {
            [tempMarr removeObject:vc];
        }
    }
    [self.navigationController setViewControllers:tempMarr animated:YES];
}

- (void)back {
    if (self.pushVC) {
        [self.navigationController popToViewController:self.pushVC animated:YES];
    }
    [self.navigationController popViewControllerAnimated:YES];
}

- (CGSize)returnTextWidth:(NSString *)text size:(CGSize)size font:(UIFont *)font{
    CGSize textSize = [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : font} context:nil].size;
    return textSize;
}


- (JCHongbangPriceInfoView *)priceInfoView{
    if (!_priceInfoView) {
        _priceInfoView = [JCHongbangPriceInfoView new];
//        _priceInfoView.hidden = YES;
    }
    return _priceInfoView;
}
@end
