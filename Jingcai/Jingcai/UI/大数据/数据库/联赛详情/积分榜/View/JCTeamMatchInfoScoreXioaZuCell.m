//
//  JCTeamMatchInfoScoreXioaZuCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/7.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCTeamMatchInfoScoreXioaZuCell.h"
#import "JCTeamMatchInfoScoreXioaZuHeadView.h"
#import "JCTeamMatchInfoScoreXioaZuInfoCell.h"
#import "JCEventScoreXiaoZuInfoModel.h"
#import "JCEventScoreXiaoZuSelModel.h"
#import "JCTeamDetailWMStickVC.h"
@implementation JCTeamMatchInfoScoreXioaZuCell

- (void)initViews {
    UIView *bgView = [UIView new];
    [self.contentView addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.offset(0);
        make.right.offset(AUTO(-15));
        make.bottom.offset(AUTO(-10));
    }];
    self.bgView = bgView;
    
//    UIView *view = [[UIView alloc] init];
//    view.frame = CGRectMake(16,293.5,343,248);

    bgView.layer.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0].CGColor;
    bgView.layer.cornerRadius = 4;
    bgView.layer.shadowColor = [UIColor colorWithRed:221/255.0 green:221/255.0 blue:221/255.0 alpha:1.0].CGColor;
    bgView.layer.shadowOffset = CGSizeMake(0,0);
    bgView.layer.shadowOpacity = 1;
    bgView.layer.shadowRadius = 4;


    [bgView addSubview:self.tableView];

    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsZero);
    }];
 

    
    [self.tableView registerClass:[JCTeamMatchInfoScoreXioaZuInfoCell class] forCellReuseIdentifier:@"JCTeamMatchInfoScoreXioaZuInfoCell"];
    
}

#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    JCEventScoreXiaoZuInfoModel *model = self.dataArray[section];
    return self.dataArray.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JCTeamMatchInfoScoreXioaZuInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCTeamMatchInfoScoreXioaZuInfoCell"];
    JCEventScoreLianSaiInfoModel *model = self.dataArray[indexPath.row];
    cell.model = model;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return AUTO(64);
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    JCTeamMatchInfoScoreXioaZuHeadView *headView = [JCTeamMatchInfoScoreXioaZuHeadView new];
    if (self.dataArray.count>0) {
        JCEventScoreLianSaiInfoModel *model = self.dataArray.firstObject;
       headView.titleLab.text= model.group;
    }

    return headView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    JCTeamDetailWMStickVC *vc = [JCTeamDetailWMStickVC new];
    JCEventScoreLianSaiInfoModel *model = self.dataArray[indexPath.row];
    vc.team_id = model.team_id;
    [[self getViewController].navigationController pushViewController:vc animated:YES];
    
}


#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return AUTO(35);
}


- (UITableView *)tableView {
    if (!_tableView) {
        
        UITableView *view = [[UITableView alloc] initWithFrame:CGRectZero style:0];
        view.dataSource = self;
        view.delegate = self;
        view.separatorStyle = UITableViewCellSeparatorStyleNone;

        view.showsVerticalScrollIndicator = NO;
        //        view.delaysContentTouches = NO;
        view.estimatedSectionHeaderHeight = 0;
        view.estimatedSectionFooterHeight = 0;
        view.backgroundColor = JCClearColor;
        view.userInteractionEnabled = YES;
        view.scrollEnabled = NO;
        //注册cell
        [view registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
        
        _tableView = view;

        
    }
    
    return _tableView;
}


- (void)setDataArray:(NSArray *)dataArray {
    _dataArray = dataArray;
    [self.tableView reloadData];
}
@end
