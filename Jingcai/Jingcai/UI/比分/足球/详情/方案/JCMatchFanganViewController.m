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

    return self.faDataArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JCHongBangBall *model = self.faDataArr[indexPath.row];
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
    JCHongBangBall * dianPingBall = self.faDataArr[indexPath.row];
    [JCTuiJianManager getTuiJianDetailWithTuiJianID:dianPingBall.base_info.tuijian_id orderID:@"" type:@"" WithViewController:self is_push:YES success:^{
        
    }];
}




#pragma mark -
- (void)setFaDataArr:(NSArray *)faDataArr {
    _faDataArr = faDataArr;
    [self.tableView reloadData];
}

- (void)setMatchBall:(JCWMatchBall *)matchBall {
    if (!matchBall) {
        return;
    }
    _matchBall = matchBall;
//    [self loadFanganDataWithMatchNum:matchBall.matchNum];
    
}

- (void)loadFanganDataWithMatchNum:(NSString *)matchNum {
    WeakSelf;
//    [self.view showLoading];
    JCMatchService_New * service = [JCMatchService_New service];
    [service getFootBallMatchPlanListWithMatch_id:matchNum Page:self.pageNo Success:^(id  _Nullable object) {
        [self.view endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
            weakSelf.faDataArr = [JCWJsonTool arrayWithJson:object[@"data"] class:[JCHongBangBall class]];
             [weakSelf.tableView reloadData];
            if (weakSelf.faDataArr.count==0) {
                UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200)];
                [headView showNoDataClearViewWithTitle:@"暂时无方案" isTop:YES];
                self.tableView.tableHeaderView = headView;
            }else{
                [self.tableView hideNoData];
                self.tableView.tableHeaderView = [UIView new];
            }

            
        }
    } failure:^(NSError * _Nonnull error) {
        
    }];

}
@end
