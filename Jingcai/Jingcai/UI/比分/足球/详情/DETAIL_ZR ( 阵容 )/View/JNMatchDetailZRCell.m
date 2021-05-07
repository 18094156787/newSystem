//
//  JNMatchDetailZRCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/11/19.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JNMatchDetailZRCell.h"
#import "JNMatchDetailZRUserCell.h"
@implementation JNMatchDetailZRCell

- (void)initViews{
    self.backgroundColor = JCWhiteColor;
    UIView *bgView = [UIView new];
    bgView.backgroundColor = JCWhiteColor;
    [self.contentView addSubview:bgView];
    [bgView hg_setAllCornerWithCornerRadius:4];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
       make.edges.insets(UIEdgeInsetsMake(0, AUTO(15), 0, AUTO(15)));
    }];
    
    [bgView addSubview:self.homeTableView];
    [self.homeTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.equalTo(bgView);
        make.right.equalTo(bgView.mas_centerX);
    }];
    
    [bgView addSubview:self.awayTableView];
    [self.awayTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.bottom.equalTo(bgView);
        make.left.equalTo(bgView.mas_centerX);
    }];


}

#pragma mark <UITableViewDelegate>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return tableView == self.homeTableView ? self.homeArr.count : self.awayArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return AUTO(40);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JNMatchDetailZRUserCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JNMatchDetailZRUserCell"];
     cell.lineupBall = tableView == self.homeTableView ? self.homeArr[indexPath.item] : self.awayArr[indexPath.item];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

}
- (void)setHomeArr:(NSArray *)homeArr {
    _homeArr = homeArr;
    [self.homeTableView reloadData];

}
- (void)setAwayArr:(NSArray *)awayArr {
    _awayArr = awayArr;
    [self.awayTableView reloadData];

}

- (void)setMatchBall:(JCMatchBall *)matchBall {
    _matchBall = matchBall;

    self.homeHeadView.titleLab.text = NonNil(matchBall.home_team.name_zh);
    self.awayHeadView.titleLab.text = NonNil(matchBall.away_team.name_zh);
    if (self.homeArr.count>0&&self.awayArr.count>0) {
        self.homeHeadView.frame = CGRectMake(0, 0, SCREEN_WIDTH, AUTO(45));
        self.homeTableView.tableHeaderView= self.homeHeadView;
        
        self.awayHeadView.frame = CGRectMake(0, 0, SCREEN_WIDTH, AUTO(45));
        self.awayTableView.tableHeaderView= self.awayHeadView;
    }
}

- (UITableView *)homeTableView {
    if (!_homeTableView) {
        _homeTableView = [[UITableView alloc] initWithFrame:CGRectZero style:0];
        _homeTableView.dataSource = self;
        _homeTableView.delegate = self;
        _homeTableView.separatorInset = UIEdgeInsetsMake(0.0f, 5, 0.0f, AUTO(10));
        _homeTableView.separatorColor = COLOR_DDDDDD;
        _homeTableView.showsVerticalScrollIndicator = NO;
        //        view.delaysContentTouches = NO;
        _homeTableView.estimatedSectionHeaderHeight = 0;
        _homeTableView.estimatedSectionFooterHeight = 0;
        _homeTableView.backgroundColor = JCWhiteColor;
        _homeTableView.tableFooterView = [UIView new];
        _homeTableView.estimatedRowHeight = 50;
        _homeTableView.separatorStyle = 0;
        _homeTableView.scrollEnabled = NO;
        [_homeTableView registerClass:[JNMatchDetailZRUserCell class] forCellReuseIdentifier:@"JNMatchDetailZRUserCell"];
        
    }
    
    return _homeTableView;
}

- (UITableView *)awayTableView {
    if (!_awayTableView) {
        _awayTableView = [[UITableView alloc] initWithFrame:CGRectZero style:0];
        _awayTableView.dataSource = self;
        _awayTableView.delegate = self;
        _awayTableView.separatorInset = UIEdgeInsetsMake(0.0f, 5, 0.0f, AUTO(10));
        _awayTableView.separatorColor = COLOR_DDDDDD;
        _awayTableView.showsVerticalScrollIndicator = NO;
        //        view.delaysContentTouches = NO;
        _awayTableView.estimatedSectionHeaderHeight = 0;
        _awayTableView.estimatedSectionFooterHeight = 0;
        _awayTableView.backgroundColor = JCWhiteColor;
        _awayTableView.tableFooterView = [UIView new];
        _awayTableView.estimatedRowHeight = 50;
        _awayTableView.separatorStyle = 0;
        _awayTableView.scrollEnabled = NO;
        [_awayTableView registerClass:[JNMatchDetailZRUserCell class] forCellReuseIdentifier:@"JNMatchDetailZRUserCell"];
        
    }
    
    return _awayTableView;
}

- (JNMatchDetailZRTeamHeadView *)homeHeadView {
    if (!_homeHeadView) {
        _homeHeadView = [JNMatchDetailZRTeamHeadView new];
    }
    return _homeHeadView;
}

- (JNMatchDetailZRTeamHeadView *)awayHeadView {
    if (!_awayHeadView) {
        _awayHeadView = [JNMatchDetailZRTeamHeadView new];
    }
    return _awayHeadView;
}

@end
