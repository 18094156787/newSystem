//
//  JCTeamDetailTeamZRVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/16.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCTeamDetailTeamZRVC.h"
#import "JCDataBaseTitleHeadView.h"
#import "JCTeamDetailTeamZRCell.h"
#import "JCTeamDetailZhenRongInfoModel.h"
@interface JCTeamDetailTeamZRVC ()

@end

@implementation JCTeamDetailTeamZRVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initView];
    [self refreshData];
}

- (void)refreshData {
    [self.fatherView showLoading];
    JCDataBaseService_New *service = [JCDataBaseService_New new];
    
    [service getDataBaseTeam_ZhenRongWithTeam_id:NonNil(self.team_id) Success:^(id  _Nullable object) {
        [self.fatherView endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
             NSArray *array = [JCWJsonTool arrayWithJson:object[@"data"][@"squad"] class:[JCTeamDetailZhenRongInfoModel class]];
            JCTeamDetailZhenRongModel *model = (JCTeamDetailZhenRongModel *)[JCWJsonTool entityWithJson:object[@"data"][@"manager"] class:[JCTeamDetailZhenRongModel class]];
            model.player_name_zh = model.name_zh;
            NSMutableArray *m_array = [NSMutableArray array];
            if (array.count>0) {
                [m_array addObjectsFromArray:array];
            }
            
            JCTeamDetailZhenRongInfoModel *jsModel = [JCTeamDetailZhenRongInfoModel new];
            jsModel.postion = @"主教练";
            
            if (model) {
                jsModel.list = @[model];
                [m_array insertObject:jsModel atIndex:0];
            }
            
            
            
             self.dataArray = [NSMutableArray arrayWithArray:m_array];
            if (self.dataArray.count==0) {
                [self.tableView showTopNoData];
            }else {
                [self.tableView hideNoData];
            }
            [self.tableView reloadData];

        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        [self.fatherView endLoading];
    }];
}


- (void)initView {
    self.tableView.separatorInset = UIEdgeInsetsZero;
    self.tableView.separatorColor = COLOR_DDDDDD;
    [self.tableView registerClass:[JCTeamDetailTeamZRCell class] forCellReuseIdentifier:@"JCTeamDetailTeamZRCell"];
}

#pragma mark - Protocol
#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    JCTeamDetailZhenRongInfoModel *model = self.dataArray[section];
    return model.list.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    JCTeamDetailTeamZRCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCTeamDetailTeamZRCell"];
    JCTeamDetailZhenRongInfoModel *infoModel = self.dataArray[indexPath.section];
    JCTeamDetailZhenRongModel *model = infoModel.list[indexPath.row];
    cell.model = model;
    return cell;
}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    JCTeamDetailZhenRongInfoModel *model = self.dataArray[section];
    if (model.list.count>0) {
        return AUTO(44);
    }
    return 0.01f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    JCTeamDetailZhenRongInfoModel *model = self.dataArray[section];
    if (model.list.count>0) {
        JCDataBaseTitleHeadView *headView = [JCDataBaseTitleHeadView new];
        
        headView.lineView.hidden = YES;
        headView.titleLab.text = model.postion;
        
        return headView;
    }
    return [UIView new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    JCTeamDetailZhenRongInfoModel *model = self.dataArray[section];
    if (model.list.count>0) {
        return AUTO(8);
    }
    return 0.01f;
    
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *backView= [UIView new];
    backView.backgroundColor = COLOR_F4F6F9;
    return backView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

@end
