//
//  JCTeamDetailWMStickVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/13.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCTeamDetailWMStickVC.h"
#import "JCTeamMatchWMStickHeadView.h"
#import "JCDataBaseEventTabModel.h"
#import "JCTeamDetailBaseInfoVC.h"
#import "JCTeamDetailScoreRankVC.h"
#import "JCTeamDetailTeamListVC.h"
#import "JCTeamDetailTeamZRVC.h"
#import "JCTeamDetailMatchListVC.h"
static CGFloat const kWMMenuViewHeight = 44;
@interface JCTeamDetailWMStickVC ()

@property (nonatomic, strong) NSArray *titleArray;

@property (nonatomic, strong) JCTeamMatchWMStickHeadView *topHeadView;

@property (nonatomic, strong) JCDataBaseEventBaseModel *eventInfoModel;

@property (nonatomic,strong) UIView *lineView;

@property (nonatomic, strong) NSArray *tabArray;

@end

@implementation JCTeamDetailWMStickVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationBarStyle = JCNavigationBarStyleTransparent;
    [self hideNavShadow];
    [self setNavBackImg];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"match_top_nav"] forBarMetrics:UIBarMetricsDefault];
    if (@available(iOS 15.0, *)) {
        [self configNavBarImage:@"match_top_nav"];
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationBarStyle = JCNavigationBarStyleDefault;
    if (@available(iOS 15.0, *)) {
        [self configNavBarImageToNormal];
    }
}


- (instancetype)init {
    if (self = [super init]) {
        self.menuViewStyle = WMMenuViewStyleLine;
        self.progressViewBottomSpace = 1;
        self.progressColor= JCBaseColor;
        self.titleColorSelected = COLOR_2F2F2F;
        self.titleColorNormal = COLOR_2F2F2F;
        self.progressWidth = AUTO(28);
        self.titleSizeNormal = 15;
        self.titleSizeSelected = 15;
        self.progressHeight = 2;
//        self.progressWidth = 28;
        self.viewTop = kWMTeamMatchHeaderViewHeight;
//        self.menuViewHeight = 0;
        self.maximumHeaderViewHeight = kWMTeamMatchHeaderViewHeight;
        self.minimumHeaderViewHeight = NavigationStatusBarHeight;
//        self.menuItemWidth = AUTO(100);
//        self.automaticallyCalculatesItemWidths = YES;
//        self.titleFontName = @"PingFangSC-Regular";
        self.contentView.bounces = NO;
    }
    return self;
}

- (void)viewDidLoad {

//    self.view.backgroundColor = [UIColor greenColor]
        [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = COLOR_F0F0F0;
    self.view.backgroundColor = JCWhiteColor;
//    self.contentView.backgroundColor= COLOR_81060F;
    self.topHeadView.frame = CGRectMake(0, 0, SCREEN_WIDTH, kWMTeamMatchHeaderViewHeight);
    [self.view addSubview:self.topHeadView];
    [self initViews];
    [self refreshData];

}

- (void)refreshData {
    [self.view showLoading];

    JCDataBaseService_New *service = [JCDataBaseService_New new];
    [service getDataBaseEventInfoWithCompetition_id:NonNil(self.team_id) type:@"2" success:^(id  _Nullable object) {
        [self.view endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
            self.eventInfoModel = (JCDataBaseEventBaseModel *)[JCWJsonTool entityWithJson:object[@"data"] class:[JCDataBaseEventBaseModel class]];
            self.title = self.eventInfoModel.name;
            self.topHeadView.eventInfoModel = self.eventInfoModel;

//            [self reloadData];

        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        [self.view endLoading];
    }];


}

//- (void)refreshData {
//    [self.view showLoading];
//
//
//    JCDataBaseService_New *service = [JCDataBaseService_New new];
//    [service getDataBaseEventInfoWithCompetition_id:self.competition_id type:@"2" success:^(id  _Nullable object) {
//        [self.view endLoading];
//        if ([JCWJsonTool isSuccessResponse:object]) {
//            self.eventInfoModel = (JCDataBaseEventBaseModel *)[JCWJsonTool entityWithJson:object[@"data"] class:[JCDataBaseEventBaseModel class]];
//
//            self.title = self.eventInfoModel.name;
//            self.topHeadView.eventInfoModel = self.eventInfoModel;
////            self.tabArray = [JCWJsonTool arrayWithJson:object[@"data"][@"tab"] class:[JCDataBaseEventTabModel class]];
//            if (object[@"data"][@"list"]) {
//                self.seasonArray = [JCWJsonTool arrayWithJson:object[@"data"][@"list"] class:[JCDataBaseEventSeasonModel class]];
//            }
//
//            if (self.seasonArray.count>0&&!self.season_id) {
//                JCDataBaseEventSeasonModel *seasonModel =  self.seasonArray.firstObject;
//                self.season_id = seasonModel.id;
//
//            }
//            self.timeArray = [NSMutableArray array];
//            [self.seasonArray enumerateObjectsUsingBlock:^(JCDataBaseEventSeasonModel *obj, NSUInteger idx, BOOL * _Nonnull stop) {
//                [self.timeArray addObject:obj.year];
//            }];
//            if (self.timeArray.count>0&&self.timeLab.text.length==0) {
//                self.timeLab.text = self.timeArray.firstObject;
//            }
////            NSMutableArray *titleArray = [NSMutableArray array];
////            [self.tabArray enumerateObjectsUsingBlock:^(JCDataBaseEventTabModel *obj, NSUInteger idx, BOOL * _Nonnull stop) {
////                [titleArray addObject:obj.name];
////            }];
////            self.titleArray = [NSArray arrayWithArray:titleArray];
//            [self reloadData];
//
//        }else{
//            [JCWToastTool showHint:object[@"msg"]];
//        }
//
//    } failure:^(NSError * _Nonnull error) {
//        [self.view endLoading];
//    }];
//
//}




- (void)initViews {


}






- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];

    CGFloat headerViewHeight = kWMTeamMatchHeaderViewHeight;
//    CGFloat headerViewHeight = kWMTeamMatchHeaderViewHeight;
    CGFloat headerViewX = 0;
    UIScrollView *scrollView = (UIScrollView *)self.view;
    if (scrollView.contentOffset.y < 0) {
        headerViewX = scrollView.contentOffset.y;
        headerViewHeight -= headerViewX;

    }
    self.topHeadView.frame = CGRectMake(0, headerViewX, CGRectGetWidth(self.view.bounds), kWMTeamMatchHeaderViewHeight);
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
//    CGFloat maxOffsetY = 40;
//    float percent = offsetY/maxOffsetY;
    
//    if (percent>=1) {
//        self.topHeadView.contentBgView.alpha = 0;
//
//    }else{
//        self.topHeadView.contentBgView.alpha = 1-percent;
//
//    }


//    NSLog(@"%.2f",percent);
    
}

