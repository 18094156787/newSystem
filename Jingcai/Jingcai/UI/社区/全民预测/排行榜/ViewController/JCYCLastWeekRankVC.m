//
//  JCYCLastWeekRankVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/28.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCYCLastWeekRankVC.h"
#import "JCYCRankTableViewCell.h"
#import "JCYCLianhongRankCell.h"
#import "JCYCExpertWMStickyVC.h"
#import "JCYCRankModel.h"
#import "JCHongbangWMstckyVC.h"
#import "JCYCExpertWMStickyVC.h"
#import "JCYCExpertYcRecondWMStickyVC.h"
@interface JCYCLastWeekRankVC ()

@end

@implementation JCYCLastWeekRankVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationBarStyle = JCNavigationBarStyleTransparent;

}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationBarStyle = JCNavigationBarStyleTransparent;
}

- (void)viewDidLoad {
    self.style = 1;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = [UIColor colorWithRed:129/255.0 green:6/255.0 blue:15/255.0 alpha:1.0];
    [self initViews];
    self.view.backgroundColor = COLOR_48041F;
    [self refreshData];
}

- (void)initViews {
    self.tableView.separatorColor = COLOR_F0F0F0;
    self.tableView.backgroundColor = JCWhiteColor;
    UIView *bgView = [UIView new];
    bgView.backgroundColor = COLOR_F0F0F0;
    [self.view insertSubview:bgView atIndex:0];
    [bgView hg_setCornerOnTopWithRadius:12];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.insets(UIEdgeInsetsMake(0, -12, 0, -12));
        make.left.top.right.equalTo(self.view);
        make.bottom.offset(100);

    }];

    
    [self.tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
        make.left.equalTo(self.view).offset(12);
        make.right.offset(-12);
        make.bottom.equalTo(self.view).offset(-kBottomTabSafeAreaHeight-30);
    }];
    [self.tableView registerClass:[JCYCRankTableViewCell class] forCellReuseIdentifier:@"JCYCRankTableViewCell"];
    [self.tableView registerClass:[JCYCLianhongRankCell class] forCellReuseIdentifier:@"JCYCLianhongRankCell"];
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
        [weakSelf getDataList];
    }];
    
}


- (void)refreshData {
    self.pageNo = 1;
    [self getDataList];
}

- (void)getDataList {
    if (self.dataArray.count==0) {
        [self.view showLoading];
    }
    JCJingCaiService_New *service = [JCJingCaiService_New service];
    [service getJingcaiRankList_LastWeekWithpage:self.pageNo success:^(id  _Nullable object) {
        [self endRefresh];
     if ([JCWJsonTool isSuccessResponse:object]) {
         if (self.pageNo==1) {
             [self.dataArray removeAllObjects];
         }
         NSArray *array = [NSArray yy_modelArrayWithClass:[JCYCRankModel class] json:object[@"data"]];
         [self.dataArray addObjectsFromArray:array];
         [self.tableView reloadData];
         if (array.count < PAGE_LIMIT) {
             [self.tableView.mj_footer endRefreshingWithNoMoreData];
         }
         self.pageNo++;
        

         [self chageImageStr:@"nodata_rank" Title:@"当前还没有排行榜哟" BtnTitle:@"刷新"];
     }else{
         [JCWToastTool showHint:object[@"msg"]];
     }

    } failure:^(NSError * _Nonnull error) {
        [self chageImageStr:@"nodata_rank" Title:@"当前还没有排行榜哟" BtnTitle:@"刷新"];
        [self endRefresh];
    }];
}

#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    return self.dataArray.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    JCYCRankTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCYCRankTableViewCell"];
    cell.model = self.dataArray[indexPath.row];
    WeakSelf;
    cell.JCJumpBlock = ^(JCYCRankModel * _Nonnull model) {
        if ([model.guess_user_infor_top intValue]==1) {
            JCYCExpertYcRecondWMStickyVC *vc = [JCYCExpertYcRecondWMStickyVC new];
            vc.expertID = model.user_id;
            vc.title = [NSString stringWithFormat:@"%@的预测",model.user_name];
            [weakSelf.navigationController pushViewController:vc animated:YES];
        }
    };
    
    return cell;
}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return AUTO(80);
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.0001f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return [UIView new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.0001;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *backView= [UIView new];
    return backView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.type==1) {
        JCYCRankModel *model = self.dataArray[indexPath.row];
        if (model.jump==1) {
            JCYCExpertWMStickyVC *vc = [JCYCExpertWMStickyVC new];
            vc.expertID = model.user_id;
            [self.navigationController pushViewController:vc animated:YES];
        }

    }
    if (self.type==3) {
        JCYCRankModel *model = self.dataArray[indexPath.row];
        if ([model.top integerValue]==1) {
            JCHongbangWMstckyVC *vc = [JCHongbangWMstckyVC new];
            vc.autherID = model.user_id;
            [self.navigationController pushViewController:vc animated:YES];
            
//            JCYCExpertWMStickyVC *vc = [JCYCExpertWMStickyVC new];
//             vc.expertID = model.user_id;
//             vc.type = @"2";
//             [self.navigationController pushViewController:vc animated:YES];
        }else {
            JCYCExpertWMStickyVC *vc = [JCYCExpertWMStickyVC new];
            vc.expertID = model.user_id;
            vc.type = @"2";
            [self.navigationController pushViewController:vc animated:YES];

        }

    }
    

}

@end
