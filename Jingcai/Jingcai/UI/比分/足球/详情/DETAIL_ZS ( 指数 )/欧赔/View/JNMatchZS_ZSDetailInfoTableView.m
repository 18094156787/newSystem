//
//  JNMatchZS_ZSDetailInfoTableView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/12.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JNMatchZS_ZSDetailInfoTableView.h"
#import "JNMatchZS_ZSDetailInfoTableViewCell.h"
@implementation JNMatchZS_ZSDetailInfoTableView

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
 

    
    [self.tableView registerClass:[JNMatchZS_ZSDetailInfoTableViewCell class] forCellReuseIdentifier:@"JNMatchZS_ZSDetailInfoTableViewCell"];
    
}

#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataSource.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JNMatchZS_ZSDetailInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JNMatchZS_ZSDetailInfoTableViewCell"];
    cell.model = self.dataSource[indexPath.row];
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
        view.separatorInset = UIEdgeInsetsZero;
        view.separatorColor = COLOR_DDDDDD;
//        view.separatorStyle = 1;

        view.showsVerticalScrollIndicator = NO;
        //        view.delaysContentTouches = NO;
        view.estimatedSectionHeaderHeight = 0;
        view.estimatedSectionFooterHeight = 0;
        view.backgroundColor = JCClearColor;
        view.tableFooterView = [UIView new];
//        view.scrollEnabled = NO;
        //注册cell
        [view registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
        
        _tableView = view;

        
    }
    
    return _tableView;
}
- (void)setDataArray:(NSArray *)dataArray {
    _dataArray = dataArray;
    

    NSArray *resultArr = [[dataArray reverseObjectEnumerator] allObjects];
    if (resultArr.count>0) {
        self.currentModel = resultArr.firstObject;
        for (int i=1; i<resultArr.count; i++) {
            JNMatchZS_PLInfoModel *model = resultArr[i];
            if ([model.home_winner floatValue]==[self.currentModel.home_winner floatValue]) {
                model.win_color = @"#333333";
            }else if([model.home_winner floatValue]>[self.currentModel.home_winner floatValue]){
                model.win_color = @"#C82525";
            }else {
                model.win_color = @"#13AE13";//
            }
            if ([model.draw floatValue]==[self.currentModel.draw floatValue]) {
                model.equal_color = @"#333333";
            }else if([model.draw floatValue]>[self.currentModel.draw floatValue]){
                model.equal_color = @"#C82525";
            }else {
                model.equal_color = @"#13AE13";//
            }
            
            if ([model.away_winner floatValue]==[self.currentModel.away_winner floatValue]) {
                model.lose_color = @"#333333";
            }else if([model.away_winner floatValue]>[self.currentModel.away_winner floatValue]){
                model.lose_color = @"#C82525";
            }else {
                model.lose_color = @"#13AE13";//
            }
            self.currentModel = model;
            

        }
    }
    self.dataSource =  [[resultArr reverseObjectEnumerator] allObjects];

    [self.tableView reloadData];
}

@end
