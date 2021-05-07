//
//  JCTeamDetailPlayerTableView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/23.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCTeamDetailPlayerTableView.h"
#import "JCTeamDetailPlayerCell.h"
#import "JCTeamDetailWMStickVC.h"
@implementation JCTeamDetailPlayerTableView

- (void)initViews {
    UIView *bgView = [UIView new];
    [self addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsZero);
    }];
    self.bgView = bgView;
    


    [bgView addSubview:self.tableView];

    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsZero);
    }];
 

    
    [self.tableView registerClass:[JCTeamDetailPlayerCell class] forCellReuseIdentifier:@"JCTeamDetailPlayerCell"];
    
}

#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataArray.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JCTeamDetailPlayerCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCTeamDetailPlayerCell"];
    cell.rankLab.text = [NSString stringWithFormat:@"%ld",indexPath.row+1];
    cell.model = self.dataArray[indexPath.row];
    return cell;
}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return AUTO(40);
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    JCTeamDetailWMStickVC *vc = [JCTeamDetailWMStickVC new];
//    JCEventScorePlayerModel *model = self.dataArray[indexPath.row];
//    vc.team_id = model.team_id;
//    [[self getViewController].navigationController pushViewController:vc animated:YES];
}


- (UITableView *)tableView {
    if (!_tableView) {
        
        UITableView *view = [[UITableView alloc] initWithFrame:CGRectZero style:0];
        view.dataSource = self;
        view.delegate = self;
        view.separatorStyle = UITableViewCellSeparatorStyleNone;
        view.separatorInset = UIEdgeInsetsZero;
        view.separatorColor = COLOR_F0F0F0;
        view.showsVerticalScrollIndicator = NO;
        //        view.delaysContentTouches = NO;
        view.estimatedSectionHeaderHeight = 0;
        view.estimatedSectionFooterHeight = 0;
        view.backgroundColor = JCClearColor;
        view.scrollEnabled = YES;
        view.tableFooterView = [UIView new];
        //注册cell
        [view registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
        
        _tableView = view;

        
    }
    
    return _tableView;
}
- (void)setDataArray:(NSArray *)dataArray {
    _dataArray = dataArray;
    if (dataArray.count==0) {
        [self.tableView showTopNoData];
    }else {
        [self.tableView hideNoData];
    }
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.tableView reloadData];
}

@end
