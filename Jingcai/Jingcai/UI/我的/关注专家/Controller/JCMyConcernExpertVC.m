//
//  JCMyConcernExpertVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/8/28.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCMyConcernExpertVC.h"
#import "JCMyConcernExpertCell.h"
#import "JCHongbangWMstckyVC.h"
#import "JCFootBallAuthorDetailWMViewController.h"
@interface JCMyConcernExpertVC ()

@end

@implementation JCMyConcernExpertVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self setNavBackImg];
     [self refreshData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = COLOR_F0F0F0;
    [self initViews];
   
    
}


- (void)initViews {
//    self.tableView.backgroundColor = COLOR_F6F6F6;
    self.tableView.separatorStyle = 1;
    self.tableView.separatorInset = UIEdgeInsetsZero;
    self.tableView.separatorColor = COLOR_DDDDDD;
    // 表格注册cell
    [self.tableView registerClass:[JCMyConcernExpertCell class] forCellReuseIdentifier:@"JCMyConcernExpertCell"];
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.view);
        make.bottom.equalTo(self.view).mas_offset(-kBottomTabSafeAreaHeight);
    }];
    WeakSelf;
    JNDIYemptyView *emptyView = [JNDIYemptyView diyNoDataEmptyViewWithBlock:^{
        [weakSelf refreshData];
    }];
    self.tableView.ly_emptyView = emptyView;
    
    self.tableView.mj_header = [JCFootBallHeader headerWithRefreshingBlock:^{
        weakSelf.pageNo = 1;
        
        [weakSelf refreshData];
    }];
    
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [weakSelf refreshData];
    }];
    
}

#pragma mark - Protocol
#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    JCMyConcernExpertCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCMyConcernExpertCell"];
    cell.backgroundColor = JCWhiteColor;
    JCWExpertBall *model = self.dataArray[indexPath.row];
    cell.model = model;
    WeakSelf;
    cell.JCConcernBlock = ^{
            [weakSelf concernTuiJianWithModel:model];
    };
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.type integerValue]==1) {
        //红榜
        JCWExpertBall *model = self.dataArray[indexPath.row];
        JCHongbangWMstckyVC *vc = [JCHongbangWMstckyVC new];
        vc.autherID = model.id;
        [self.navigationController pushViewController:vc animated:YES];
    }
    if ([self.type integerValue]==2) {
        //大咖
        JCFootBallAuthorDetailWMViewController *vc = [JCFootBallAuthorDetailWMViewController new];
        JCWExpertBall *model = self.dataArray[indexPath.row];
        vc.autherID = model.id;
        [self.navigationController pushViewController:vc animated:YES];
    }


}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return AUTO(60);
}




- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *footView = [UIView new];
    return footView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.001f;
}

#pragma mark lazyload



#pragma mark DataRequest

- (void)refreshData{
    self.pageNo = 1;
    [self getDataList];
}

- (void)getDataList {
    WeakSelf;
    if (self.dataArray.count==0) {
        [self.view showLoading];
    }
    JCUserService_New *service = [JCUserService_New service];
    [service getMyConcernExpertkLsitWithType:self.type Page:self.pageNo success:^(id  _Nullable object) {
        [weakSelf endRefresh];

        if ([JCWJsonTool isSuccessResponse:object]) {
            if (self.pageNo==1) {
                [self.dataArray removeAllObjects];
            }
            
            
            NSArray *array = [JCWJsonTool arrayWithJson:object[@"data"][@"list"] class:[JCWExpertBall class]];
            [self.dataArray addObjectsFromArray:array];
            [self.tableView reloadData];
            if (array.count < PAGE_LIMIT) {
                [weakSelf.tableView.mj_footer endRefreshingWithNoMoreData];
            }
            [self chageImageStr:@"nodata_gz" Title:@"您还未关注任何人哟~" BtnTitle:@""];
            self.pageNo++;
        }
    } failure:^(NSError * _Nonnull error) {
        [self chageImageStr:@"nodata_gz" Title:@"您还未关注任何人哟~" BtnTitle:@""];
        [weakSelf endRefresh];
    }];

}

- (void)concernTuiJianWithModel:(JCWExpertBall *)model{
    WeakSelf;
    if (![JCWUserBall currentUser]) {
        [self presentLogin];
        return;;
    }
    BOOL isAdd = NO;
    if ([model.subscribe isEqualToString:@"0"]) {
        isAdd = YES;
    }
    [self.view showLoading];
    JCHomeService_New * service = [JCHomeService_New service];
////    //默认是公众号
//    NSString *type = @"2";
////    NSString *user_ID =model.user_id;
////
//    if ([model.type integerValue]==1) {
//        //如果是红榜
//        type = @"2";
//    }
    [service gzUserWithId:model.id type:self.type success:^(id  _Nullable object) {
        [self endRefresh];
        if ([JCWJsonTool isSuccessResponse:object]) {

            [self.dataArray removeObject:model];
            [weakSelf.tableView reloadData];

        }
    } failure:^(NSError * _Nonnull error) {
        [self endRefresh];
    }];


}

@end
