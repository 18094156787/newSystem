//
//  JCTeamMatchInfoScoreLianSaiCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/7.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCTeamMatchInfoScoreLianSaiCell.h"
#import "JCTeamMatchInfoScoreLianSaiHeadView.h"
#import "JCTeamMatchInfoScoreLianSaiInfoCell.h"
#import "JCEventScoreLianSaiInfoModel.h"
#import "JCTeamDetailWMStickVC.h"
@implementation JCTeamMatchInfoScoreLianSaiCell



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


    self.tableView.separatorStyle = 0;
    [bgView addSubview:self.tableView];

    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsZero);
    }];
 

//    UILabel *groupLab = [UILabel initWithTitle:@"欧罗巴联赛小组赛" andFont:AUTO(10) andWeight:1 andTextColor:JCWhiteColor andBackgroundColor:JCBaseColor andTextAlignment:NSTextAlignmentCenter];
//    groupLab.frame = CGRectMake(0, 26, 100, 16);
//    [self.tableView addSubview:groupLab];
    
    [self.tableView registerClass:[JCTeamMatchInfoScoreLianSaiInfoCell class] forCellReuseIdentifier:@"JCTeamMatchInfoScoreLianSaiInfoCell"];
    
}

#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.dataArray.count>0) {
        return self.dataArray.count+1;
    }
    return 0;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.dataArray.count>0&&indexPath.row==0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
        cell.clipsToBounds =NO;
        cell.contentView.clipsToBounds =NO;
        cell.layer.zPosition= indexPath.row;
        return cell;
    }
    JCTeamMatchInfoScoreLianSaiInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCTeamMatchInfoScoreLianSaiInfoCell"];
    cell.clipsToBounds =NO;
    cell.contentView.clipsToBounds =NO;
    cell.layer.zPosition= indexPath.row;
    if (indexPath.row==0) {
        cell.layer.zPosition= 999+indexPath.row;
    }
    JCEventScoreLianSaiInfoModel *model = self.dataArray[indexPath.row-1];
    cell.model = model;

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (self.showTop) {
        return AUTO(32)*2;
    }
    return AUTO(32);
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    JCTeamMatchInfoScoreLianSaiHeadView *headView = [JCTeamMatchInfoScoreLianSaiHeadView new];
    if (self.dataArray.count>0&&self.showTop) {
        JCEventScoreLianSaiInfoModel *model = self.dataArray.firstObject;
       headView.titleLab.text= model.group;
        headView.showTop = self.showTop;
    }
    
    return headView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.dataArray.count>0&&indexPath.row>0) {
        JCEventScoreLianSaiInfoModel *model = self.dataArray[indexPath.row-1];
        JCTeamDetailWMStickVC *vc = [JCTeamDetailWMStickVC new];
        vc.team_id = model.team_id;
        [[self getViewController].navigationController pushViewController:vc animated:YES];

    }
}


#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.dataArray.count>0&&indexPath.row==0) {
        return AUTO(8);
    }
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
