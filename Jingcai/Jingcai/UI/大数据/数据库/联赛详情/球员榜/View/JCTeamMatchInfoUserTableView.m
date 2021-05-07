//
//  JCTeamMatchInfoUserTableView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/7.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCTeamMatchInfoUserTableView.h"
#import "JCTeamMatchInfoUserTableViewCell.h"
#import "JCEventScorePlayerModel.h"
@implementation JCTeamMatchInfoUserTableView

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
 

    
    [self.tableView registerClass:[JCTeamMatchInfoUserTableViewCell class] forCellReuseIdentifier:@"JCTeamMatchInfoUserTableViewCell"];
    
}

#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataArray.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JCTeamMatchInfoUserTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCTeamMatchInfoUserTableViewCell"];
    cell.rankLab.text = [NSString stringWithFormat:@"%ld",indexPath.row+1];
    cell.model = self.dataArray[indexPath.row];
    return cell;
}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return AUTO(40);
}


- (UITableView *)tableView {
    if (!_tableView) {
        
        UITableView *view = [[UITableView alloc] initWithFrame:CGRectZero style:0];
        view.dataSource = self;
        view.delegate = self;
        view.separatorStyle = UITableViewCellSeparatorStyleNone;
        view.separatorColor = COLOR_F0F0F0;
        view.separatorInset = UIEdgeInsetsZero;
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

//    UIView *headView = [UIView new];
//    headView.frame = CGRectMake(0, 0, self.bounds.size.width, 200);
    if (dataArray.count==0) {
//        [headView showNoData];
        [self.tableView showTopNoData];
//        self.tableView.tableHeaderView = headView;
    }else{
        [self.tableView hideNoData];
//        self.tableView.tableHeaderView = nil;
    }
    
     self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.tableView reloadData];
}

@end
