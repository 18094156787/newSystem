//
//  JCActivityMatchVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/3/5.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCActivityMatchVC.h"
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
#import "NSDate+BRPickerView.h"
@interface JCActivityMatchVC ()

@property (nonatomic,strong) JCMathDateSelectionView *dateHeadView;

@property (nonatomic,strong) NSMutableArray *dataSource;

@property (nonatomic,strong) NSArray *timeArray;

@property (nonatomic,assign) BOOL is_noMore;

@property (nonatomic,strong) JCMatchFilterSegmentView *filterView;

@property (nonatomic,strong) JCMatchFilterSegmentCurrentView *currentFilterView;

@end

@implementation JCActivityMatchVC

- (void)viewDidLoad {
    self.style = 1;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.eventArray = @"";
    self.screening = @"3";
    self.time = @"2021-06-12";
    self.view.backgroundColor = COLOR_F0F0F0;
    [self initViews];
    [self getTimeList];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateInfo:) name:JCMatchConcern object:nil];
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
    JCActivityService *service = [JCActivityService new];
    [service getMatchTimeListWithSuccess:^(id  _Nullable object) {
        [self endRefresh];
         
        if ([JCWJsonTool isSuccessResponse:object]) {
            NSString *today = object[@"data"][@"time"];
            self.time = today;
            [self refreshData];
            NSArray *timeArray = [JCWJsonTool arrayWithJson:object[@"data"][@"time_array"] class:[JCMatchTimeModel class]];
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
    JCMatchService_New *service = [JCMatchService_New new];
    
//    NonNil(self.time)
    [service getMatchListWithType:@"0" EventID:@"45" Time:self.time screening:self.screening Page:self.pageNo Success:^(id  _Nullable object) {
        [self endRefresh];
         
        if ([JCWJsonTool isSuccessResponse:object]) {
            if (self.pageNo==1) {
                [self.dataArray removeAllObjects];
                [self.dataSource removeAllObjects];
 //               [self.sectionArray removeAllObjects];
            }
            
            
            NSArray *array = [JCWJsonTool arrayWithJson:object[@"data"][@"list"] class:[JCMatchInfoModel class]];
            
//            self.dateHeadView.today = self.time;
//            self.dateHeadView.hidden = NO;

//            if (self.time.length==0) {
//                self.time = [NSString stringWithFormat:@"%@",object[@"data"][@"now_time"]];
//            }
//            if (self.time.length>0&&self.dateHeadView.hidden) {
//                self.time = [NSDate timeStringWithIntervalWithFormat:@"yyyy-MM-dd" time:[self.time doubleValue]];
//                self.dateHeadView.today = self.time;
//                self.dateHeadView.hidden = NO;
//            }
             [self.dataArray addObjectsFromArray:array];
            [self.dataSource addObjectsFromArray:array];



            if (array.count <PAGE_LIMIT) {
                self.is_noMore = YES;
                [self.tableView.mj_footer endRefreshingWithNoMoreData];
            }
            [self.tableView reloadData];
            self.pageNo++;


//            if ([self.type integerValue]==2) {
//                [self chageImageStr:@"nodata" Title:@"暂无更多比赛" BtnTitle:@""];
//            }else{
//                [self chageImageStr:@"nodata" Title:@"暂无正在进行的比赛，快去看看其他比赛吧！" BtnTitle:@""];
//            }
            [self chageImageStr:@"nodata" Title:@"暂无更多比赛" BtnTitle:@""];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                
                if (array.count < PAGE_LIMIT&&self.dataArray.count>0) {
                      self.tableView.tableFooterView = self.noMore_footView;
                      self.tableView.mj_footer.hidden = YES;
                  }else{
                      self.tableView.tableFooterView = [UIView new];
                      self.tableView.mj_footer.hidden = NO;
                  }
            });


        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        [self endRefresh];
        [self chageImageStr:@"nodata" Title:@"暂无正在进行的比赛，快去看看其他比赛吧！" BtnTitle:@""];
    }];


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
//    if ([self.type integerValue]==0||[self.type integerValue]==2) {
    self.dateHeadView.frame = CGRectMake(0, 0, SCREEN_WIDTH, AUTO(49));
    self.time = @"2021-06-12";//br_compar
    self.dateHeadView.today = self.time;
    NSDate *today_date = [NSDate date];
    NSDate *euro_date = [NSDate br_getDate:@"2021-06-12" format:@"yyyy-MM-dd"];//欧洲杯开始时间
    NSInteger result = [today_date br_compare:euro_date format:@"yyyy-MM-dd"];
    if (result==1) {
        NSLog(@"今天大于2021-06-12");
        self.time = [NSDate br_getDateString:today_date format:@"yyyy-MM-dd"];
        
    }
                         
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
    [self.view addSubview:self.dateHeadView];
    
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(49));
    }];
    
    
    [self.view addSubview:self.filterView];
    self.filterView.frame = CGRectMake(SCREEN_WIDTH-120, SCREEN_HEIGHT-kNavigationBarHeight-kTabBarHeight-120, 112, 46);
    
    [self.view addSubview:self.currentFilterView];
    self.currentFilterView.frame = CGRectMake(SCREEN_WIDTH-54, SCREEN_HEIGHT-kNavigationBarHeight-kTabBarHeight-120, 54, 46);

    
    self.tableView.backgroundColor = COLOR_F4F6F9;
    self.tableView.separatorColor = COLOR_DDDDDD;
    self.tableView.separatorInset = UIEdgeInsetsZero;
    self.tableView.separatorStyle = 0;
    // 表格注册cell
    [self.tableView registerClass:[JCMatchHomeListTableViewCell class] forCellReuseIdentifier:@"JCMatchHomeListTableViewCell"];

    JNDIYemptyView *emptyView = [JNDIYemptyView diyNoDataEmptyViewWithBlock:^{
        [weakSelf refreshData];
    }];
    emptyView.contentViewOffset = -AUTO(100);
    self.tableView.ly_emptyView = emptyView;
