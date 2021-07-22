//
//  JCBasketBallSCViewController.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/4.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBasketBallSCViewController.h"
#import "JCBasketBallHomeMatchCell.h"
#import "JCBasketballMathDataHeadView.h"
#import "JCMatchInfoModel.h"
#import "JCMatchInfoTitleModel.h"
#import "JCMathDateSelectionView.h"
#import "JCBasketBallMatchDetailWMStickVC.h"
#import "JCMatchNoDataFootView.h"
#import "UISegmentedControl+Extension.h"
#import "JCMatchFilterSegmentView.h"
#import "JCMatchFilterSegmentCurrentView.h"
#import "JCTeamMatchInfoMatchVC.h"
#import "NSDate+BRPickerView.h"
#import "JCMatchFilter_BasketBall_SegmentView.h"
#import "JCMatchFilterSegment_BasketBall_CurrentView.h"
@interface JCBasketBallSCViewController ()

@property (nonatomic,strong) JCMathDateSelectionView *dateHeadView;

@property (nonatomic,strong) NSArray *timeArray;

@property (nonatomic,strong) NSMutableArray *dataSource;//已截止

@property (nonatomic,assign) BOOL is_noMore;

@property (nonatomic,strong) JCMatchFilter_BasketBall_SegmentView *filterView;

@property (nonatomic,strong) JCMatchFilterSegment_BasketBall_CurrentView *currentFilterView;

@end

@implementation JCBasketBallSCViewController

- (void)viewDidLoad {
    self.style = 1;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.eventArray = @"";
    self.screening = @"3";
    self.view.backgroundColor = COLOR_F0F0F0;
    [self initViews];
    [self getTimeList];
//    [self refreshData];
//    [self refreshData];
//    if (self.dateHeadView.hidden) {
//        [self getTimeData];
//    }
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateInfo:) name:JCBasketBallMatchConcern object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshData) name:NotificationUserLogin object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshData) name:NotificationUserLogout object:nil];
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
        [self chageImageStr:@"nodata" Title:@"暂无正在进行的比赛，快去看看其他比赛吧！" BtnTitle:@""];
    }];

    
}

- (void)getDataList {


    [self.view showLoading];
    JCBasketBallMatchService_New *service = [JCBasketBallMatchService_New new];
//    self.time = @"2021-01-21";
    [service getMatchListWithType:self.type EventID:self.eventArray Time:NonNil(self.time) screening:self.screening Page:self.pageNo Success:^(id  _Nullable object) {
        [self endRefresh];
        if ([JCWJsonTool isSuccessResponse:object]) {
            if (self.pageNo==1) {
                [self.dataArray removeAllObjects];
            }

            NSArray *array = [JCWJsonTool arrayWithJson:object[@"data"][@"list"] class:[JCBasketBallMatchBall class]];
            [self.dataArray addObjectsFromArray:array];
            
//            self.pageNo++;

            if ([self.type integerValue]==2) {
                [self chageImageStr:@"nodata" Title:@"暂无更多比赛" BtnTitle:@""];
            }else{
                [self chageImageStr:@"nodata" Title:@"暂无正在进行的比赛，快去看看其他比赛吧！" BtnTitle:@""];
            }


            if (array.count==0) {
                self.is_noMore = YES;
                [self.tableView.mj_footer endRefreshingWithNoMoreData];

                self.tableView.tableFooterView = self.noMore_footView;
                self.tableView.mj_footer.hidden = YES;
            }else{
                self.tableView.tableFooterView = [UIView new];
                self.tableView.mj_footer.hidden = NO;
            }
            if (self.dataArray.count==0) {
                self.tableView.tableFooterView = [UIView new];
                self.tableView.mj_footer.hidden = NO;
            }
            self.pageNo++;
            [self.tableView reloadData];
            
        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        [self endRefresh];
        if ([self.type integerValue]==2) {
            [self chageImageStr:@"nodata" Title:@"暂无更多比赛" BtnTitle:@""];
        }else{
            [self chageImageStr:@"nodata" Title:@"暂无正在进行的比赛，快去看看其他比赛吧！" BtnTitle:@""];
        }
    }];

}

- (void)updateInfo:(NSNotification *)notification {
    JCBasketBallMatchBall *model =  [notification object];
    for (JCBasketBallMatchBall *aModel in self.dataArray) {
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
            weakSelf.screening = @"3";
            [weakSelf.dataArray removeAllObjects];
            [weakSelf.tableView reloadData];
            [weakSelf refreshData];
        };
        [self.view addSubview:self.dateHeadView];
        
        [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.offset(AUTO(49));
        }];
        


    }
    
    if ([self.type integerValue]<3) {
        [self.view addSubview:self.filterView];
        self.filterView.frame = CGRectMake(SCREEN_WIDTH/2.0f-75, SCREEN_HEIGHT-kNavigationBarHeight-kTabBarHeight-150, 146, 32);
        
        [self.view addSubview:self.currentFilterView];
        self.currentFilterView.frame = CGRectMake(SCREEN_WIDTH-64, SCREEN_HEIGHT-kNavigationBarHeight-kTabBarHeight-150, 64, 32);
    }
    
    self.tableView.backgroundColor = COLOR_F4F6F9;
    self.tableView.separatorColor = COLOR_DDDDDD;
    self.tableView.separatorInset = UIEdgeInsetsZero;
    self.tableView.separatorStyle = 0;
    // 表格注册cell
    [self.tableView registerClass:[JCBasketBallHomeMatchCell class] forCellReuseIdentifier:@"JCBasketBallHomeMatchCell"];

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
    if ([self.type intValue]==2) {
        [mj_foot setTitle:@"" forState:MJRefreshStateNoMoreData];
    }
    
    self.filterView.JCBlock = ^(NSInteger index) {

        [weakSelf filterBtnClick];
        weakSelf.currentFilterView.index = weakSelf.filterView.selectIndex;
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

    return UITableViewAutomaticDimension;
}



- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.001f;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {

    return [UIView new];

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

    JCBasketBallHomeMatchCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCBasketBallHomeMatchCell"];
    cell.showBottom = YES;
    JCBasketBallMatchBall *model = self.dataArray[indexPath.section];
    cell.model = model;
   
    WeakSelf;
    cell.JCConcernBlock = ^{
        if (![JCWUserBall currentUser]) {
            [self presentLogin];
            return;
        }
        JCBasketBallMatchBall *amodel = self.dataArray[indexPath.section];;
        [weakSelf concernMatchWithModel:amodel];
    };

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    JCBasketBallMatchDetailWMStickVC * detailVC = [JCBasketBallMatchDetailWMStickVC new];//JNMatchDetailVC
    JCBasketBallMatchBall *model = self.dataArray[indexPath.section];
    detailVC.matchNum = model.match_id;
    [self.navigationController pushViewController:detailVC animated:YES];
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self hideSegmentView];
}
- (void)concernMatchWithModel:(JCBasketBallMatchBall *)infoModel {
    [self.view showLoading];
    JCMatchService_New *service = [JCMatchService_New new];
    NSString * match_time = [NSDate timeStringWithIntervalWithFormat:@"yyyy-MM-dd HH:mm:ss" time:[infoModel.match_time doubleValue]];
    [service getMatchConcernWithMatchnum:infoModel.match_id match_time:match_time category:@"2" success:^(id  _Nullable object) {
        [self endRefresh];
      if ([JCWJsonTool isSuccessResponse:object]) {
          //如果用户点击了关注,则记录下,去关注列表刷新数据,而不用每次都刷新关注列表的数据
          infoModel.is_subscribe = [infoModel.is_subscribe integerValue]==0?@"1":@"0";
          [self.tableView reloadData];
          [[NSNotificationCenter defaultCenter] postNotificationName:JCBasketBallMatchConcern object:infoModel];
      }else{
          [JCWToastTool showHint:object[@"msg"]];
      }

    } failure:^(NSError * _Nonnull error) {
        [self endRefresh];
    }];


}

- (void)filtertAll {
    if ([self.screening integerValue]==2) {
        [self.filterView showImportmant];
        self.currentFilterView.index = 1;
    }
    if ([self.screening integerValue]==3) {
        [self.filterView showAll];
        self.currentFilterView.index = 0;
    }
    if ([self.screening integerValue]==4) {
        [self.filterView showJingLan];
        self.currentFilterView.index = 2;
    }

    
   
}

//- (void)filterBtnClick {
//    self.eventArray = @"";
//    self.screening = @"3";
//    [self refreshData];
//
//}

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
        [JCWToastTool showHint:@"已自动为您筛选【竞篮】比赛"];
        self.screening = @"4";
        [self autoHideSegmentView];
    }
    [self refreshData];
    
}

- (void)autoHideSegmentView {
    if (!self.filterView.hidden) {

        [self performSelector:@selector(hideSegmentView) withObject:nil afterDelay:3];

    }
}

- (void)hideSegmentView {
    
    
    [UIView animateWithDuration:0.3 animations:^{
       
        self.filterView.frame = CGRectMake(SCREEN_WIDTH-50, SCREEN_HEIGHT-kNavigationBarHeight-kTabBarHeight-150, 146, 32);
    } completion:^(BOOL finished) {
        self.filterView.hidden = YES;
        self.currentFilterView.hidden = NO;
    }];
    
}

- (void)showSegmentView {
    self.filterView.hidden = NO;
    self.currentFilterView.hidden = YES;
    [self.tableView setContentOffset:self.tableView.contentOffset animated:NO];    [UIView animateWithDuration:0.3 animations:^{
        self.filterView.frame = CGRectMake(SCREEN_WIDTH/2.0f-75, SCREEN_HEIGHT-kNavigationBarHeight-kTabBarHeight-150, 146, 32);
    } completion:^(BOOL finished) {
       
    }];
//    [self filterBtnClick];

}

- (JCMathDateSelectionView *)dateHeadView {
    if (!_dateHeadView) {
        _dateHeadView = [JCMathDateSelectionView new];
        _dateHeadView.hidden = YES;
        _dateHeadView.type = self.type;
    }
    return _dateHeadView;
}

- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

- (JCMatchFilter_BasketBall_SegmentView *)filterView {
    if (!_filterView) {
        _filterView = [JCMatchFilter_BasketBall_SegmentView new];
        [_filterView showImportmant];
    }
    return _filterView;
}

- (JCMatchFilterSegment_BasketBall_CurrentView *)currentFilterView {
    if (!_currentFilterView) {
        _currentFilterView = [JCMatchFilterSegment_BasketBall_CurrentView new];
        _currentFilterView.index = 1;
        _currentFilterView.hidden = YES;
    }
    return _currentFilterView;
}


@end
