//
//  JCFootBallAuthorDetailWMViewController.m
//  Jingcai
//
//  Created by 陈继伟 on 2019/8/8.
//  Copyright © 2019年 blockstar. All rights reserved.
//

#import "JCFootBallAuthorDetailWMViewController.h"
#import "WMPanGestureRecognizer.h"
#import "JCFootBallAuthorNewPlaneDetailVC.h"
#import "JCFootBall_GZH_AuthorHeadView.h"
#import "JCFootBallAuthorHistoryPlaneDetailVC.h"
#import "WMMagicScrollView.h"
#import "JCDakaFreePlanListVC.h"
#import "JCDakaGanHuoListVC.h"
static CGFloat const kWMMenuViewHeight = 44.0;
@interface JCFootBallAuthorDetailWMViewController ()

@property (nonatomic,strong) UIView *lineView;

@property (nonatomic, strong) NSArray *titleArray;

@property (nonatomic, strong) JCFootBall_GZH_AuthorHeadView *autherHeadView;

@property (nonatomic, strong) JCFootBallAuthorNewPlaneDetailVC *newPlanVC;

@property (nonatomic, strong) NSString *codeUrl;

@property (nonatomic, strong) JCWExpertBall *expertDetailModel;

@property (nonatomic, assign) float height;

@end

@implementation JCFootBallAuthorDetailWMViewController

- (NSArray *)titleArray {
    if (!_titleArray) {
        _titleArray = @[@"最新", @"历史",@"免费",@"干货"];
    }
    return _titleArray;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
     self.navigationBarStyle = JCNavigationBarStyleTransparent;
    
    [self initViews];
    [self setNavBackImgWhiteColor];
}


- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
      self.navigationBarStyle = JCNavigationBarStyleTransparent;

}

- (instancetype)init {
    if (self = [super init]) {
        self.height = kWHongbangHeaderViewHeight;
        self.titleSizeNormal = 16;
        self.titleSizeSelected = 16;
        self.titleColorSelected = COLOR_2F2F2F;//COLOR_FE1F19
        self.titleColorNormal = [COLOR_2F2F2F colorWithAlphaComponent:0.6];
        self.menuViewStyle = WMMenuViewStyleLine;
        self.progressWidth = 32;
        self.progressColor = JCBaseColor;
        self.progressViewBottomSpace = 1;
        self.viewTop = kWHongbangHeaderViewHeight;
        self.menuViewHeight = kWMMenuViewHeight;
//        self.progressColor = [UIColor redColor];
        self.menuItemWidth = SCREEN_WIDTH/4.0f;
        self.maximumHeaderViewHeight = kWHongbangHeaderViewHeight;
        self.minimumHeaderViewHeight = kNavigationBarHeight;

        self.contentView.bounces = NO;
    }
    return self;
}

- (void)setAutherID:(NSString *)autherID {
    _autherID = autherID;
    [self reloadData];
    [self refreshData];

}

- (void)viewDidLoad {

//    self.view.backgroundColor = [UIColor greenColor]
        [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = JCNavColor;
    self.autherHeadView = [[JCFootBall_GZH_AuthorHeadView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, kWHongbangHeaderViewHeight)];
    WeakSelf;
    self.autherHeadView.ShowAllBlock = ^(float height) {
        NSLog(@"专家信息高度:%.0f",height);
    
         
        if (height==0) {
            weakSelf.height =kWHongbangHeaderViewHeight;
             weakSelf.autherHeadView.frame = CGRectMake(0, 0, SCREEN_WIDTH, weakSelf.height);
        }else{
            weakSelf.height = AUTO(90)+kNavigationBarHeight+height;
            weakSelf.autherHeadView.frame = CGRectMake(0, 0, SCREEN_WIDTH, weakSelf.height);
        }
        weakSelf.viewTop = weakSelf.height;
        weakSelf.maximumHeaderViewHeight = weakSelf.height;
        [weakSelf.autherHeadView.headImgView sd_setImageWithURL:[NSURL URLWithString:weakSelf.expertDetailModel.user_img] placeholderImage:JCIMAGE(@"userImg_default")];
        weakSelf.scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT);
//        [weakSelf forceLayoutSubviews];

    };
    [self.view addSubview:self.autherHeadView];

}

