//
//  JCFootBallAuthorHistoryPlaneDetailVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2019/8/9.
//  Copyright © 2019年 blockstar. All rights reserved.
//

#import "JCFootBallAuthorHistoryPlaneDetailVC.h"
#import "JCFootBallAuthorHistoryPlaneCell.h"
#import "JCDakaPlanDetailStickWMVC.h"
@interface JCFootBallAuthorHistoryPlaneDetailVC ()

@end

@implementation JCFootBallAuthorHistoryPlaneDetailVC


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = COLOR_F0F0F0;
    // Do any additional setup after loading the view.
    [self initViews];
    [self refreshData];
}

- (void)refreshData {
    if (!self.expertID) {
        return;
    }
    [self.jcWindow showLoading];
//    @weakify(self);
    
    JCHomeService_New *service = [JCHomeService_New new];
    [service getGZHT_TuijianExpertDetailWithExpert_id:self.expertID type:@"2" page:self.pageNo Success:^(id  _Nullable object) {
        if ([JCWJsonTool isSuccessResponse:object]) {
            [self endRefresh];
            if (self.pageNo==1) {
                [self.dataArray removeAllObjects];
            }
            NSArray *array = [JCWJsonTool arrayWithJson:object[@"data"][@"best_new_plans"] class:[JCWTjInfoBall class]];
            
            [self.dataArray addObjectsFromArray:array];
            if (array.count < PAGE_LIMIT) {
                [self.tableView.mj_footer endRefreshingWithNoMoreData];
            }
            [self.tableView reloadData];
            self.pageNo++;

//            self.isLoad = YES;

            if (array.count < PAGE_LIMIT&&self.dataArray.count>0) {
                    self.tableView.tableFooterView = self.noMore_footView;
                    self.tableView.mj_footer.hidden = YES;
                }else{
                    self.tableView.tableFooterView = [UIView new];
                    self.tableView.mj_footer.hidden = NO;
                }
            
            NSLog(@"数据%@",self.dataArray);
            [self chageImageStr:@"nodata_fangan" Title:@"暂时还没有发布方案哦~" BtnTitle:@""];
        }else {
            [JCWToastTool showHint:object[@"msg"]];
        }
    } failure:^(NSError * _Nonnull error) {
        [self chageImageStr:@"nodata_fangan" Title:@"暂时还没有发布方案哦~" BtnTitle:@""];
        [self endRefresh];
    }];
}
- (void)initViews {
    
    self.tableView.separatorInset = UIEdgeInsetsZero;
    self.tableView.separatorStyle = 0;
    self.tableView.estimatedRowHeight = 80;
    // 表格注册cell
    [self.tableView registerClass:[JCFootBallAuthorHistoryPlaneCell class] forCellReuseIdentifier:@"JCFootBallAuthorHistoryPlaneCell"];
    
//    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.left.right.top.equalTo(self.view);
//        make.bottom.equalTo(self.view).mas_offset(-kTabBarHeight);
//    }];
    

    WeakSelf;
    self.tableView.mj_header = [JCFootBallHeader headerWithRefreshingBlock:^{
        weakSelf.pageNo = 1;
        [weakSelf refreshData];
    }];

    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [weakSelf refreshData];
    }];
    
    JNDIYemptyView *emptyView = [JNDIYemptyView diyNoDataEmptyViewWithBlock:^{
        [weakSelf refreshData];
    }];
    emptyView.contentViewOffset = -150;
    self.tableView.ly_emptyView = emptyView;
    
}

#pragma mark - Protocol
#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    JCWTjInfoBall *model = self.dataArray[indexPath.section];
    JCFootBallAuthorHistoryPlaneCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCFootBallAuthorHistoryPlaneCell"];
    cell.model = model;
    return cell;

    
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *view = [UIView new];
    view.backgroundColor = COLOR_F6F6F6;
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section==self.dataArray.count-1) {
        return 0.001f;
    }
    return AUTO(5);
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (![JCWUserBall currentUser]) {
        [self presentLogin];
        return ;
    }
    JCWTjInfoBall *model = self.dataArray[indexPath.section];
    [JCTuiJianManager loadGZH_ArticleDetailWithArticleID:model.id orderID:@"" type:@"" WithViewController:self is_push:YES];

}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}
@end
