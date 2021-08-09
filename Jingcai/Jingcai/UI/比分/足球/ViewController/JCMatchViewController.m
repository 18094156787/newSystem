//
//  JCMatchViewController.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/6/16.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCMatchViewController.h"
#import "JCMatchHomeListTableViewCell.h"
#import "JCMathHomeDataHeadView.h"
#import "JCMatchInfoModel.h"
#import "JCMatchInfoTitleModel.h"
#import "JCMathDateSelectionView.h"
#import "JCMatchDetailWMStickVC.h"
#import "JCMatchNoDataFootView.h"
#import "UISegmentedControl+Extension.h"
#import "JCMatchFilterSegmentView.h"
#import "JCMatchFilterSegmentCurrentView.h"
#import "JCTeamMatchInfoMatchVC.h"
#import "NSDate+BRPickerView.h"
@interface JCMatchViewController ()

@property (nonatomic,strong) JCMathDateSelectionView *dateHeadView;

@property (nonatomic,strong) NSMutableArray *dataSource;

@property (nonatomic,strong) NSArray *timeArray;

@property (nonatomic,assign) BOOL is_noMore;

@property (nonatomic,strong) JCMatchFilterSegmentView *filterView;

@property (nonatomic,strong) JCMatchFilterSegmentCurrentView *currentFilterView;

@property (nonatomic,strong) UISegmentedControl *filterSegment;

@property (nonatomic,assign) BOOL isEntetBall;

@end

@implementation JCMatchViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self autoHideSegmentView];
}


- (void)viewDidLoad {
    self.style = 1;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.index = 1;//默认是热门
    self.eventArray = @"";
    self.screening = @"2";//赛程和已完场默认重要
//    if ([self.type integerValue]==1) {
//        self.screening = @"3";//进行中默认全部
//    }
    self.view.backgroundColor = COLOR_F0F0F0;
    [self initViews];
    [self getTimeList];
//    [self refreshData];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateInfo:) name:JCMatchConcern object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshData) name:NotificationUserLogin object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshData) name:NotificationUserLogout object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshEntertBall) name:jcMatchEntetBallRefresh object:nil];
    
//    self.filterSegment.frame = CGRectMake(100, 100, 100, 50);
//    [self.jcWindow addSubview:self.filterSegment];

}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];

}

    

- (void)refreshData {
    self.pageNo = 1;
//    self.eventArray = @"";
    [self getDataList];
}

- (void)filterData {
    self.pageNo = 1;
//    self.is_ZY = @"1";
    [self getDataList];
}


