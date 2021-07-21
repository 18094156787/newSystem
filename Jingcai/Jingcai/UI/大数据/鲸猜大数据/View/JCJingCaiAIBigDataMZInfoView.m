//
//  JCJingCaiAIBigDataMZInfoView.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/3/15.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCJingCaiAIBigDataMZInfoView.h"
#import "JCBigDataMingZhongModel.h"
#import "JNMatchSJAgainstZhiShu_TopMzChartCell.h"
@implementation JCJingCaiAIBigDataMZInfoView

- (void)initViews {
    
    UIView *topLineView = [UIView new];
    topLineView.backgroundColor = JCBaseColor;
    [self addSubview:topLineView];
    [topLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(14));
        make.left.offset(AUTO(15));
        make.size.mas_equalTo(CGSizeMake(2, 16));
    }];
    
    UILabel *titleLab = [UILabel initWithTitle:@"大数据命中统计" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    [self addSubview:titleLab];
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(topLineView);
        make.left.equalTo(topLineView.mas_right).offset(AUTO(4));
        make.height.mas_equalTo(AUTO(14));
    }];

    [self addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.top.offset(AUTO(40));
        make.height.mas_equalTo(AUTO(20*6));
        make.bottom.offset(AUTO(-10));
    }];
    [self.tableView registerClass:[JNMatchSJAgainstZhiShu_TopMzChartCell class] forCellReuseIdentifier:@"JNMatchSJAgainstZhiShu_TopMzChartCell"];
}

#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataArray.count+1;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JNMatchSJAgainstZhiShu_TopMzChartCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JNMatchSJAgainstZhiShu_TopMzChartCell"];
    cell.row = indexPath.row;
    if (indexPath.row==0) {
        cell.labelOne.text = @"周期";
        cell.labelTwo.text = @"比分命中";
        cell.labelThree.text = @"带红";
        cell.labelFour.text = @"进球数";
        cell.labelFive.text = @"让球";

        cell.labelOne.backgroundColor = [JCBaseColor colorWithAlphaComponent:0.1];
        cell.labelTwo.backgroundColor = [JCBaseColor colorWithAlphaComponent:0.1];
        cell.labelThree.backgroundColor = [JCBaseColor colorWithAlphaComponent:0.1];
        cell.labelFour.backgroundColor = [JCBaseColor colorWithAlphaComponent:0.1];
        cell.labelFive.backgroundColor = [JCBaseColor colorWithAlphaComponent:0.1];
        
        cell.lineOne.backgroundColor = JCWhiteColor;
        cell.lineTwo.backgroundColor = JCWhiteColor;
        cell.lineThree.backgroundColor = JCWhiteColor;
        cell.lineFour.backgroundColor = JCWhiteColor;
    }else{
        cell.mzModel = self.dataArray[indexPath.row-1];
        UIColor *color = indexPath.row%2==0?[JCBaseColor colorWithAlphaComponent:0.05]:JCWhiteColor;
        cell.labelOne.backgroundColor = color;
        cell.labelTwo.backgroundColor = color;
        cell.labelThree.backgroundColor = color;
        cell.labelFour.backgroundColor = color;
        cell.labelFive.backgroundColor = color;
        
        cell.lineOne.backgroundColor = COLOR_F0F0F0;
        cell.lineTwo.backgroundColor = COLOR_F0F0F0;
        cell.lineThree.backgroundColor = COLOR_F0F0F0;
        cell.lineFour.backgroundColor = COLOR_F0F0F0;
    }

    return cell;
}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return AUTO(28);
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
