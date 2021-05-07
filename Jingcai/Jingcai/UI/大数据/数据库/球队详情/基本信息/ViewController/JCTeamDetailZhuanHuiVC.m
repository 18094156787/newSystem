//
//  JCTeamDetailZhuanHuiVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/16.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCTeamDetailZhuanHuiVC.h"
#import "JCTeamDetailZhuanHuiDetailCell.h"
#import "JCTeamDetailZhuanHuiModel.h"
@interface JCTeamDetailZhuanHuiVC ()

@end

@implementation JCTeamDetailZhuanHuiVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initViews];
    [self refreshData];
}

- (void)refreshData {
    [self.view showLoading];
    
    JCDataBaseService_New *service = [JCDataBaseService_New new];
    [service getDataBaseTeam_ZhuanHuiRecordWithTeam_id:self.team_id type:[NSString stringWithFormat:@"%ld",self.type] page:self.pageNo Success:^(id  _Nullable object) {
        [self endRefresh];
        if ([JCWJsonTool isSuccessResponse:object]) {
            if (self.pageNo==1) {
                [self.dataArray removeAllObjects];
            }

            NSArray *dataArray = [JCWJsonTool arrayWithJson:object[@"data"] class:[JCTeamDetailZhuanHuiModel class]];
            [self.dataArray addObjectsFromArray:dataArray];
            
            if (dataArray.count <PAGE_LIMIT) {
                [self.tableView.mj_footer endRefreshingWithNoMoreData];
            }
            [self.tableView reloadData];
            self.pageNo++;


        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }
    } failure:^(NSError * _Nonnull error) {
        [self endRefresh];
        [self.view endLoading];
    }];



}

- (void)initViews {
    self.tableView.separatorColor = COLOR_DDDDDD;
    self.tableView.separatorInset = UIEdgeInsetsZero;
    [self.tableView registerClass:[JCTeamDetailZhuanHuiDetailCell class] forCellReuseIdentifier:@"JCTeamDetailZhuanHuiDetailCell"];
    WeakSelf;
    self.tableView.mj_header = [JCFootBallHeader headerWithRefreshingBlock:^{
        weakSelf.pageNo = 1;
        [weakSelf refreshData];
    }];
//
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
    
    JCTeamDetailZhuanHuiDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCTeamDetailZhuanHuiDetailCell"];
    cell.model = self.dataArray[indexPath.row];
    cell.iconImgView.image = self.type==1?JCIMAGE(@"mathchTeam_icon_zr"):JCIMAGE(@"mathchTeam_icon_zc");
  
    return cell;
}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return AUTO(60);
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
    
}


@end