- (void)getTimeList {
    if (self.timeArray.count>0) {
        return;
    }
    NSString *type = @"1";
    if ([self.type integerValue]==2) {
        type = @"2";
    }
    JCMatchService_New *service = [JCMatchService_New new];
    [service getMatchTimeListWithType:type success:^(id  _Nullable object) {
        [self endRefresh];
         
        if ([JCWJsonTool isSuccessResponse:object]) {
            NSString *today = object[@"data"][@"time"];
            self.time = today;
            [self refreshData];
            NSArray *timeArray = [JCWJsonTool arrayWithJson:object[@"data"][@"time_array"] class:[JCMatchTimeModel class]];
            self.timeArray = timeArray;
            if ([self.type integerValue]==2) {
                timeArray =  [[timeArray reverseObjectEnumerator] allObjects];
            }
            if (today.length>0) {
                NSDate *today_date = [NSDate br_getDate:today format:@"yyyy-MM-dd"];
                [timeArray enumerateObjectsUsingBlock:^(JCMatchTimeModel *obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    NSDate *another_date = [NSDate br_getDate:obj.time format:@"yyyy-MM-dd"];
                    NSInteger result = [today_date br_compare:another_date format:@"yyyy-MM-dd"];
                    if (result==0) {
                        obj.select = YES;
                        self.dateHeadView.currentModel = obj;
                        *stop = YES;
                    }
                }];
            }
            self.dateHeadView.currentDay = self.time;
            self.dateHeadView.hidden = NO;
            self.dateHeadView.dataArray = [NSMutableArray arrayWithArray:timeArray];
            


        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        [self endRefresh];
        [self chageImageStr:@"nodata" Title:@"暂无相关的比赛，快去看看其他比赛吧！" BtnTitle:@""];
    }];

    
}

- (void)getDataList {

    if (!self.isEntetBall) {
        [self.view showLoading];
    }
    JCMatchService_New *service = [JCMatchService_New new];
//    NonNil(self.time)
    [service getMatchListWithType:self.type EventID:self.eventArray Time:NonNil(self.time) screening:self.screening Page:self.pageNo Success:^(id  _Nullable object) {
        [self endRefresh];
        self.isEntetBall = NO;
        if ([JCWJsonTool isSuccessResponse:object]) {
            if (self.pageNo==1) {
                [self.dataArray removeAllObjects];
                [self.dataSource removeAllObjects];
 //               [self.sectionArray removeAllObjects];
            }
            
            
            NSArray *array = [JCWJsonTool arrayWithJson:object[@"data"][@"list"] class:[JCMatchInfoModel class]];

             [self.dataArray addObjectsFromArray:array];
            [self.dataSource addObjectsFromArray:array];



            if (array.count <PAGE_LIMIT) {
                self.is_noMore = YES;
                [self.tableView.mj_footer endRefreshingWithNoMoreData];
            }
            [self.tableView reloadData];
            self.pageNo++;


            [self chageImageStr:@"nodata" Title:@"暂无相关的比赛，快去看看其他比赛吧！" BtnTitle:@""];
            if (array.count < PAGE_LIMIT&&self.dataArray.count>0) {
                  self.tableView.tableFooterView = self.noMore_footView;
                  self.tableView.mj_footer.hidden = YES;
              }else{
                  self.tableView.tableFooterView = [UIView new];
                  self.tableView.mj_footer.hidden = NO;
              }

        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        self.isEntetBall = NO;
        [self endRefresh];
        [self chageImageStr:@"nodata" Title:@"暂无相关的比赛，快去看看其他比赛吧！" BtnTitle:@""];
    }];


}

- (void)refreshEntertBall {
    if ([self.type integerValue]==1) {
        [self refreshData];
    }
}

- (void)filtertAll {
    if ([self.screening integerValue]==2) {
        [self.filterView showImportmant];
        self.currentFilterView.index = 1;
        self.index = 1;
    }
    if ([self.screening integerValue]==3) {
        [self.filterView showAll];
        self.currentFilterView.index = 0;
        self.index = 0;
    }
    if ([self.screening integerValue]==4) {
        [self.filterView showJingZu];
        self.currentFilterView.index = 2;
        self.index = 2;
    }
    if ([self.screening integerValue]==5) {
        [self.filterView showBeiDan];
        self.currentFilterView.index = 3;
        self.index = 3;
    }
    
   
}

- (void)filtertHot {
    [self.filterView showImportmant];
    self.currentFilterView.index = 1;
}

- (void)filtertJingZu {
    [self.filterView showJingZu];
    self.currentFilterView.index = 2;
}

- (void)filtertBeiDan {
    [self.filterView showBeiDan];
    self.currentFilterView.index = 3;
}

- (void)updateInfo:(NSNotification *)notification {
    JCMatchInfoModel *model =  [notification object];
    for (JCMatchInfoModel *aModel in self.dataArray) {
        if ([model.match_id isEqualToString:aModel.match_id]) {
              aModel.is_subscribe = model.is_subscribe;
          }
    }
    [self.tableView reloadData];
    
}

- (void)initViews {
    self.tableView.estimatedRowHeight = 100;
    if ([self.type integerValue]==0||[self.type integerValue]==2) {
        self.dateHeadView.frame = CGRectMake(0, 0, SCREEN_WIDTH, AUTO(49));
        WeakSelf;
        self.dateHeadView.JCTimeBlock = ^(NSString * _Nonnull time) {
            NSLog(@"选中的时间%@",time);
            weakSelf.time = time;
            weakSelf.eventArray= @"";
//            weakSelf.screening = @"3";
            [weakSelf.dataArray removeAllObjects];
            [weakSelf.tableView reloadData];
     
            [weakSelf refreshData];
            
        };
        self.tableView.tableHeaderView = self.dateHeadView;

    }else {
        self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0.0001)];
    }
    if ([self.type integerValue]<3) {
        [self.view addSubview:self.filterView];
        self.filterView.frame = CGRectMake(SCREEN_WIDTH/2.0f-100, SCREEN_HEIGHT-kNavigationBarHeight-kTabBarHeight-150, 200, 32);
        
        [self.view addSubview:self.currentFilterView];
        self.currentFilterView.frame = CGRectMake(SCREEN_WIDTH-64, SCREEN_HEIGHT-kNavigationBarHeight-kTabBarHeight-150, 64, 32);
    }
    
    self.tableView.backgroundColor = COLOR_F4F6F9;
    self.tableView.separatorColor = COLOR_DDDDDD;
    self.tableView.separatorInset = UIEdgeInsetsZero;
    self.tableView.separatorStyle = 0;
    // 表格注册cell
    [self.tableView registerClass:[JCMatchHomeListTableViewCell class] forCellReuseIdentifier:@"JCMatchHomeListTableViewCell"];

    WeakSelf;
    JNDIYemptyView *emptyView = [JNDIYemptyView diyNoDataEmptyViewWithBlock:^{
        [weakSelf refreshData];
    }];
    emptyView.contentViewOffset = -AUTO(100);
    self.tableView.ly_emptyView = emptyView;
//    [self showNoDataViewImageStr:@"empty_img_follow_expert" Title:@"暂时没有比赛" BtnTitle:@"" Btnwidth:0 HiddenBtn:YES];
    
    self.tableView.mj_header = [JCFootBallHeader headerWithRefreshingBlock:^{
        weakSelf.is_noMore = NO;
//        [self refreshData];
        if (weakSelf.timeArray.count>0) {
            [weakSelf refreshData];
        }else{
            [weakSelf getTimeList];
        }
    }];

    
    MJRefreshBackNormalFooter *mj_foot = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self getDataList];
    }];
    self.tableView.mj_footer = mj_foot;
    if ([self.type intValue]==1) {
        [mj_foot setTitle:@"" forState:MJRefreshStateNoMoreData];
    }

    self.filterView.JCBlock = ^(NSInteger index) {

        [weakSelf filterBtnClick];
        weakSelf.currentFilterView.index = weakSelf.filterView.selectIndex;
        weakSelf.index = (int)index;
    };
    
    
    self.currentFilterView.JCBlock = ^{
        [weakSelf showSegmentView];
    };

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return self.dataArray.count;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

