//
//  JCBasketMatchDetailTeamScoreCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/5.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBasketMatchDetailTeamScoreCell.h"
#import "JCBasketMatchDetailTeamHeadView.h"
#import "JCBasketMatchDetailTeamScoreContentCell.h"
@implementation JCBasketMatchDetailTeamScoreCell

- (void)initViews {
    UIView *bgView = [UIView new];
    [self addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.offset(AUTO(10));
        make.right.offset(AUTO(-15));
        make.bottom.offset(AUTO(-10));
    }];
    self.bgView = bgView;


    [bgView addSubview:self.tableView];

    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsZero);
    }];
 

    
    [self.tableView registerClass:[JCBasketMatchDetailTeamScoreContentCell class] forCellReuseIdentifier:@"JCBasketMatchDetailTeamScoreContentCell"];
    
}

#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 2;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JCBasketMatchDetailTeamScoreContentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCBasketMatchDetailTeamScoreContentCell"];
    if (indexPath.row==0) {
        cell.homeFormModel = self.formModel;
    }
    if (indexPath.row==1) {
        cell.awayFormModel = self.formModel;
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return AUTO(20);
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    JCBasketMatchDetailTeamHeadView *headView = [JCBasketMatchDetailTeamHeadView new];
    return headView;
}


#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return AUTO(32);
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
- (void)setFormModel:(JCBasketMatchDetailZBFormModel *)formModel {
    _formModel = formModel;
    [self.tableView reloadData];
}

@end
