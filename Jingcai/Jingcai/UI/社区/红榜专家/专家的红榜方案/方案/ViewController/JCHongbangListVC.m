//
//  JCHongbangListVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/5/19.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCHongbangListVC.h"
#import "JCExpertHongbangCell.h"
#import "JCShareView.h"
#import "JCHongbangDetailWMstckyVC.h"
#import "JCHongbangBuylWMstckyVC.h"
#import "JCPostPlanVC.h"
#import "JCTuiJianManager.h"
#import "JCMatchDetailWMStickVC.h"
@interface JCHongbangListVC ()

@property (nonatomic,strong) JCShareView *shareView;

@property (nonatomic,strong) JCWTjUserBall *tjUserBall;//用户信息

@end

@implementation JCHongbangListVC


- (void)viewDidLoad {
    self.style = 1;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initViews];
    [self refreshData];

}

- (void)refreshData {
    
    if (self.isMine) {
        [self.jcWindow showLoading];
        JCUserService_New * service = [JCUserService_New service];
        [service getMyPostTuiJianListWithType:@"2" Page:self.pageNo success:^(id  _Nullable object) {
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
    }else {
        [self.jcWindow showLoading];
        JCHomeService_New * service = [JCHomeService_New service];
        [service getHongbang_TuijianExpertDetailWithExpert_id:NonNil(self.autherID) type:@"2" page:self.pageNo Success:^(id  _Nullable object) {
            [self endRefresh];
            if ([JCWJsonTool isSuccessResponse:object]) {
                if (self.pageNo==1) {
                    [self.dataArray removeAllObjects];
                }
                NSArray *array = [JCWJsonTool arrayWithJson:object[@"data"][@"match_stat"] class:[JCHongBangBall class]];
                [self.dataArray addObjectsFromArray:array];
                [self.tableView reloadData];
                [self chageImageStr:@"nodata" Title:@"暂时还没有发布方案哦~" BtnTitle:@""];
                self.pageNo++;

            }
        } failure:^(NSError * _Nonnull error) {
            [self endRefresh];
            [self chageImageStr:@"nodata" Title:@"暂时还没有发布方案哦~" BtnTitle:@""];
        }];
    }
    



}

- (void)initViews {
    self.tableView.separatorStyle = 0;
    self.tableView.separatorInset = UIEdgeInsetsMake(0, AUTO(15), 0, 0);
    self.tableView.estimatedRowHeight = 180;
    self.tableView.scrollEnabled = YES;
    // 表格注册cell
    [self.tableView registerClass:[JCExpertHongbangCell class] forCellReuseIdentifier:@"JCExpertHongbangCell"];


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
    emptyView.contentViewOffset = -100;
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

    JCExpertHongbangCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCExpertHongbangCell"];
    WeakSelf;
    cell.matchClickBlock = ^(NSString * matchNum) {
        JCMatchDetailWMStickVC * detailVC = [JCMatchDetailWMStickVC new];
        detailVC.matchNum = matchNum;
        [weakSelf.navigationController pushViewController:detailVC animated:YES];
    };
    JCHongBangBall *dianPingBall = self.dataArray[indexPath.section];
    cell.showImage = YES;

    cell.dianPingBall = dianPingBall;

    return cell;
    
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [UIView new];
    view.backgroundColor = COLOR_F0F0F0;
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return AUTO(8);
}


- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *view = [UIView new];
    view.backgroundColor = COLOR_F6F6F6;
//    view.backgroundColor = [UIColor yellowColor];
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {

    return 0.001f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    JCHongBangBall * dianPingBall = self.dataArray[indexPath.section];
    // 支付的处理

    [JCTuiJianManager getTuiJianDetailWithTuiJianID:dianPingBall.base_info.tuijian_id orderID:@"" type:@"" WithViewController:self is_push:YES success:^{
        
        
    }];

}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

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