- (void)initViews {
    self.title = @"专家详情";

}

- (void)refreshData {
    
    JCHomeService_New *service = [JCHomeService_New new];
    [service getGZHT_TuijianExpertDetailWithExpert_id:self.autherID type:@"1" page:1 Success:^(id  _Nullable object) {
        if ([JCWJsonTool isSuccessResponse:object]) {
            self.expertDetailModel = (JCWExpertBall *)[JCWJsonTool entityWithJson:object[@"data"][@"base_info"] class:[JCWExpertBall class]];
            self.autherHeadView.expertDetailModel = self.expertDetailModel;
        }else {
            [JCWToastTool showHint:object[@"msg"]];
        }
    } failure:^(NSError * _Nonnull error) {
        
    }];


}


- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [self addCornerWithView:self.menuView type:UIRectCornerTopLeft|UIRectCornerTopRight size:CGSizeMake(20, 20)];
    
    CGFloat headerViewHeight = self.height;
//    CGFloat headerViewHeight = kWHongbangHeaderViewHeight;
    CGFloat headerViewX = 0;
    UIScrollView *scrollView = (UIScrollView *)self.view;
    if (scrollView.contentOffset.y < 0) {
        headerViewX = scrollView.contentOffset.y;
        headerViewHeight -= headerViewX;

    }
    self.autherHeadView.frame = CGRectMake(0, headerViewX, CGRectGetWidth(self.view.bounds), self.height);
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
 
    if ([scrollView isKindOfClass:[WMMagicScrollView class]]) {
        if (scrollView.contentOffset.y>AUTO(50)) {
            self.autherHeadView.bgView.hidden = YES;
//            self.title = self.expertDetailModel.user_name;
        }else {
            self.autherHeadView.bgView.hidden = NO;
//            self.title = @"";
        }
    }

    NSLog(@"%.0f",scrollView.contentOffset.y);
}

#pragma mark - Datasource & Delegate
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController {
    return self.titleArray.count;
}

- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
    if (index==0) {
//        JCFootBallAuthorNewPlaneDetailVC *vc = [[JCFootBallAuthorNewPlaneDetailVC alloc] init];
        self.newPlanVC.expertID = self.autherID;
        self.newPlanVC.fatherView = self.view;
        self.newPlanVC.type = @"1";
        return self.newPlanVC;
    }
    if (index==1) {
        JCFootBallAuthorHistoryPlaneDetailVC *vc = [JCFootBallAuthorHistoryPlaneDetailVC new];
        vc.expertID = self.autherID;
        vc.fatherView = self.view;
        vc.type = @"2";
        return vc;
    }
    if (index==2) {
        JCDakaFreePlanListVC *vc = [JCDakaFreePlanListVC new];
        vc.expertID = self.autherID;
        vc.fatherView = self.view;
        vc.type = @"3";
        return vc;
        
    }

    JCDakaGanHuoListVC *vc = [JCDakaGanHuoListVC new];
    vc.expertID = self.autherID;
    vc.fatherView = self.view;
    vc.type = @"4";
    return vc;

}

- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    return self.titleArray[index];
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForMenuView:(WMMenuView *)menuView {

    self.lineView.frame = CGRectMake(0, kWMMenuViewHeight-1, SCREEN_WIDTH, 1);
    [menuView addSubview:self.lineView];
    return CGRectMake(0, _viewTop, self.view.frame.size.width, kWMMenuViewHeight);

}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForContentView:(WMScrollView *)contentView {
    CGFloat originY = _viewTop + kWMMenuViewHeight;
    return CGRectMake(0, originY, self.view.frame.size.width, self.view.frame.size.height-NavigationStatusBarHeight-kWMMenuViewHeight);
}

- (void)pageController:(WMPageController *)pageController willEnterViewController:(__kindof UIViewController *)viewController withInfo:(NSDictionary *)info {

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

- (void)back {
    [self.navigationController popViewControllerAnimated:YES];
}

- (JCFootBallAuthorNewPlaneDetailVC *)newPlanVC {
    if (!_newPlanVC) {
        _newPlanVC = [JCFootBallAuthorNewPlaneDetailVC new];
    }
    return _newPlanVC;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [UIView new];
        _lineView.backgroundColor = COLOR_DDDDDD;
    }
    return _lineView;;
}

@end
