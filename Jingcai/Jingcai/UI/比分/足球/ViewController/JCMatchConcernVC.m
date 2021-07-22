//
//  JCMatchConcernVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/6/18.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCMatchConcernVC.h"
#import "JCMatchHomeListTableViewCell.h"
#import "JCMathHomeDataHeadView.h"
#import "JCMatchInfoModel.h"
#import "JCMatchInfoTitleModel.h"
@interface JCMatchConcernVC ()

@property (nonatomic,assign) NSInteger page;

@property (nonatomic,strong) NSMutableArray *sectionArray;

@end

@implementation JCMatchConcernVC

//- (void)viewWillAppear:(BOOL)animated {
//    [super viewWillAppear:animated];
//
//
//}

- (void)viewDidLoad {
    self.style = 0;
    [super viewDidLoad];
    self.page = 1;
    self.view.backgroundColor = COLOR_F0F0F0;
    [self initViews];
    [self getDataList];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshData) name:JCMatchConcern object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshData) name:NotificationUserLogin object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshData) name:NotificationUserLogout object:nil];
    
}


- (void)getDataList {
    [self.view showLoading];
    JCMatchService_New *service = [JCMatchService_New new];
    [service getFootBallMatchConcernListWithPage:self.pageNo pageSize:10 Success:^(id  _Nullable object) {
        [self endRefresh];
        if ([JCWJsonTool isSuccessResponse:object]) {
            if(self.pageNo==1){
                [self.dataArray removeAllObjects];
            }
            NSArray *array = [JCWJsonTool arrayWithJson:object[@"data"][@"list"] class:[JCMatchInfoModel class]];
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
    [self.tableView registerClass:[JCMatchHomeListTableViewCell class] forCellReuseIdentifier:@"JCMatchHomeListTableViewCell"];

    WeakSelf;
    JNDIYemptyView *emptyView = [JNDIYemptyView diyNoDataEmptyViewWithBlock:^{
        if (![JCWUserBall currentUser]) {
            [weakSelf presentLogin];
        }
    }];
    emptyView.contentViewOffset = -AUTO(100);
    self.tableView.ly_emptyView = emptyView;
//    [self showNoDataViewImageStr:@"empty_img_follow_expert" Title:@"暂时没有比赛" BtnTitle:@"" Btnwidth:0 HiddenBtn:YES];
    
    self.tableView.mj_header = [JCFootBallHeader headerWithRefreshingBlock:^{

        [weakSelf refreshData];
    }];

    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [weakSelf getDataList];
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return self.dataArray.count;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    JCMatchInfoTitleModel *model = self.dataArray[section];
//    return model.array.count;
    return 1;
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

//    JCMathHomeDataHeadView *view = [JCMathHomeDataHeadView new];
//    JCMatchInfoTitleModel *model = self.dataArray[section];
//    view.titleLab.text= model.daytime;
//    return view;
    UIView * headView= [UIView new];
    headView.backgroundColor = COLOR_F0F0F0;
    return headView;

}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {


    return AUTO(8);
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    JCMatchHomeListTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCMatchHomeListTableViewCell"];
//    JCMatchInfoTitleModel *titleModel = self.dataArray[indexPath.section];
//    JCMatchInfoModel *model = titleModel.array[indexPath.row];
    JCMatchInfoModel *model = self.dataArray[indexPath.section];
    cell.model = model;
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
//    JCMatchInfoModel *model = titleModel.array[indexPath.row];
    JCMatchInfoModel *model = self.dataArray[indexPath.section];
    JCMatchDetailWMStickVC * detailVC = [JCMatchDetailWMStickVC new];//JNMatchDetailVC
    detailVC.matchNum = model.id;
    [self.navigationController pushViewController:detailVC animated:YES];
}

- (void)concernMatchWithModel:(JCMatchInfoModel *)infoModel indexpath:(NSIndexPath *)indexPath{
    [self.view showLoading];
    JCMatchService_New *service = [JCMatchService_New new];
//    NSLog(@"比赛关注时间%@",match_time);
    [service getMatchConcernWithMatchnum:infoModel.match_id match_time:infoModel.first_half_time category:@"1" success:^(id  _Nullable object) {
        [self endRefresh];
      if ([JCWJsonTool isSuccessResponse:object]) {

//          JCMatchInfoModel *model = self.dataArray[indexPath.row];
//          if ([self.dataArray containsObject:model]) {
//              [self.dataArray removeObject:model];
//          }
//
//          [self.tableView reloadData];
          infoModel.is_subscribe = @"0";
          [[NSNotificationCenter defaultCenter] postNotificationName:JCMatchConcern object:infoModel];
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
