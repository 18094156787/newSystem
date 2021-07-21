//
//  JCJingCaiAIWMStickVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/24.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCJingCaiAIWMStickVC.h"
#import "JCJingCaiAIHomeHeadView.h"
#import "JCJingCaiAIHomeVC.h"
#import "JCJingCaiAIYLModel.h"
#import "JCJingCaiAINoticeModel.h"
static CGFloat const kWMMenuViewHeight = 44;
@interface JCJingCaiAIWMStickVC ()

@property (nonatomic, assign) float height;

@property (nonatomic, strong) NSArray *titleArray;

@property (nonatomic, strong) JCJingCaiAIHomeHeadView *topHeadView;

@property (nonatomic, strong) JCJingCaiAIHomeVC *nearVC;

@property (nonatomic, strong) JCJingCaiAIHomeVC *historyVC;

@property (nonatomic, strong) NSArray *rqArray;

@property (nonatomic, strong) NSArray *jqsArray;

@property (nonatomic, strong) NSArray *noticeArray;

@property (nonatomic,strong) UIView *lineView;

@property (nonatomic, strong) UIButton *rqBtn;//让球

@property (nonatomic, strong) UIButton *jqsBtn;//进球数

@property (nonatomic, strong) UIButton *lastBtn;//进球数

@end

@implementation JCJingCaiAIWMStickVC

- (NSArray *)titleArray {
    if (!_titleArray) {
        _titleArray = @[@"在售方案",@"历史方案"];
    }
    return _titleArray;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
     self.navigationBarStyle = JCNavigationBarStyleDefault;
    [self setNavBackImg];
    [self hideNavShadow];
}


//- (void)viewWillDisappear:(BOOL)animated {
//    [super viewWillDisappear:animated];
//      self.navigationBarStyle = JCNavigationBarStyleDefault;
//
//}

- (instancetype)init {
    if (self = [super init]) {
        self.height = AUTO(273);//kWMTopHeadHeight
        self.titleSizeNormal = 14;
        self.titleSizeSelected = 14;
        self.menuViewStyle = WMMenuViewStyleLine;
        self.menuItemWidth = AUTO(100);
        self.menuViewLayoutMode = WMMenuViewLayoutModeLeft;
        self.progressWidth = AUTO(28);
        self.viewTop = self.height;
        self.menuViewHeight = kWMMenuViewHeight;
        self.progressColor = JCBaseColor;
        self.progressViewBottomSpace = 1;
        self.progressHeight=2;
        self.maximumHeaderViewHeight = self.height;
        self.minimumHeaderViewHeight = 0;
        self.titleColorSelected = COLOR_2F2F2F;
        self.titleColorNormal = COLOR_2F2F2F;
        self.contentView.bounces = YES;
        
        self.scrollView.backgroundColor = COLOR_F4F6F9;
        self.view.backgroundColor = COLOR_F4F6F9;
        self.contentView.backgroundColor = COLOR_F4F6F9;
    }
    return self;
}



- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.hidden = YES;
    [self initViews];
//    [self getTopData];
    [self getTopCycleData];

}

- (void)initViews {
    self.topHeadView.frame = CGRectMake(0, 0, SCREEN_WIDTH, self.height);
     [self.view addSubview:self.topHeadView];
    self.contentView.mj_header = [JCFootBallHeader headerWithRefreshingBlock:^{
    //        self.pageNo = 1;
            [self getTopCycleData];
        
        self.rqBtn.selected = NO;
        self.jqsBtn.selected = NO;
        if (self.selectIndex==0) {
            self.nearVC.classfly = @"0";
            [self.nearVC refreshData];
        }
        if (self.selectIndex==1) {
            self.historyVC.classfly = @"0";
            [self.historyVC refreshData];
        }
    }];
}

