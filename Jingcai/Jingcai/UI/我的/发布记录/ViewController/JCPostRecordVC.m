//
//  JCPostRecordVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/11/6.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCPostRecordVC.h"
#import "JCMyPostRecordCell.h"
#import "JCShareView.h"
#import "JCHongbangDetailWMstckyVC.h"
#import "JCHongbangBuylWMstckyVC.h"
#import "JCPostPlanVC.h"
#import "JCTuiJianManager.h"
#import "JCMatchDetailWMStickVC.h"
@interface JCPostRecordVC ()

@property (nonatomic,strong) JCShareView *shareView;

@property (nonatomic,strong) JCWTjUserBall *tjUserBall;//用户信息

@end

@implementation JCPostRecordVC

- (void)viewDidLoad {
    self.style = 1;
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self initViews];
    [self refreshData];

}





- (void)refreshData {
    [self.view showLoading];
    JCUserService_New * service = [JCUserService_New service];
    [service getMyPostTuiJianListWithType:[NSString stringWithFormat:@"%ld",self.type] Page:self.pageNo success:^(id  _Nullable object) {
        [self endRefresh];
        if ([JCWJsonTool isSuccessResponse:object]) {
            if (self.pageNo==1) {
                [self.dataArray removeAllObjects];
            }
            NSArray *array = [JCWJsonTool arrayWithJson:object[@"data"] class:[JCHongBangBall class]];
            [self.dataArray addObjectsFromArray:array];
            [self.tableView reloadData];
            [self chageImageStr:@"nodata_fangan" Title:@"您还未发布任何方案哦~" BtnTitle:@""];
            self.pageNo++;

        }
    } failure:^(NSError * _Nonnull error) {
        [self endRefresh];
        [self chageImageStr:@"nodata_fangan" Title:@"您还未发布任何方案哦~" BtnTitle:@""];
    }];

}

- (void)initViews {
    self.tableView.separatorStyle = 0;
    self.tableView.separatorInset = UIEdgeInsetsMake(0, AUTO(15), 0, 0);
    self.tableView.estimatedRowHeight = 180;
    self.tableView.scrollEnabled = YES;
    // 表格注册cell
    [self.tableView registerClass:[JCMyPostRecordCell class] forCellReuseIdentifier:@"JCMyPostRecordCell"];

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

    JCMyPostRecordCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCMyPostRecordCell"];
    WeakSelf;
    cell.matchClickBlock = ^(NSString * matchNum) {
        JCMatchDetailWMStickVC * detailVC = [JCMatchDetailWMStickVC new];
        detailVC.matchNum = matchNum;
        [weakSelf.navigationController pushViewController:detailVC animated:YES];
    };
    
    JCHongBangBall *dianPingBall = self.dataArray[indexPath.section];
    cell.showImage = YES;
    cell.success = self.type==2?YES:NO;
    if (dianPingBall.base_info.sf==0&&self.type==2) {
        cell.success = YES;
    }
    cell.dianPingBall = dianPingBall;
    
    cell.JCEditBlock = ^(JCHongBangBall * _Nonnull model) {
//        NSLog(@"第几个%ld",indexPath.row);

        JCPostPlanVC *vc = [JCPostPlanVC new];
        vc.type = model.base_info.classfly;
        vc.postID = model.base_info.id;
        vc.JCRefreshBlock = ^{
            weakSelf.pageNo = 1;
            [weakSelf refreshData];
        };
        [weakSelf.navigationController pushViewController:vc animated:YES];
    };

    return cell;
    
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [UIView new];
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.001f;
}


- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *view = [UIView new];
    view.backgroundColor = COLOR_F0F0F0;
//    view.backgroundColor = [UIColor yellowColor];
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {

    return AUTO(8);
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    JCHongBangBall * dianPingBall = self.dataArray[indexPath.section];
    // 查看付费需要登录
    if (![JCWUserBall currentUser]) {
        [self presentLogin];
        return ;
    }
    // 支付的处理
//     [JCTuiJianManager getTuiJianDetailWithTuiJianID:dianPingBall.base_info.tuijian_id WithViewController:self is_push:YES];
    [JCTuiJianManager getTuiJianDetailWithTuiJianID:dianPingBall.base_info.tuijian_id orderID:@"" type:@"" WithViewController:self is_push:YES success:^{
        
    }];

}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    if (self.type==0) {
//        return UITableViewAutomaticDimension;
//    }
    return UITableViewAutomaticDimension;

    
}

- (JCShareView *)shareView {
    if (!_shareView) {
        _shareView = [JCShareView viewFromXib];
        _shareView.titleString = @"分享方案";
    }
    return _shareView;
}

@end
