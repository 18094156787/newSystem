//
//  JCMatchFanganViewController.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/11/25.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCMatchFanganViewController.h"
#import "JCMatchParticipateCell.h"
#import "JCHongbangCommomCell.h"
#import "JCHongbangWMstckyVC.h"
#import "JCYCExpertWMStickyVC.h"
#import "JCTuiJianManager.h"
@interface JCMatchFanganViewController ()

@end

@implementation JCMatchFanganViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.scrollEnabled = YES;
    [self.tableView registerClass:[JCMatchParticipateCell class] forCellReuseIdentifier:@"JCMatchParticipateCell"];
    [self.tableView registerClass:[JCHongbangCommomCell class] forCellReuseIdentifier:@"JCHongbangCommomCell"];
    
    self.tableView.estimatedRowHeight = 100;
    self.tableView.backgroundColor = COLOR_F6F6F6;
    [self loadFanganDataWithMatchNum:self.matchNum];
    
    WeakSelf;
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [weakSelf loadFanganDataWithMatchNum:weakSelf.matchNum];
    }];
    self.tableView.mj_header = [JCFootBallHeader headerWithRefreshingBlock:^{
        weakSelf.pageNo = 1;
        
        [weakSelf loadFanganDataWithMatchNum:weakSelf.matchNum];
    }];

}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    CGFloat tableH = self.tableView.contentSize.height;
    if (self.needReturnHeightBlock) {
        self.needReturnHeightBlock(tableH);
    }
}

#pragma mark - UITableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JCHongBangBall *model = self.dataArray[indexPath.row];
    JCHongbangCommomCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCHongbangCommomCell"];
    cell.hideImage = YES;
    cell.dianPingBall = model;
    WeakSelf;
    cell.matchClickBlock = ^(NSString *matchNum) {
        JCMatchDetailWMStickVC * detailVC = [JCMatchDetailWMStickVC new];
        detailVC.matchNum = matchNum;
        [weakSelf.navigationController pushViewController:detailVC animated:YES];
    };
    cell.userClickBlock = ^(NSString * _Nullable tjUserId) {
        JCHongbangWMstckyVC * userVC = [JCHongbangWMstckyVC new];
        userVC.autherID = tjUserId;
        [weakSelf.navigationController pushViewController:userVC animated:YES];
    };
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return UITableViewAutomaticDimension;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    JCHongBangBall * dianPingBall = self.dataArray[indexPath.row];
    [JCTuiJianManager getTuiJianDetailWithTuiJianID:dianPingBall.base_info.tuijian_id orderID:@"" type:@"" WithViewController:self is_push:YES success:^{
        
    }];
}






- (void)loadFanganDataWithMatchNum:(NSString *)matchNum {

//    [self.view showLoading];
    JCMatchService_New * service = [JCMatchService_New service];
    [service getFootBallMatchPlanListWithMatch_id:matchNum Page:self.pageNo Success:^(id  _Nullable object) {
        [self.view endLoading];
        [self endRefresh];
        if ([JCWJsonTool isSuccessResponse:object]) {
            if (self.pageNo==1) {
                [self.dataArray removeAllObjects];
            }
            NSArray *dataArray = [JCWJsonTool arrayWithJson:object[@"data"] class:[JCHongBangBall class]];
            [self.dataArray addObjectsFromArray:dataArray];
//             [weakSelf.tableView reloadData];
            if (self.dataArray.count==0) {
                UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200)];
                [headView showNoDataClearViewWithTitle:@"暂时无方案" isTop:YES];
                self.tableView.tableHeaderView = headView;
            }else{
                [self.tableView hideNoData];
                self.tableView.tableHeaderView = [UIView new];
            }
            if (dataArray.count < PAGE_LIMIT) {
                [self.tableView.mj_footer endRefreshingWithNoMoreData];

            }
            self.pageNo++;
            [self.tableView reloadData];
            
        }
    } failure:^(NSError * _Nonnull error) {
        [self endRefresh];
    }];

}


@end
