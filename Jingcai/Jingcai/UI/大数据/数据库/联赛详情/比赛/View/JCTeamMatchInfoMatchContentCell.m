//
//  JCTeamMatchInfoMatchContentCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/7.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCTeamMatchInfoMatchContentCell.h"
#import "JCTeamMatchInfoMatchCell.h"
#import "JCMatchDetailWMStickVC.h"
@implementation JCTeamMatchInfoMatchContentCell
- (void)initViews {
    UIView *bgView = [UIView new];
    [self.contentView addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.offset(0);
        make.right.offset(AUTO(-15));
        make.bottom.offset(0);
    }];
    self.bgView = bgView;
    
//    UIView *view = [[UIView alloc] init];
//    view.frame = CGRectMake(16,293.5,343,248);

    bgView.layer.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0].CGColor;
    bgView.layer.cornerRadius = 4;
    bgView.layer.shadowColor = [UIColor colorWithRed:221/255.0 green:221/255.0 blue:221/255.0 alpha:1.0].CGColor;
    bgView.layer.shadowOffset = CGSizeMake(0,0);
    bgView.layer.shadowOpacity = 1;
    bgView.layer.shadowRadius = 4;
    
//    UIImageView *imgView = [UIImageView new];
//    imgView.image = JCIMAGE(@"jc_yc_newTitle");
//    [bgView addSubview:imgView];
//    [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.offset(AUTO(155));
//        make.centerX.equalTo(bgView);
//        make.size.mas_equalTo(CGSizeMake(AUTO(171), AUTO(39)));
//    }];
//

    [bgView addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsZero);
    }];
    
    [self.tableView registerClass:[JCTeamMatchInfoMatchCell class] forCellReuseIdentifier:@"JCTeamMatchInfoMatchCell"];
    
}

#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    

    return self.dataArray.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JCTeamMatchInfoMatchCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCTeamMatchInfoMatchCell"];
    cell.isCircle = indexPath.row==(self.dataArray.count-1)?NO:YES;
    cell.model = self.dataArray[indexPath.row];
    return cell;
}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return AUTO(75);
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    JCMatchDetailWMStickVC * detailVC = [JCMatchDetailWMStickVC new];//JNMatchDetailVC
    JCTeamMatchModel *model = self.dataArray[indexPath.row];
    detailVC.matchNum = model.match_id;
    [[self getViewController].navigationController pushViewController:detailVC animated:YES];
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
        view.userInteractionEnabled = YES;
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
