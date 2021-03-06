//
//  JCTransactionDataModelDetailSameMatchCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/12.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCTransactionDataModelDetailSameMatchCell.h"

@implementation JCTransactionDataModelDetailSameMatchCell


- (void)initViews {
    [self.contentView addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.top.offset(0);
        make.height.mas_equalTo(AUTO(100));
    }];
    [self.tableView registerClass:[JNMatchSJAgainstTeam_HistoryBattleContentCell class] forCellReuseIdentifier:@"JNMatchSJAgainstTeam_HistoryBattleContentCell"];
    
//    self.headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, AUTO(30));
//    self.tableView.tableHeaderView = self.headView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (self.dataArray.count>0) {
        return 1;
    }
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 3;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JNMatchSJAgainstTeam_HistoryBattleContentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JNMatchSJAgainstTeam_HistoryBattleContentCell"];
    cell.row = indexPath.row;
    if (indexPath.row==0) {
        cell.labelOne.backgroundColor = [COLOR_EF2F2F colorWithAlphaComponent:0.08];
        cell.labelTwo.backgroundColor = [COLOR_EF2F2F colorWithAlphaComponent:0.08];
        cell.labelThree.backgroundColor = [COLOR_EF2F2F colorWithAlphaComponent:0.08];
        cell.labelFour.backgroundColor = [COLOR_EF2F2F colorWithAlphaComponent:0.08];

        cell.labelOne.text = @"赛果";
        cell.labelTwo.text = @"胜";
        cell.labelThree.text = @"平";
        cell.labelFour.text = @"负";
        if ([self.type integerValue]!=1) {
            cell.labelThree.text = @"平(走水)";
        }



        
    }else{
        JCHistoryPayDataModel *model = self.dataArray.firstObject;
        if (indexPath.row==1) {
            cell.labelOne.text = @"场次";
            cell.labelTwo.text = model.last_count.won;
            cell.labelThree.text = model.last_count.draw;
            cell.labelFour.text = model.last_count.loss;

        }
        if (indexPath.row==2) {
            cell.labelOne.text = @"占比";
            cell.labelTwo.text = [NSString stringWithFormat:@"%@%%",model.last_rate.won];
            cell.labelThree.text = [NSString stringWithFormat:@"%@%%",model.last_rate.draw];
            cell.labelFour.text = [NSString stringWithFormat:@"%@%%",model.last_rate.loss];

        }
//        JCBigDataAnalysisMatchModel *model = self.model.match[indexPath.row-1];
//        cell.model = model;
        cell.labelOne.backgroundColor = JCWhiteColor;
        cell.labelTwo.backgroundColor = JCWhiteColor;
        cell.labelThree.backgroundColor = JCWhiteColor;
        cell.labelFour.backgroundColor = JCWhiteColor;
        
//        cell.labelOne.text = @"赛果";
//        cell.labelTwo.text = @"胜";
//        cell.labelThree.text = @"平";
//        cell.labelFour.text = @"负";

    }

    return cell;
}
#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return AUTO(30);
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01f;
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



- (void)setDataArray:(NSArray *)dataArray {
    _dataArray = dataArray;
    [self.tableView reloadData];
}

@end
