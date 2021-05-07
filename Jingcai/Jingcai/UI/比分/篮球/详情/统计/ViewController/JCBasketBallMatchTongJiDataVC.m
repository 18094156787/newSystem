//
//  JCBasketBallMatchTongJiDataVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/5.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBasketBallMatchTongJiDataVC.h"
#import "JCBasketBallMatchTongJiDataHeadView.h"
#import "JCBasketBallMatchTongJiDataCell.h"
@interface JCBasketBallMatchTongJiDataVC ()

@end

@implementation JCBasketBallMatchTongJiDataVC

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)initSubViews {
    self.tableView.separatorStyle = 0;
    [self.tableView registerClass:[JCBasketBallMatchTongJiDataCell class] forCellReuseIdentifier:@"JCBasketBallMatchTongJiDataCell"];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    return self.dataSource.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    JCBasketBallMatchTongJiDataCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCBasketBallMatchTongJiDataCell"];
    cell.model = self.dataSource[indexPath.row];
    return cell;
}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return AUTO(44);
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return AUTO(40);
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    JCBasketBallMatchTongJiDataHeadView *headView = [JCBasketBallMatchTongJiDataHeadView new];
    headView.matchBall = self.matchBall;
    return headView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.0001;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *backView= [UIView new];
    return backView;
}

- (void)setDataSource:(NSArray *)dataSource {
    _dataSource = dataSource;
    if (dataSource.count==0) {
        [self.view showTopNoData];
    }else{
        [self.view hideNoData];
    }
    [self.tableView reloadData];
}

@end
