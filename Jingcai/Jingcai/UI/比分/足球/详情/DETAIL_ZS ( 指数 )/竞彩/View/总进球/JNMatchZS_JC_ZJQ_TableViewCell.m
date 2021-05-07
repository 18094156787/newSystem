//
//  JNMatchZS_JC_ZJQ_TableViewCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/8.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JNMatchZS_JC_ZJQ_TableViewCell.h"
#import "JNMatchZS_JC_ZJQ_TimeHeadView.h"
#import "JNMatchZS_JC_ZJQ_titleCell.h"
@implementation JNMatchZS_JC_ZJQ_TableViewCell

- (void)initViews {
    UIView *bgView = [UIView new];
    [self addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.offset(0);
        make.right.offset(AUTO(-15));
        make.bottom.offset(AUTO(-10));
    }];
    self.bgView = bgView;


    [bgView addSubview:self.tableView];

    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsZero);
    }];
 

    
    [self.tableView registerClass:[JNMatchZS_JC_ZJQ_titleCell class] forCellReuseIdentifier:@"JNMatchZS_JC_ZJQ_titleCell"];
    
    
}

#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row==0) {
        JNMatchZS_JC_ZJQ_titleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JNMatchZS_JC_ZJQ_titleCell"];
        if (self.dataArray.count>0) {
            cell.model= self.dataArray.firstObject;
        }
        return cell;
    }
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];


//    cell.model = self.dataArray[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return AUTO(20);
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    JNMatchZS_JC_ZJQ_TimeHeadView *headView = [JNMatchZS_JC_ZJQ_TimeHeadView new];
    if (self.dataArray.count>0) {
        JNMatchJQBall *model = self.dataArray.firstObject;
        headView.timeLab.text = [NSString stringWithFormat:@"发布时间：%@",model.created_desc];
    }
    
    return headView;
}


#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return AUTO(44);
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