//    [self showNoDataViewImageStr:@"empty_img_follow_expert" Title:@"暂时没有比赛" BtnTitle:@"" Btnwidth:0 HiddenBtn:YES];
    
    self.tableView.mj_header = [JCFootBallHeader headerWithRefreshingBlock:^{
        weakSelf.is_noMore = NO;
        if (weakSelf.timeArray.count>0) {
            [weakSelf refreshData];
        }else{
            [weakSelf getTimeList];
        }
        
    }];

    
    MJRefreshBackNormalFooter *mj_foot = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [weakSelf getDataList];
    }];
    self.tableView.mj_footer = mj_foot;


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

//    JCMatchInfoModel *model = self.dataArray[indexPath.section];
//    if ([model.matchCount integerValue]==0&&model.halfScore.length==0&&model.matchName.length==0) {
//        return AUTO(72);
//    }
//    return AUTO(94);
    return UITableViewAutomaticDimension;
}



- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section==self.dataArray.count-1) {
        return 0.001f;
    }
    return AUTO(8);
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *footView = [UIView new];
    footView.backgroundColor = COLOR_F0F0F0;
    return footView;

}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [UIView new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {

    return 0.001f;
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
    if (self.filterView.selectIndex==1) {
        [JCWToastTool showHint:@"已自动为您筛选【重要】比赛"];
        self.screening = @"1";
        [self autoHideSegmentView];
    }else{
        [JCWToastTool showHint:@"已自动为您筛选【全部】比赛"];
        self.screening = @"3";
        [self autoHideSegmentView];
    }
    [self refreshData];
    
}


- (void)showSegmentView {
    self.filterView.hidden = NO;
    self.currentFilterView.hidden = YES;
    [UIView animateWithDuration:0.3 animations:^{
        self.filterView.frame = CGRectMake(SCREEN_WIDTH-120, SCREEN_HEIGHT-kNavigationBarHeight-kTabBarHeight-120, 112, 46);
    } completion:^(BOOL finished) {
       
    }];
//    [self filterBtnClick];

}

- (void)autoHideSegmentView {
    if (!self.filterView.hidden) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self hideSegmentView];
    });

    }
}

- (void)hideSegmentView {
    
    
    [UIView animateWithDuration:0.3 animations:^{
       
        self.filterView.frame = CGRectMake(SCREEN_WIDTH-50, SCREEN_HEIGHT-kNavigationBarHeight-kTabBarHeight-120, 112, 46);
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
    }
    return _filterView;
}

- (JCMatchFilterSegmentCurrentView *)currentFilterView {
    if (!_currentFilterView) {
        _currentFilterView = [JCMatchFilterSegmentCurrentView new];
        _currentFilterView.hidden = YES;
    }
    return _currentFilterView;
}


@end
