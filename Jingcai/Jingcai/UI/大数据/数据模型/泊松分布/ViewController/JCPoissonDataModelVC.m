//
//  JCPoissonDataModelVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/10.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCPoissonDataModelVC.h"
#import "JCPoissonDataModelLockedCell.h"
#import "JCPoissonDataModelOpenCell.h"
#import "JCPoissonDataModelDetailVC.h"
#import "JCKellyDataModelModel.h"
@interface JCPoissonDataModelVC ()

@end

@implementation JCPoissonDataModelVC

- (void)viewDidLoad {
    self.style = 1;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initViews];
//    [self refreshData];
}


- (void)refreshData {
    self.pageNo = 1;
    [self getDataList];
}

- (void)getDataList {

//    [self.jcWindow showLoading];
    JCDataBaseService_New *service = [JCDataBaseService_New new];
    [service getPoissonDataModeListWithDate:self.date Page:self.pageNo success:^(id  _Nullable object) {
        [self endRefresh];

        if ([JCWJsonTool isSuccessResponse:object]) {
            if (self.pageNo==1) {
                [self.dataArray removeAllObjects];
            }
            NSArray *array = [JCWJsonTool arrayWithJson:object[@"data"][@"list"] class:[JCKellyDataModelModel class]];
             [self.dataArray addObjectsFromArray:array];
            if (array.count <PAGE_LIMIT) {
                [self.tableView.mj_footer endRefreshingWithNoMoreData];
            }
            [self.tableView reloadData];
            self.pageNo++;
            [self chageImageStr:@"jc_dataModel_empty" Title:@"当前暂无比赛数据~" BtnTitle:@""];

            if (array.count <PAGE_LIMIT&&self.dataArray.count>0) {
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
        [self endRefresh];
        [self chageImageStr:@"jc_dataModel_empty" Title:@"当前暂无比赛数据~" BtnTitle:@""];
    }];


}


- (void)initViews {
    WeakSelf;
    self.tableView.estimatedRowHeight = 300;
    self.tableView.backgroundColor = COLOR_F4F6F9;
    self.tableView.separatorColor = COLOR_DDDDDD;
    self.tableView.separatorInset = UIEdgeInsetsZero;
    self.tableView.separatorStyle = 0;
    // 表格注册cell
    [self.tableView registerClass:[JCPoissonDataModelLockedCell class] forCellReuseIdentifier:@"JCPoissonDataModelLockedCell"];
    [self.tableView registerClass:[JCPoissonDataModelOpenCell class] forCellReuseIdentifier:@"JCPoissonDataModelOpenCell"];
    
//    self.headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, AUTO(48));
//    self.tableView.tableHeaderView = self.headView;
    
    
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 10)];

    JNDIYemptyView *emptyView = [JNDIYemptyView diyNoDataEmptyViewWithBlock:^{
        [weakSelf refreshData];
    }];
    emptyView.contentViewOffset = 0;
    self.tableView.ly_emptyView = emptyView;
//    [self showNoDataViewImageStr:@"empty_img_follow_expert" Title:@"暂时没有比赛" BtnTitle:@"" Btnwidth:0 HiddenBtn:YES];
    
//    self.tableView.mj_header = [JCFootBallHeader headerWithRefreshingBlock:^{
//        [weakSelf refreshData];
//    }];

    
    MJRefreshBackNormalFooter *mj_foot = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [weakSelf getDataList];
    }];
    self.tableView.mj_footer = mj_foot;
    [mj_foot setTitle:@"" forState:MJRefreshStateNoMoreData];

 

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;

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
    UIView *footView = [UIView new];
    footView.backgroundColor = COLOR_F0F0F0;
    return footView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return AUTO(4);
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    JCKellyDataModelModel *model = self.dataArray[indexPath.row];
    if (model.can_look==1) {
        JCPoissonDataModelOpenCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCPoissonDataModelOpenCell"];
        cell.model = model;
        return cell;
    }
    JCPoissonDataModelLockedCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCPoissonDataModelLockedCell"];
    cell.model = model;

    return cell;

    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    JCKellyDataModelModel *model = self.dataArray[indexPath.row];
    if (model.can_look==0) {
        //未开通,前往开通
        if (self.JCOpenBlock) {
            self.JCOpenBlock();
        }
    }else{
        JCPoissonDataModelDetailVC *vc = [JCPoissonDataModelDetailVC new];
        vc.model_id = self.model_id;
        vc.match_id = model.match_id;
        [self.navigationController pushViewController:vc animated:YES];
    }
    

    
    
    

}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [super scrollViewDidScroll:scrollView];
    self.isTop = self.tableView.contentOffset.y>0?YES:NO;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