//    JCMatchInfoModel *model = self.dataArray[indexPath.section];
//    if ([model.matchCount integerValue]==0&&model.halfScore.length==0&&model.matchName.length==0) {
//        return AUTO(72);
//    }
//    return AUTO(94);
    return UITableViewAutomaticDimension;
}



- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
//    if (section==self.dataArray.count-1) {
//        return 0.001f;
//    }
//    return AUTO(8);
    return 0.001f;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *footView = [UIView new];
    footView.backgroundColor = COLOR_F0F0F0;
    return footView;

}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headView = [UIView new];
    headView.backgroundColor = COLOR_F0F0F0;
    return headView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {

    return AUTO(8);
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    JCMatchHomeListTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCMatchHomeListTableViewCell"];
    JCMatchInfoModel *model = self.dataArray[indexPath.section];

    cell.model = model;
    WeakSelf;
    cell.JCConcernBlock = ^{
        if (![JCWUserBall currentUser]) {
            [self presentLogin];
            return;
        }
        [weakSelf concernMatchWithModel:model];
    };

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    
    
//    JCMatchInfoTitleModel *titleModel = self.dataArray[indexPath.section];
    JCMatchInfoModel *model = self.dataArray[indexPath.section];
    JCMatchDetailWMStickVC * detailVC = [JCMatchDetailWMStickVC new];//JNMatchDetailVC
    detailVC.matchNum = model.match_id;//JCMatchDetailWMStickVC
//    detailVC.matchNum = @"3518682";
    
    [self.navigationController pushViewController:detailVC animated:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self hideSegmentView];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
}

- (void)concernMatchWithModel:(JCMatchInfoModel *)infoModel {
    [self.view showLoading];
    JCMatchService_New *service = [JCMatchService_New new];
    [service getMatchConcernWithMatchnum:infoModel.match_id match_time:infoModel.first_half_time category:@"1" success:^(id  _Nullable object) {
        [self.view endLoading];
      if ([JCWJsonTool isSuccessResponse:object]) {
          //如果用户点击了关注,则记录下,去关注列表刷新数据,而不用每次都刷新关注列表的数据
          infoModel.is_subscribe = [infoModel.is_subscribe integerValue]==0?@"1":@"0";
          [self.tableView reloadData];
          [[NSNotificationCenter defaultCenter] postNotificationName:JCMatchConcern object:infoModel];
      }else{
          [JCWToastTool showHint:object[@"msg"]];
      }

    } failure:^(NSError * _Nonnull error) {
        [self.view endLoading];
    }];

}

