//
//  JCAiProfitDetailVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/15.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCAiProfitDetailVC.h"
#import "JCAiProfitDetailPieCell.h"
#import "JCJingCaiAIYLModel.h"
@interface JCAiProfitDetailVC ()



@end

@implementation JCAiProfitDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initViews];
}

- (void)initViews {
    self.tableView.separatorInset = UIEdgeInsetsZero;
    self.tableView.separatorColor = COLOR_DDDDDD;
    [self.tableView registerClass:[JCAiProfitDetailPieCell class] forCellReuseIdentifier:@"JCAiProfitDetailPieCell"];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    return 1;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    JCAiProfitDetailPieCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCAiProfitDetailPieCell"];
    cell.model = self.dataArray[indexPath.section];
    return cell;
}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return AUTO(200);
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return AUTO(8);
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headView = [UIView new];
    headView.backgroundColor = COLOR_F0F0F0;
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
    self.dataArray = [NSMutableArray array];
    for (int i=0; i<dataSource.count; i++) {
        JCJingCaiAIYLModel *model = dataSource[i];
        if (i<2) {
            [self.dataArray addObject:model];
        }else{
            if ([model.yl floatValue]>0) {
                [self.dataArray addObject:model];
            }
        }
    }
    [self.tableView reloadData];
}
@end
