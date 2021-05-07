//
//  JCBasketBallConcernViewController.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/4.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBasketBallConcernViewController.h"
#import "JCBasketBallHomeMatchCell.h"
#import "JCBasketballMathDataHeadView.h"
#import "JCMatchInfoModel.h"
#import "JCMatchInfoTitleModel.h"
#import "JCBasketBallMatchDetailWMStickVC.h"
@interface JCBasketBallConcernViewController ()

@property (nonatomic,assign) NSInteger page;

@property (nonatomic,strong) NSMutableArray *sectionArray;

@end

@implementation JCBasketBallConcernViewController

- (void)viewDidLoad {
    self.style = 0;
    [super viewDidLoad];
    self.page = 1;
    self.view.backgroundColor = COLOR_F0F0F0;
    [self initViews];
    [self getDataList];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshData) name:JCBasketBallMatchConcern object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshData) name:NotificationUserLogin object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshData) name:NotificationUserLogout object:nil];
}

//获取进行中和未开赛的比赛数据
- (void)getDataList {
//    [self.view showLoading];
    if (self.dataArray.count==0) {
        [self.view showLoading];
    }
    JCBasketBallMatchService_New *service = [JCBasketBallMatchService_New new];
    [service getbBasketBallMatchConcernListWithPage:self.pageNo Success:^(id  _Nullable object) {
        [self endRefresh];
        if ([JCWJsonTool isSuccessResponse:object]) {
            if (self.pageNo==1) {
                [self.dataArray removeAllObjects];
//                [self.sectionArray removeAllObjects];
            }
//            [self.dataArray removeAllObjects];
//            [self.sectionArray removeAllObjects];
            
            NSArray *array = [JCWJsonTool arrayWithJson:object[@"data"][@"list"] class:[JCBasketBallMatchBall class]];
            [self.dataArray addObjectsFromArray:array];

            [self.tableView reloadData];
//            self.pageNo++;
            if (array.count <PAGE_LIMIT) {
                [self.tableView.mj_footer endRefreshingWithNoMoreData];
            }
            if (array.count < PAGE_LIMIT&&self.dataArray.count>0) {
                   self.tableView.tableFooterView = self.noMore_footView;
                   self.tableView.mj_footer.hidden = YES;
               }else{
                   self.tableView.tableFooterView = [UIView new];
                   self.tableView.mj_footer.hidden = NO;
               }
            self.pageNo++;
//            [self chageImageStr:@"nodata" Title:@"您还未关注任何比赛哟~" BtnTitle:@""];
            if (![JCWUserBall currentUser]) {
                [self chageImageStr:@"nodata" Title:@"你还没有登录哟~" BtnTitle:@"去登录"];
            }else {
                [self chageImageStr:@"nodata" Title:@"您还未关注任何比赛哟~" BtnTitle:@""];
            }
            

        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        [self chageImageStr:@"nodata" Title:@"您还未关注任何比赛哟~" BtnTitle:@""];
        [self endRefresh];
    }];


}




- (void)refreshData {
    self.pageNo = 1;
    self.page = 1;
    [self getDataList];
}

- (void)initViews {
    self.tableView.estimatedRowHeight = 100;
    self.tableView.separatorColor = COLOR_DDDDDD;
    self.tableView.separatorInset = UIEdgeInsetsZero;
    // 表格注册cell
    [self.tableView registerClass:[JCBasketBallHomeMatchCell class] forCellReuseIdentifier:@"JCBasketBallHomeMatchCell"];

    WeakSelf;
    JNDIYemptyView *emptyView = [JNDIYemptyView diyNoDataEmptyViewWithBlock:^{
//        [self refreshData];
        if (![JCWUserBall currentUser]) {
            [weakSelf presentLogin];
        }
    }];
    emptyView.contentViewOffset = -AUTO(100);
    self.tableView.ly_emptyView = emptyView;
    
    self.tableView.mj_header = [JCFootBallHeader headerWithRefreshingBlock:^{
//        self.is_noMore = NO;
        [weakSelf refreshData];
    }];

    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [weakSelf getDataList];
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    JCMatchInfoTitleModel *model = self.dataArray[section];
//    return model.array.count;
    return self.dataArray.count;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    JCMatchInfoTitleModel *titleModel = self.dataArray[indexPath.section];
//    JCMatchInfoModel *model = titleModel.array[indexPath.row];
//    if ([model.matchCount integerValue]==0&&model.halfScore.length==0&&model.matchName.length==0) {
//        return AUTO(72);
//    }
//
//    return AUTO(94);
    return UITableViewAutomaticDimension;
    
    
}



- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.001f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {

//    JCBasketballMathDataHeadView *view = [JCBasketballMathDataHeadView new];
//    JCMatchInfoTitleModel *model = self.dataArray[section];
//    view.titleLab.text= model.daytime;
//    return view;
    return [UIView new];

}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {

//    return AUTO(36);
    return 0.001f;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    JCBasketBallHomeMatchCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCBasketBallHomeMatchCell"];
//    JCMatchInfoTitleModel *titleModel = self.dataArray[indexPath.section];
//    JCBasketBallMatchBall *model = titleModel.array[indexPath.row];
    JCBasketBallMatchBall *model = self.dataArray[indexPath.row];
    cell.model = model;
    cell.showBottom = YES;
//    if (model==titleModel.array.lastObject) {
//        cell.showBottom = NO;
//    }else{
//        
//        cell.showBottom = YES;
//    }
//
    WeakSelf;
    cell.JCConcernBlock = ^{
        if (![JCWUserBall currentUser]) {
            [self presentLogin];
            return;
        }
        [weakSelf concernMatchWithModel:model indexpath:indexPath];
    };

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    JCMatchInfoTitleModel *titleModel = self.dataArray[indexPath.section];
//    JCBasketBallMatchBall *model = titleModel.array[indexPath.row];
//    JCBasketBallMatchDetailWMStickVC * detailVC = [JCBasketBallMatchDetailWMStickVC new];//JNMatchDetailVC
//    detailVC.matchNum = model.id;//JCMatchDetailWMStickVC
//    [self.navigationController pushViewController:detailVC animated:YES];
    JCBasketBallMatchDetailWMStickVC * detailVC = [JCBasketBallMatchDetailWMStickVC new];//JNMatchDetailVC
    JCBasketBallMatchBall *model = self.dataArray[indexPath.row];
    detailVC.matchNum = model.match_id;
    [self.navigationController pushViewController:detailVC animated:YES];
}

- (void)concernMatchWithModel:(JCBasketBallMatchBall *)infoModel indexpath:(NSIndexPath *)indexPath{
    [self.view showLoading];
    JCMatchService_New *service = [JCMatchService_New new];
    NSString * match_time = [NSDate timeStringWithIntervalWithFormat:@"yyyy-MM-dd HH:mm:ss" time:[infoModel.match_time doubleValue]];
    NSLog(@"比赛关注时间%@",match_time);
    [service getMatchConcernWithMatchnum:infoModel.match_id match_time:match_time category:@"2" success:^(id  _Nullable object) {
        [self endRefresh];
      if ([JCWJsonTool isSuccessResponse:object]) {
//          JCMatchInfoTitleModel *titleModel = self.dataArray[indexPath.section];
//          JCMatchInfoModel *model = self.dataArray[indexPath.row];
//           model.is_subscribe = [model.is_subscribe integerValue]==1?@"0":@"1";
//          if ([self.dataArray containsObject:model]) {
//              [self.dataArray removeObject:model];
//          }
//
//
//          [self.tableView reloadData];
          infoModel.is_subscribe = @"0";
          [[NSNotificationCenter defaultCenter] postNotificationName:JCBasketBallMatchConcern object:infoModel];
      }else{
          [JCWToastTool showHint:object[@"msg"]];
      }

    } failure:^(NSError * _Nonnull error) {
        [self endRefresh];
    }];



}

- (NSMutableArray *)sectionArray {
    if (!_sectionArray) {
        _sectionArray = [NSMutableArray array];
    }
    return _sectionArray;
}

@end
