//
//  JCTopRankListVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/8/18.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCTopRankListVC.h"
#import "JCTopRankListCell.h"
#import "JCTopRankList_LianHongCell.h"
#import "JCHongbangWMstckyVC.h"
@interface JCTopRankListVC ()

@end

@implementation JCTopRankListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initView];
    [self refreshData];
//    [self showNonetView];
}

- (void)initView {
    UIView *colorView = [UIView new];
    colorView.frame = CGRectMake(0, 0, SCREEN_WIDTH, AUTO(8));
    colorView.backgroundColor = COLOR_F0F0F0;
    self.tableView.tableHeaderView = colorView;
    
    
    self.tableView.separatorInset = UIEdgeInsetsZero;
    self.tableView.estimatedRowHeight = 100;
    [self.tableView registerClass:[JCTopRankListCell class] forCellReuseIdentifier:@"JCTopRankListCell"];
    [self.tableView registerClass:[JCTopRankList_LianHongCell class] forCellReuseIdentifier:@"JCTopRankList_LianHongCell"];
//    self.tableView.contentInset = UIEdgeInsetsMake(AUTO(8), 0, 0, 0);
    WeakSelf;
    self.tableView.mj_header = [JCFootBallHeader headerWithRefreshingBlock:^{
        weakSelf.pageNo = 1;
        [weakSelf refreshData];
    }];

//    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
//        [self refreshData];
//    }];

    JNDIYemptyView *emptyView = [JNDIYemptyView diyNoDataEmptyViewWithBlock:^{
        [weakSelf refreshData];
    }];
    self.tableView.ly_emptyView = emptyView;
}

#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.type==3) {
        JCTopRankList_LianHongCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCTopRankList_LianHongCell"];
        cell.selectionStyle = 0;
        JCCommunityRankModel *model = self.dataArray[indexPath.row];
        cell.model = model;
        WeakSelf;
        cell.JCConcernBlock = ^(JCCommunityRankModel * _Nonnull rankModel) {
            [weakSelf concernTuiJianWithModel:rankModel];
        };
        if (indexPath.row<3) {
            cell.iconImgView.hidden = NO;
            cell.numberLab.hidden = YES;
            NSString *imgName = [NSString stringWithFormat:@"jc_yu_rank%ld",indexPath.row];
            cell.iconImgView.image = JCIMAGE(imgName);
        }else{
            cell.iconImgView.hidden = YES;
            cell.numberLab.hidden = NO;
            cell.numberLab.text = [NSString stringWithFormat:@"%ld",indexPath.row+1];
        }
        return cell;
    }
    
    
    
    JCTopRankListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCTopRankListCell"];
    cell.selectionStyle = 0;
    JCCommunityRankModel *model = self.dataArray[indexPath.row];
    cell.type = self.type;
     cell.model = model;
     WeakSelf;
     cell.JCConcernBlock = ^(JCCommunityRankModel * _Nonnull rankModel) {
         [weakSelf concernTuiJianWithModel:rankModel];
     };
    if (indexPath.row<3) {
        cell.iconImgView.hidden = NO;
        cell.numberLab.hidden = YES;
        NSString *imgName = [NSString stringWithFormat:@"jc_yu_rank%ld",indexPath.row];
        cell.iconImgView.image = JCIMAGE(imgName);
    }else{
        cell.iconImgView.hidden = YES;
        cell.numberLab.hidden = NO;
        cell.numberLab.text = [NSString stringWithFormat:@"%ld",indexPath.row+1];
    }
    return cell;
}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
 
    return AUTO(68);
}



- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.0001;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *backView= [UIView new];
    return backView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    JCHongbangWMstckyVC * userVC = [JCHongbangWMstckyVC new];
    JCCommunityRankModel *model = self.dataArray[indexPath.row];
    userVC.autherID = model.user_id;
    [self.navigationController pushViewController:userVC animated:YES];
}


- (void)refreshData {

    if (self.dataArray.count==0) {
        [self.view showLoading];
    }
    JCCommunityService_New *service = [JCCommunityService_New service];
    [service getHongbangExpertLsitWithType:[NSString stringWithFormat:@"%ld",self.type] page:self.pageNo success:^(id  _Nullable object) {
        [self endRefresh];
     if ([JCWJsonTool isSuccessResponse:object]) {
         if (self.pageNo==1) {
             [self.dataArray removeAllObjects];
         }
         NSArray *array = @[];
         array = [NSArray yy_modelArrayWithClass:[JCCommunityRankModel class] json:object[@"data"]];
//         if (self.type==1||self.type==3) {
//             array = [NSArray yy_modelArrayWithClass:[JCCommunityRankModel class] json:object[@"data"]];
//
//         }
//         if (self.type==2) {
//             array = [NSArray yy_modelArrayWithClass:[JCCommunityRankModel class] json:object[@"data2"]];
//         }

         if (array.count>0) {
             [self.dataArray addObjectsFromArray:array];
              [self.tableView reloadData];
         }
         
         
        
         if (array.count < PAGE_LIMIT) {
             [self.tableView.mj_footer endRefreshingWithNoMoreData];
         }
         self.pageNo++;
         [self showNoDataView];

     }else{
         [JCWToastTool showHint:object[@"msg"]];
     }

    } failure:^(NSError * _Nonnull error) {
        [self showNoDataView];
         [self endRefresh];
    }];

}
- (void)concernTuiJianWithModel:(JCCommunityRankModel *)model{

    if (![JCWUserBall currentUser]) {
        [self presentLogin];
        return;
    }
    WeakSelf;
        BOOL isAdd = NO;
        if ([model.is_subscribe isEqualToString:@"关注"]) {
            isAdd = YES;
        }
    NSString *userID = model.user_id;
    if (self.type==2) {
        userID = model.talent_id;
    }
        [self.view showLoading];
        JCHomeService_New * service = [JCHomeService_New service];
        [service gzUserWithId:userID type:@"1" success:^(id  _Nullable object) {
            [self endRefresh];
            if ([JCWJsonTool isSuccessResponse:object]) {
                model.is_subscribe = isAdd?@"已关注":@"关注";
    //            model.fensi = object[@"data"][@"fensi"];
                [weakSelf.tableView reloadData];

            }
        } failure:^(NSError * _Nonnull error) {
            [self endRefresh];
        }];
    

}
@end
