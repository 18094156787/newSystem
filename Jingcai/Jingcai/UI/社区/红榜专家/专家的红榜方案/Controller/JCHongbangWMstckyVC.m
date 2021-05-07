//
//  JCHongbangDetailWMstckyVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/5/19.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCHongbangWMstckyVC.h"
#import "JCFootBall_HB_AuthorHeadView.h"
#import "JCHongbangListVC.h"
#import "JCHongbangDataInfoVC.h"
#import "JCShareView.h"
#import "JCCommunityEventModel.h"
static CGFloat const kWMMenuViewHeight = 44;
@interface JCHongbangWMstckyVC ()

@property (nonatomic, assign) float height;

@property (nonatomic,strong) UIView *lineView;

@property (nonatomic, strong) NSArray *titleArray;

@property (nonatomic, strong) JCFootBall_HB_AuthorHeadView *autherHeadView;

@property (nonatomic, strong) JCWExpertBall *expertDetailModel;

@property (strong, nonatomic) NSArray * zjArr;//方案战绩

@property (strong, nonatomic) NSArray * latestArr;//最新方案

@property (strong, nonatomic) JCHongbangDataInfoVC *dataInfoVC;

@end

@implementation JCHongbangWMstckyVC

- (NSArray *)titleArray {
    if (!_titleArray) {
        _titleArray = @[@"战绩",@"方案"];
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
      self.navigationBarStyle = JCNavigationBarStyleDefault;

}

- (instancetype)init {
    if (self = [super init]) {
        self.height = kWHongbangHeaderViewHeight;
        self.titleSizeNormal = 14;
        self.titleSizeSelected = 14;
        self.titleColorNormal = COLOR_2F2F2F;
        self.titleColorSelected = COLOR_2F2F2F;
        self.menuViewStyle = WMMenuViewStyleLine;
        self.progressViewBottomSpace = 1;
        self.progressWidth  = 28;
        self.progressColor = JCBaseColor;
//        self.itemsMargins = @[@()]
//        self.menuViewContentMargin = SCREEN_WIDTH/4.0f;
//        self.menuItemWidth = AUTO(80);
//        self.itemsWidths = @[@(AUTO(40)),@(AUTO(80))];
        
        
//        self.progressWidth =0;
        self.viewTop = kWHongbangHeaderViewHeight;
        self.menuViewHeight = kWMMenuViewHeight;
//        self.progressColor = [UIColor redColor];
        self.maximumHeaderViewHeight = kWHongbangHeaderViewHeight;
        self.minimumHeaderViewHeight = kNavigationBarHeight;
//        self.titleFontName = @"PingFangSC-Medium";
        self.automaticallyCalculatesItemWidths = YES;
//        [self setNavBackImg];
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
//    self.titleColorSelected = COLOR_FF4642;//COLOR_FE1F19
//    self.titleColorNormal = COLOR_999999;
//    self.view.backgroundColor = [UIColor greenColor]
        [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = COLOR_A32020;
    self.autherHeadView = [[JCFootBall_HB_AuthorHeadView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, kWHongbangHeaderViewHeight)];
    self.autherHeadView.isMine = self.isMine;
    WeakSelf;
    self.autherHeadView.isHongbang = YES;
    self.autherHeadView.ShowAllBlock = ^(float height) {

    
         
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
    self.title = self.isMine?@"个人中心":@"达人详情";

}

- (void)refreshData {

    [self.view showLoading];
    //获取推荐专家信息
    JCHomeService_New * service = [JCHomeService_New service];
    [service getHongbang_TuijianExpertDetailWithExpert_id:NonNil(self.autherID) type:@"1" page:1 Success:^(id  _Nullable object) {
        [self.view endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
            self.expertDetailModel = (JCWExpertBall *)[JCWJsonTool entityWithJson:object[@"data"][@"base_info"] class:[JCWExpertBall class]];
             self.autherHeadView.expertDetailModel = self.expertDetailModel;

            self.dataInfoVC.event_Data = object[@"data"][@"match_stat"];
            self.dataInfoVC.exprtModel = self.expertDetailModel;

        }
    } failure:^(NSError * _Nonnull error) {
        [self.view endLoading];
    }];

}

- (void)setPlanDetailModel:(JCWTjInfoBall *)planDetailModel {
    _planDetailModel =planDetailModel;
    [self reloadData];
}


- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [self addCornerWithView:self.menuView type:UIRectCornerTopLeft|UIRectCornerTopRight size:CGSizeMake(5, 5)];
//    
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
//    JCDakaBuyPlanVC *vc = [JCDakaBuyPlanVC new];
    if (index==1) {
        JCHongbangListVC *vc = [JCHongbangListVC new];
        vc.autherID = self.autherID;
        vc.isMine = self.isMine;
        return vc;
    }
    
    
    return self.dataInfoVC;

}

- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    return self.titleArray[index];
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForMenuView:(WMMenuView *)menuView {
    menuView.backgroundColor = JCWhiteColor;
    self.lineView.frame = CGRectMake(0, kWMMenuViewHeight-1, SCREEN_WIDTH, 1);
    [menuView addSubview:self.lineView];
    return CGRectMake(0, _viewTop, self.view.frame.size.width, kWMMenuViewHeight);

}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForContentView:(WMScrollView *)contentView {
    CGFloat originY = _viewTop + kWMMenuViewHeight;
    return CGRectMake(0, originY-1, self.view.frame.size.width, SCREEN_HEIGHT-NavigationStatusBarHeight-kWMMenuViewHeight);
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
- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [UIView new];
        _lineView.backgroundColor = COLOR_DDDDDD;
    }
    return _lineView;;
}

- (JCHongbangDataInfoVC *)dataInfoVC {
    if (!_dataInfoVC) {
        _dataInfoVC = [JCHongbangDataInfoVC new];
    }
    return _dataInfoVC;
}

@end
