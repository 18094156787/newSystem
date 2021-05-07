//
//  JCYCFriendCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/3/30.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCYCFriendCell.h"
#import "JCYCFriendUserCell.h"
#import "JCYCFriendUserTopView.h"
#import "JCInviteCodeInfoModel.h"
@implementation JCYCFriendCell

- (void)initViews {
    UIView *bgView = [UIView new];
    bgView.backgroundColor = COLOR_FFF4E5;
    [self.contentView addSubview:bgView];
    [bgView hg_setAllCornerWithCornerRadius:AUTO(8)];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(AUTO(15), AUTO(12), 0, AUTO(12)));
    }];
    
    self.tableView.backgroundColor = JCClearColor;
    self.tableView.separatorColor = [COLOR_F2F2F2 colorWithAlphaComponent:0.1];
    [self.tableView registerClass:[JCYCFriendUserCell class] forCellReuseIdentifier:@"JCYCFriendUserCell"];
    [bgView addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(0, 0, 0, 0));
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
    
    JCYCFriendUserCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCYCFriendUserCell"];
    cell.backgroundColor = JCClearColor;
    JCInviteCodeInfoModel *model = self.dataArray[indexPath.row];
    cell.model = model;
    return cell;
}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return AUTO(50);
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return AUTO(50);
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    JCYCFriendUserTopView *headView = [JCYCFriendUserTopView new];
    headView.imgView.image = JCIMAGE(@"icon_jc_invitefriend");
    headView.titleLab.text = @"邀请记录";
    return headView;
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

- (UITableView *)tableView {
    if (!_tableView) {
        UITableView *view = [[UITableView alloc] initWithFrame:CGRectZero style:1];
        view.dataSource = self;
        view.delegate = self;
        //        view.separatorStyle = UITableViewCellSeparatorStyleNone;
        //view.separatorColor = COLOR_SEPRATE;
        view.separatorInset = UIEdgeInsetsMake(0.0f, 15, 0.0f, 0.0f);
        view.showsVerticalScrollIndicator = NO;
        //        view.delaysContentTouches = NO;
        view.estimatedSectionHeaderHeight = 0;
        view.estimatedSectionFooterHeight = 0;
        view.backgroundColor = JCClearColor;
        view.tableFooterView = [UIView new];
        view.scrollEnabled = NO;
        //注册cell
        [view registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
        
        _tableView = view;

        
    }
    
    return _tableView;
}
@end
