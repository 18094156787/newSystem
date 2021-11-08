//
//  JCPlaneDetailNewMatchCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/12/18.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCPlaneDetailNewMatchCell.h"
#import "JCPlaneDetailMatch_JZCell.h"
#import "JCPlaneDetailMatch_JQSCell.h"
#import "JCPlaneDetailMatch_CustomCell.h"
#import "JCPlaneDetailMatch_ZFSCell.h"
#import "JCPlaneDetailMatch_RQCell.h"
@implementation JCPlaneDetailNewMatchCell

- (void)initViews{
    self.backgroundColor = JCWhiteColor;
    UIView *bgView = [UIView new];
    bgView.backgroundColor = JCWhiteColor;
    [self.contentView addSubview:bgView];
//    [bgView hg_setAllCornerWithCornerRadius:4];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
       make.edges.insets(UIEdgeInsetsMake(AUTO(10), AUTO(15), AUTO(10), AUTO(15)));
    }];
    
//    bgView.frame = CGRectMake(15, 15, SCREEN_WIDTH-30, 270);
    
    bgView.layer.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0].CGColor;
    bgView.layer.cornerRadius = 5;
    bgView.layer.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.1].CGColor;
    bgView.layer.shadowOffset = CGSizeMake(0,2);
    bgView.layer.shadowOpacity = 1;
    bgView.layer.shadowRadius = 8;
//    bgView.layer.masksToBounds = YES;
    
    [bgView addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(5, 5, 5, 5));
    }];
    
    
    [self.tableView registerClass:[JCPlaneDetailMatch_JZCell class] forCellReuseIdentifier:@"JCPlaneDetailMatch_JZCell"];
    [self.tableView registerClass:[JCPlaneDetailMatch_JQSCell class] forCellReuseIdentifier:@"JCPlaneDetailMatch_JQSCell"];
    [self.tableView registerClass:[JCPlaneDetailMatch_CustomCell class] forCellReuseIdentifier:@"JCPlaneDetailMatch_CustomCell"];
    [self.tableView registerClass:[JCPlaneDetailMatch_ZFSCell class] forCellReuseIdentifier:@"JCPlaneDetailMatch_ZFSCell"];
    [self.tableView registerClass:[JCPlaneDetailMatch_RQCell class] forCellReuseIdentifier:@"JCPlaneDetailMatch_RQCell"];
    
    
    
}

#pragma mark <UITableViewDelegate>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tjModel.match_info.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    if (indexPath.row==0) {
//        return AUTO(155);
//    }
//    return AUTO(120);
    JCWVerTjInfoMatchBall *matchModel = self.tjModel.match_info[indexPath.row];
    if (matchModel.classfly==4) {
        return AUTO(155);
    }
    if (matchModel.classfly==2||matchModel.classfly==102) {
        return AUTO(155);
    }
    return AUTO(120);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    JCWVerTjInfoMatchBall *matchModel = self.tjModel.match_info[indexPath.row];
    if(matchModel.classfly==2||matchModel.classfly==102)
   {
       JCPlaneDetailMatch_RQCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCPlaneDetailMatch_RQCell"];
       cell.matchModel = matchModel;
       return cell;
       
   }
    if(matchModel.classfly==4)
   {
       JCPlaneDetailMatch_JZCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCPlaneDetailMatch_JZCell"];
       cell.matchModel = matchModel;
       return cell;
       
   }
    if (matchModel.classfly==1||matchModel.classfly==3||matchModel.classfly==103) {
       JCPlaneDetailMatch_JQSCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCPlaneDetailMatch_JQSCell"];
       cell.matchModel = matchModel;
       return cell;
    }
    if (matchModel.classfly==101) {
        JCPlaneDetailMatch_ZFSCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCPlaneDetailMatch_ZFSCell"];
        cell.matchModel = matchModel;
        return cell;
    }
    
    
    JCPlaneDetailMatch_CustomCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCPlaneDetailMatch_CustomCell"];
   cell.matchModel = matchModel;
   return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

}


- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:0];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.separatorInset = UIEdgeInsetsMake(0.0f, 10, 0.0f, 10);
        _tableView.separatorColor = COLOR_DBDBDB;
        _tableView.showsVerticalScrollIndicator = NO;
        //        view.delaysContentTouches = NO;
        _tableView.estimatedSectionHeaderHeight = 0;
        _tableView.estimatedSectionFooterHeight = 0;
        _tableView.backgroundColor = JCWhiteColor;
        _tableView.tableFooterView = [UIView new];
        _tableView.estimatedRowHeight = 50;
//        _tableView.separatorStyle = 0;
        _tableView.scrollEnabled = NO;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
        
    }
    
    return _tableView;
}

- (void)setTjModel:(JCGZHTuiJianModel *)tjModel {
    _tjModel = tjModel;
    [self.tableView reloadData];
}


@end
