//
//  JCTransactionDataModelDetailDataCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/12.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCTransactionDataModelDetailDataCell.h"

@implementation JCTransactionDataModelDetailDataCell

- (void)initViews {
    [self.contentView addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.right.offset(0);
        make.top.bottom.offset(0);
//        make.height.mas_equalTo(AUTO(100));
    }];
    [self.tableView registerClass:[JCTransactionDataModelDetailDataInfoCell class] forCellReuseIdentifier:@"JCTransactionDataModelDetailDataInfoCell"];
    

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"个数%ld",self.detailModel.odds_change_list.count);
    return self.detailModel.odds_change_list.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JCTransactionDataModelDetailDataInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCTransactionDataModelDetailDataInfoCell"];
    cell.type = self.type;
    cell.model = self.detailModel.odds_change_list[indexPath.row];
    return cell;
}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return AUTO(35);
}


- (void)setDetailModel:(JCKellyDataDetailModel *)detailModel {
    _detailModel = detailModel;
   
    if (self.detailModel.compare_odds.count>0) {
        self.headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, AUTO(30));
        self.tableView.tableHeaderView = self.headView;
        self.headView.type = self.type;
        self.headView.detailModel = detailModel;
    }
    [self.tableView reloadData];
}


- (UITableView *)tableView {
    if (!_tableView) {
        
        UITableView *view = [[UITableView alloc] initWithFrame:CGRectZero style:1];
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

- (JCTransactionDataModelDetailDataInfoHeadView *)headView {
    if (!_headView) {
        _headView = [JCTransactionDataModelDetailDataInfoHeadView new];
    }
    return _headView;
}

//- (void)setDataArray:(NSArray *)dataArray {
//    _dataArray = dataArray;
//    [self.tableView reloadData];
//}
@end
