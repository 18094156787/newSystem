//
//  JCBasketBallGoingViewController.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/4.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBasketBallGoingViewController.h"
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
@interface JCBasketBallGoingViewController ()

@property (nonatomic,strong) JCMathDateSelectionView *dateHeadView;

@property (nonatomic,strong) NSMutableArray *dataSource;//已截止

@property (nonatomic,assign) BOOL is_noMore;


@end

@implementation JCBasketBallGoingViewController

- (void)viewDidLoad {
    self.style = 1;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.eventArray = @"";
    self.screening = @"3";
    self.view.backgroundColor = COLOR_F0F0F0;
    [self initViews];
    [self refreshData];
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
    [self getDataList];

}

- (void)filterData {
    self.pageNo = 1;
//    self.is_ZY = @"1";
    [self getDataList];
}

- (void)getDataList {

    [self.view showLoading];
    JCBasketBallMatchService_New *service = [JCBasketBallMatchService_New new];
    [service getMatchListWithType:self.type EventID:self.eventArray Time:self.time screening:self.screening Page:self.pageNo Success:^(id  _Nullable object) {
        [self endRefresh];
         
        if ([JCWJsonTool isSuccessResponse:object]) {
            if (self.pageNo==1) {
                [self.dataArray removeAllObjects];
            }
            
            NSArray *array = [JCWJsonTool arrayWithJson:object[@"data"][@"list"] class:[JCBasketBallMatchBall class]];
            [self.dataArray addObjectsFromArray:array];

            if (array.count ==0) {
                self.is_noMore = YES;
                [self.tableView.mj_footer endRefreshingWithNoMoreData];
            }
            [self.tableView reloadData];
            self.pageNo++;

            [self chageImageStr:@"nodata" Title:@"暂无相关的比赛，快去看看其他比赛吧！" BtnTitle:@""];
            if (self.dataArray.count==0) {
                [self.tableView ly_showEmptyView];
            }else{
                [self.tableView ly_hideEmptyView];
            }
            
            if ([self.type intValue]==1) {
                if (array.count <20&&self.dataArray.count>0) {
                      self.tableView.tableFooterView = self.noMore_footView;
                      self.tableView.mj_footer.hidden = YES;
                  }else{
                      self.tableView.tableFooterView = [UIView new];
                      self.tableView.mj_footer.hidden = NO;
                  }
            }else{
                if (self.dataArray.count==0) {
                    self.tableView.tableFooterView = [UIView new];
                    self.tableView.mj_footer.hidden = NO;
                }else{
                    self.tableView.tableFooterView = self.noMore_footView;
                    self.tableView.mj_footer.hidden = YES;
                }

            }
        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        [self endRefresh];
        [self chageImageStr:@"nodata" Title:@"暂无相关的比赛，快去看看其他比赛吧！" BtnTitle:@""];
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
        [weakSelf refreshData];
    }];

    
    MJRefreshBackNormalFooter *mj_foot = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [weakSelf getDataList];
    }];
    self.tableView.mj_footer = mj_foot;
    if ([self.type intValue]==2) {
        [mj_foot setTitle:@"" forState:MJRefreshStateNoMoreData];
    }

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
        JCBasketBallMatchBall *model = self.dataArray[indexPath.section];
        
        [weakSelf concernMatchWithModel:model];
    };

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    
    
//    JCMatchInfoTitleModel *titleModel = self.dataArray[indexPath.section];
//    JCMatchInfoModel *model = self.dataArray[indexPath.section];
    JCBasketBallMatchDetailWMStickVC * detailVC = [JCBasketBallMatchDetailWMStickVC new];//JNMatchDetailVC
    JCBasketBallMatchBall *model = self.dataArray[indexPath.section];
    detailVC.matchNum = model.match_id;
    [self.navigationController pushViewController:detailVC animated:YES];
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

- (void)filterBtnClick {
    self.eventArray = @"";
    self.screening = @"3";
    [self refreshData];
    
}



- (JCMathDateSelectionView *)dateHeadView {
    if (!_dateHeadView) {
        _dateHeadView = [JCMathDateSelectionView new];
        _dateHeadView.hidden = YES;
    }
    return _dateHeadView;
}

- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

@end
