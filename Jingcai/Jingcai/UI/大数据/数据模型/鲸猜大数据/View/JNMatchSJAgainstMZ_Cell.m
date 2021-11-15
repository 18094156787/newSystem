//
//  JNMatchSJAgainstMZ_Cell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/27.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JNMatchSJAgainstMZ_Cell.h"
#import "JCBigDataMingZhongModel.h"
#import "JNMatchSJAgainstZhiShu_RQChartContentCell.h"
@implementation JNMatchSJAgainstMZ_Cell

- (void)initViews {

    [self.contentView addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.top.offset(0);
        make.height.mas_equalTo(AUTO(20*6));
        make.bottom.offset(AUTO(-10));
    }];
    [self.tableView registerClass:[JNMatchSJAgainstZhiShu_RQChartContentCell class] forCellReuseIdentifier:@"JNMatchSJAgainstZhiShu_RQChartContentCell"];
}

#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataArray.count+1;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JNMatchSJAgainstZhiShu_RQChartContentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JNMatchSJAgainstZhiShu_RQChartContentCell"];
    cell.row = indexPath.row;
    if (indexPath.row==0) {
        cell.labelOne.text = @"周期";
        cell.labelTwo.text = @"比分命中";
        cell.labelThree.text = @"带红";
        cell.labelFour.text = @"进球数";
        cell.labelFive.text = @"让球";
        cell.labelOne.backgroundColor = COLOR_F0F0F0;
        cell.labelTwo.backgroundColor = COLOR_F0F0F0;
        cell.labelThree.backgroundColor = COLOR_F0F0F0;
        cell.labelFour.backgroundColor = COLOR_F0F0F0;
        cell.labelFive.backgroundColor = COLOR_F0F0F0;
    }else{
        cell.mzModel = self.dataArray[indexPath.row-1];
        cell.labelOne.backgroundColor = JCClearColor;
        cell.labelTwo.backgroundColor = JCClearColor;
        cell.labelThree.backgroundColor = JCClearColor;
        cell.labelFour.backgroundColor = JCClearColor;
        cell.labelFive.backgroundColor = JCClearColor;
    }

    return cell;
}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return AUTO(20);
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