- (void)getTopData {
    [self.jcWindow showLoading];
    JCDataBaseService_New *service = [JCDataBaseService_New service];
    [service getJingCaiAiTopInfoDataWithsuccess:^(id  _Nullable object) {
        self.view.hidden = NO;
         [self.jcWindow endLoading];
        [self.contentView.mj_header endRefreshing];
        if ([JCWJsonTool isSuccessResponse:object]) {
            NSArray *rqArray = [JCWJsonTool arrayWithJson:object[@"data"][@"rq"] class:[JCJingCaiAIYLModel class]];
            NSArray *jqsArray = [JCWJsonTool arrayWithJson:object[@"data"][@"jqs"] class:[JCJingCaiAIYLModel class]];

            self.rqArray = rqArray;
            self.jqsArray = jqsArray;
            self.topHeadView.rqArray = self.rqArray;
            self.topHeadView.jqsArray = self.jqsArray;
            self.topHeadView.titleArray = self.noticeArray;

            [self configTopHeight];
            

//            [self canPostEanble];
        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        self.view.hidden = NO;
        [self.contentView.mj_header endRefreshing];
        [self.jcWindow endLoading];
    }];


}

- (void)getTopCycleData {
    JCDataBaseService_New *service = [JCDataBaseService_New service];
    [service getJingCaiAiTopCycleDataWithsuccess:^(id  _Nullable object) {
        if ([JCWJsonTool isSuccessResponse:object]) {
            NSArray *noticeArray = [JCWJsonTool arrayWithJson:object[@"data"] class:[JCJingCaiAINoticeModel class]];
            self.noticeArray = noticeArray;
            [self getTopData];
//            self.topHeadView.titleArray = noticeArray;
//            [self configTopHeight];
//            [self.tableView reloadData];

        }else{
            [self getTopData];
            [JCWToastTool showHint:object[@"msg"]];
        }
    } failure:^(NSError * _Nonnull error) {
        [self getTopData];
    }];

}

- (void)configTopHeight {
//    if (self.rqArray.count==0) {
////        self.jqsBtn.hidden =YES;
////        self.rqBtn.hidden =YES;
//        self.height = AUTO(273)-AUTO(85);
//        if (self.noticeArray.count==0) {
//            self.height = AUTO(273)-AUTO(85)-AUTO(42);
//        }
//
//        self.viewTop = self.height;
//        self.maximumHeaderViewHeight = self.height;
//        self.topHeadView.frame = CGRectMake(0, 0, SCREEN_WIDTH, self.height);
//        return;
////                [self reloadData];
//    }
    self.height = AUTO(415);
    if (self.rqArray.count==0) {
        self.height = self.height-AUTO(90);
    }
    if (self.jqsArray.count==0) {
        self.height = self.height-AUTO(90);
    }
    if (self.rqArray.count==0&&self.jqsArray.count==0) {
        self.height = AUTO(185);
    }
    
    if (self.noticeArray.count==0) {
        self.height = self.height-AUTO(44);
    }
    
    self.viewTop = self.height;
    self.maximumHeaderViewHeight = self.height;
    self.topHeadView.frame = CGRectMake(0, 0, SCREEN_WIDTH, self.height);
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
//
//    CGFloat headerViewHeight = kWMTopHeadHeight;
////    CGFloat headerViewHeight = kWMTopHeadHeight;
//    CGFloat headerViewX = 0;
//    UIScrollView *scrollView = (UIScrollView *)self.view;
//    if (scrollView.contentOffset.y < 0) {
//        headerViewX = scrollView.contentOffset.y;
//        headerViewHeight -= headerViewX;
//
//    }
//    self.topHeadView.frame = CGRectMake(0, headerViewX, CGRectGetWidth(self.view.bounds), kWMTopHeadHeight);
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
 
//    if ([scrollView isKindOfClass:[WMMagicScrollView class]]) {
//        if (scrollView.contentOffset.y>AUTO(50)) {
//            self.autherHeadView.bgView.hidden = YES;
////            self.title = self.expertDetailModel.user_name;
//        }else {
//            self.autherHeadView.bgView.hidden = NO;
////            self.title = @"";
//        }
//    }
//    self.bottomView.frame = CGRectMake(0, SCREEN_HEIGHT-49-kBottomTabSafeAreaHeight+scrollView.contentOffset.y, SCREEN_WIDTH, 49+kBottomTabSafeAreaHeight);
//    NSLog(@"%.0f",scrollView.contentOffset.y);
}

#pragma mark - Datasource & Delegate
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController {
    return self.titleArray.count;
}

- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
    
    if (index==0) {
        self.nearVC.contentView = self.view;
        self.nearVC.type = @"1";
        self.nearVC.fatherView = self.view;
        return self.nearVC;
    }
    self.historyVC.contentView = self.view;
    self.historyVC.type = @"2";
    self.historyVC.fatherView = self.view;
    return self.historyVC;

}

- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    return self.titleArray[index];
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForMenuView:(WMMenuView *)menuView {
    menuView.backgroundColor = JCWhiteColor;
    self.lineView.frame = CGRectMake(0, kWMMenuViewHeight-1, SCREEN_WIDTH, 0.5);
    [menuView addSubview:self.lineView];
    self.jqsBtn.frame = CGRectMake(SCREEN_WIDTH-60, 0, 40, kWMMenuViewHeight);
    [menuView addSubview:self.jqsBtn];
    self.rqBtn.frame = CGRectMake(SCREEN_WIDTH-110, 0, 40, kWMMenuViewHeight);
    [menuView addSubview:self.rqBtn];
    return CGRectMake(0, _viewTop+1, self.view.frame.size.width, kWMMenuViewHeight);

}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForContentView:(WMScrollView *)contentView {
    CGFloat originY = _viewTop+44;
    return CGRectMake(0, originY, self.view.frame.size.width, SCREEN_HEIGHT-44-kTabBarHeight-kNavigationBarHeight-10);
}
- (void)pageController:(WMPageController *)pageController willEnterViewController:(__kindof UIViewController *)viewController withInfo:(NSDictionary *)info {
    self.rqBtn.selected = NO;
    self.jqsBtn.selected = NO;
    if (self.selectIndex==0) {
        self.nearVC.classfly = @"";
        [self.nearVC refreshData];
    }
    if (self.selectIndex==1) {
        self.historyVC.classfly = @"";
        [self.historyVC refreshData];
    }
    
}


#pragma mark --

- (void)back {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)typeBtnClick:(UIButton *)sender {
    sender.selected = !sender.selected;
    if (self.lastBtn==sender) {
        
    }else{
        self.lastBtn.selected = !sender.selected;
    }
    
    self.lastBtn= sender;
    
    NSString *classfly = @"0";
    if (self.rqBtn.selected) {
        classfly = @"2";
    }
    if (self.jqsBtn.selected) {
        classfly = @"3";
    }
    if (self.selectIndex==0) {
        self.nearVC.classfly = classfly;
        [self.nearVC refreshData];
    }
    if (self.selectIndex==1) {
        self.historyVC.classfly = classfly;
        [self.historyVC refreshData];
    }
}

- (JCJingCaiAIHomeHeadView *)topHeadView {
    if (!_topHeadView) {
        _topHeadView = [JCJingCaiAIHomeHeadView new];
    }
    return _topHeadView;
}
- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [UIView new];
        _lineView.backgroundColor = COLOR_DDDDDD;
    }
    return _lineView;;
}
- (UIButton *)rqBtn {
    if (!_rqBtn) {
        _rqBtn = [UIButton initWithText:@"让球" FontSize:AUTO(12) Weight:1 BackGroundColor:JCClearColor TextColors:COLOR_2F2F2F];
        [_rqBtn addTarget:self action:@selector(typeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_rqBtn setTitleColor:JCBaseColor forState:UIControlStateSelected];
    }
    return _rqBtn;
}

- (UIButton *)jqsBtn {
    if (!_jqsBtn) {
        _jqsBtn = [UIButton initWithText:@"进球数" FontSize:AUTO(12) Weight:1 BackGroundColor:JCClearColor TextColors:COLOR_2F2F2F];
        [_jqsBtn setTitleColor:JCBaseColor forState:UIControlStateSelected];
        [_jqsBtn addTarget:self action:@selector(typeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _jqsBtn;
}
- (JCJingCaiAIHomeVC *)nearVC {
    if (!_nearVC) {
        _nearVC = [JCJingCaiAIHomeVC new];
    }
    return _nearVC;
}

- (JCJingCaiAIHomeVC *)historyVC {
    if (!_historyVC) {
        _historyVC = [JCJingCaiAIHomeVC new];
    }
    return _historyVC;
}

@end
