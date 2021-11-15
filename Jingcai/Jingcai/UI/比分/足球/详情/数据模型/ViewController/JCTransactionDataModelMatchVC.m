//
//  JCTransactionDataModelMatchVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/13.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCTransactionDataModelMatchVC.h"
#import "JCTransactionDataModelDetailDataCell.h"
#import "JCTransactionDataModelDetailSameMatchCell.h"
#import "JCTransactionDataModelDetailZhiShuCell.h"
#import "JCPoissonDataModelDetailAttackCell.h"
#import "JCTransactionDataModelTitleView.h"
@interface JCTransactionDataModelMatchVC ()

@end

@implementation JCTransactionDataModelMatchVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    self.navigationBarStyle = JCNavigationBarStyleTransparent;

}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];


}

- (void)viewDidLoad {
    self.style = 1;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initViews];
    [self refreshData];
}


- (void)refreshData {
    self.pageNo = 1;
    [self getDataList];
}

- (void)getDataList {

//    [self.jcWindow showLoading];
//    JCMatchService_New *service = [JCMatchService_New new];
//    [service getPredictedMatchListWithType:@"2" Key_word:@"" Page:self.pageNo Success:^(id  _Nullable object) {
//        [self endRefresh];
//
//        if ([JCWJsonTool isSuccessResponse:object]) {
//            if (self.pageNo==1) {
//                [self.dataArray removeAllObjects];
//            }
//            NSArray *array = [JCWJsonTool arrayWithJson:object[@"data"][@"list"] class:[JCMatchInfoModel class]];
//             [self.dataArray addObjectsFromArray:array];
//            if (array.count <PAGE_LIMIT) {
//                [self.tableView.mj_footer endRefreshingWithNoMoreData];
//            }
//            [self.tableView reloadData];
//            self.pageNo++;
//            [self chageImageStr:@"nodata" Title:@"暂无更多比赛" BtnTitle:@""];
//
//            if (array.count ==0&&self.dataArray.count>0) {
//                  self.tableView.tableFooterView = self.noMore_footView;
//                  self.tableView.mj_footer.hidden = YES;
//              }else{
//                  self.tableView.tableFooterView = [UIView new];
//                  self.tableView.mj_footer.hidden = NO;
//              }
//
//        }else{
//            [JCWToastTool showHint:object[@"msg"]];
//        }
//
//    } failure:^(NSError * _Nonnull error) {
//        [self endRefresh];
//        [self chageImageStr:@"nodata" Title:@"暂无更多比赛" BtnTitle:@""];
//    }];

}


- (void)initViews {
//    JCJingCaiAIBigDataMatchTitleView *titleView = [[JCJingCaiAIBigDataMatchTitleView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, AUTO(45))];
//    titleView.backgroundColor = JCWhiteColor;
//    titleView.titleLab.text = @"比赛列表";
//    titleView.iconView.hidden = NO;
//    self.tableView.tableHeaderView = titleView;
//
//    titleView.JCBlcok = ^{
//        [weakSelf.navigationController pushViewController:[JCJingCaiAIBigDataHomeVC new] animated:YES];
//    };
    
    UIButton *customView = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    [customView addTarget:self action:@selector(backItemClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:customView];
    
    

    WeakSelf;
    self.tableView.estimatedRowHeight = 300;
//    self.tableView.backgroundColor = COLOR_F4F6F9;
    self.tableView.separatorColor = COLOR_DDDDDD;
    self.tableView.separatorInset = UIEdgeInsetsZero;
    self.tableView.separatorStyle = 0;
    // 表格注册cell
    [self.tableView registerClass:[JCTransactionDataModelDetailDataCell class] forCellReuseIdentifier:@"JCTransactionDataModelDetailDataCell"];
    [self.tableView registerClass:[JCTransactionDataModelDetailSameMatchCell class] forCellReuseIdentifier:@"JCTransactionDataModelDetailSameMatchCell"];
    [self.tableView registerClass:[JCPoissonDataModelDetailAttackCell class] forCellReuseIdentifier:@"JCPoissonDataModelDetailAttackCell"];
    
    [self.tableView registerClass:[JCTransactionDataModelDetailZhiShuCell class] forCellReuseIdentifier:@"JCTransactionDataModelDetailZhiShuCell"];
    
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view).offset(0);
    }];

    
//    self.headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, AUTO(48));
//    self.tableView.tableHeaderView = self.headView;
    
    
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 10)];

    JNDIYemptyView *emptyView = [JNDIYemptyView diyNoDataEmptyViewWithBlock:^{
        [weakSelf refreshData];
    }];
    emptyView.contentViewOffset = 0;
    self.tableView.ly_emptyView = emptyView;

 

}

- (void)backItemClick {
    [self.navigationController popViewControllerAnimated:YES];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 4;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if (section==3) {
        return 5;
    }


    return 1;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section<3) {
        return AUTO(100);
    }
    if (indexPath.section==3) {
        return AUTO(50);
    }
    
    return UITableViewAutomaticDimension;
}


//
//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
//
//    return AUTO(8);
//}
//
//- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
//    UIView *footVew = [UIView new];
//    footVew.backgroundColor = COLOR_F0F0F0;
//    return footVew;
//
//}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {

    JCTransactionDataModelTitleView *headView = [JCTransactionDataModelTitleView new];
    
    if (section==0) {
        headView.titleLab.text = @"异动数据-胜平负";
//        headView.inf
    }
    if (section==1) {
        headView.titleLab.text = @"异动数据-让球";
    }
    if (section==2) {
        headView.titleLab.text = @"异动数据-进球数";
    }
    if (section==3) {
        headView.titleLab.text = @"数据对比";
    }

    
    return headView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return AUTO(40);
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JCTransactionDataModelDetailDataCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCTransactionDataModelDetailDataCell"];
    if (indexPath.section<3) {
        return cell;
    }

    if (indexPath.section==3) {
        JCPoissonDataModelDetailAttackCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCPoissonDataModelDetailAttackCell"];
        if (indexPath.row==0) {
            cell.titleLab.text = @"场均进球";
        }
        if (indexPath.row==1) {
            cell.titleLab.text = @"场均失球";
        }
        if (indexPath.row==2) {
            cell.titleLab.text = @"场均角球";
        }
        if (indexPath.row==3) {
            cell.titleLab.text = @"场均射门";
        }
        if (indexPath.row==4) {
            cell.titleLab.text = @"场均控球率";
        }

        return cell;
    }
    
    
    UITableViewCell * commomCell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    return commomCell;
    
}

@end