- (void)filterBtnClick {
    self.eventArray = @"";
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(hideSegmentView) object:nil];
    if (self.filterView.selectIndex==0) {
        [JCWToastTool showHint:@"已自动为您筛选【全部】比赛"];
        self.screening = @"3";
        [self autoHideSegmentView];
    }else if (self.filterView.selectIndex==1) {
        [JCWToastTool showHint:@"已自动为您筛选【热门】比赛"];
        self.screening = @"2";
        [self autoHideSegmentView];
    }else if (self.filterView.selectIndex==2) {
        [JCWToastTool showHint:@"已自动为您筛选【竞足】比赛"];
        self.screening = @"4";
        [self autoHideSegmentView];
    }else {
        [JCWToastTool showHint:@"已自动为您筛选【北单】比赛"];
        self.screening = @"5";
        [self autoHideSegmentView];
    }
    [self refreshData];
    
}



- (void)filterSegmentClick {
    if (self.filterSegment.selectedSegmentIndex==0) {
//        [_filterSegment setImage:JCIMAGE(@"match_icon_collection") forSegmentAtIndex:0];
//        [_filterSegment setImage:nil forSegmentAtIndex:1];
    }
    if (self.filterSegment.selectedSegmentIndex==1) {
//        [_filterSegment setImage:JCIMAGE(@"match_icon_collection") forSegmentAtIndex:1];
//        [_filterSegment setImage:nil forSegmentAtIndex:0];
    }

}

- (void)showSegmentView {
    self.filterView.hidden = NO;
    self.currentFilterView.hidden = YES;
    [self.tableView setContentOffset:self.tableView.contentOffset animated:NO];
    [UIView animateWithDuration:0.3 animations:^{
        self.filterView.frame = CGRectMake(SCREEN_WIDTH/2.0f-100, SCREEN_HEIGHT-kNavigationBarHeight-kTabBarHeight-150, 200, 32);
    } completion:^(BOOL finished) {
       
    }];
//    [self filterBtnClick];

}

- (void)autoHideSegmentView {
    if (!self.filterView.hidden) {
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            [self hideSegmentView];
//    });
        [self performSelector:@selector(hideSegmentView) withObject:nil afterDelay:3];

    }
}

- (void)hideSegmentView {
    
    
    [UIView animateWithDuration:0.3 animations:^{
        self.filterView.frame = CGRectMake(SCREEN_WIDTH-50, SCREEN_HEIGHT-kNavigationBarHeight-kTabBarHeight-150, 200, 32);
    } completion:^(BOOL finished) {
        self.filterView.hidden = YES;
        self.currentFilterView.hidden = NO;
    }];
    
}

- (JCMathDateSelectionView *)dateHeadView {
    if (!_dateHeadView) {
        _dateHeadView = [JCMathDateSelectionView new];
        _dateHeadView.hidden = YES;
        _dateHeadView.type= self.type;
    }
    return _dateHeadView;
}

- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}



- (JCMatchFilterSegmentView *)filterView {
    if (!_filterView) {
        _filterView = [JCMatchFilterSegmentView new];
        [_filterView showImportmant];
    }
    return _filterView;
}

- (JCMatchFilterSegmentCurrentView *)currentFilterView {
    if (!_currentFilterView) {
        _currentFilterView = [JCMatchFilterSegmentCurrentView new];
        _currentFilterView.index = 1;
        _currentFilterView.hidden = YES;
    }
    return _currentFilterView;
}

- (UISegmentedControl *)filterSegment {
    if (!_filterSegment) {
        _filterSegment = [[UISegmentedControl alloc] initWithItems:@[@"全部",@"重要"]];
        [_filterSegment setBackgroundImage:JCIMAGE(@"ic_match_filterSegment") forState:0 barMetrics:0];
        [_filterSegment setBackgroundImage:JCIMAGE(@"ic_match_filterSegment") forState:UIControlStateHighlighted barMetrics:0];
        _filterSegment.backgroundColor = JCWhiteColor;
//        [_filterSegment seti];
//        [_filterSegment setImage:JCIMAGE(@"match_icon_collection") forSegmentAtIndex:0];
//        [_filterSegment setDividerImage:JCIMAGE(@"whiteBg") forLeftSegmentState:0 rightSegmentState:0 barMetrics:0];
        
        _filterSegment.selectedSegmentIndex = 0;
        [_filterSegment addTarget:self action:@selector(filterSegmentClick) forControlEvents:UIControlEventValueChanged];
        _filterSegment.tintColor = [UIColor clearColor];
//        [_filterSegment setTintColor:JCWhiteColor];
    }
    return _filterSegment;
}

@end