#pragma mark - Datasource & Delegate
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController {
    return self.titleArray.count;
}

- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
//    JCDataBaseEventTabModel *model = self.tabArray[index];
    if (index==0) {
        JCTeamDetailBaseInfoVC *vc = [JCTeamDetailBaseInfoVC new];
        vc.fatherView = self.view;
        vc.team_id = self.team_id;
        return vc;
    }
    if (index==1) {
        JCTeamDetailScoreRankVC *vc = [JCTeamDetailScoreRankVC new];
        vc.fatherView = self.view;
        vc.team_id = self.team_id;
        return vc;
    }

    if (index==2) {
        JCTeamDetailMatchListVC *vc = [JCTeamDetailMatchListVC new];
        vc.fatherView = self.view;
        vc.team_id = self.team_id;
        return vc;
    }
    if (index==3) {
        JCTeamDetailTeamZRVC *vc = [JCTeamDetailTeamZRVC new];
        vc.fatherView = self.view;
        vc.team_id = self.team_id;
        return vc;
    }
    if (index==4) {
        JCTeamDetailTeamListVC *vc = [JCTeamDetailTeamListVC new];
        vc.fatherView = self.view;
        vc.team_id = self.team_id;
        return vc;
    }
    
    

    
    UIViewController *vc = [UIViewController new];

    return vc;

}

- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    return self.titleArray[index];
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForMenuView:(WMMenuView *)menuView {
    
        menuView.backgroundColor = JCWhiteColor;
    self.lineView.frame = CGRectMake(0, kWMMenuViewHeight-1, SCREEN_WIDTH, 1);
    [menuView addSubview:self.lineView];
     return CGRectMake(0, _viewTop, SCREEN_WIDTH, kWMMenuViewHeight);

}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForContentView:(WMScrollView *)contentView {
    CGFloat originY = _viewTop + kWMMenuViewHeight;
//    if (pageController.selectIndex==0) {
//        return CGRectMake(0, originY, SCREEN_WIDTH, SCREEN_HEIGHT);
//    }
    return CGRectMake(0, originY, SCREEN_WIDTH, SCREEN_HEIGHT-kBottomTabSafeAreaHeight-kWMMenuViewHeight-kNavigationBarHeight);
//    return CGRectMake(0, originY, SCREEN_WIDTH, SCREEN_HEIGHT);
}

- (NSArray *)titleArray {
    if (!_titleArray) {
        _titleArray = @[@"基本信息",@"积分榜",@"比赛",@"阵容",@"球员榜"];
    }
    return _titleArray;
}



- (JCTeamMatchWMStickHeadView *)topHeadView {
    if (!_topHeadView) {
        _topHeadView = [JCTeamMatchWMStickHeadView new];
        _topHeadView.isTeam = YES;
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
@end
