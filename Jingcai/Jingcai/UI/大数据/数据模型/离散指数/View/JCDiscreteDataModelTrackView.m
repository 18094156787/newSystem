//
//  JCDiscreteDataModelTrackView.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/11.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCDiscreteDataModelTrackView.h"

@implementation JCDiscreteDataModelTrackView

- (void)initViews {
    
    self.backgroundColor = [JCBlackColor colorWithAlphaComponent:0.5];
    [self addSubview:self.bgView];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.offset(AUTO(0));
        make.height.mas_equalTo(SCREEN_HEIGHT-kNavigationBarHeight-AUTO(20));
    }];
    
    [self.bgView addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.offset(0);
        make.bottom.offset(-kBottomTabSafeAreaHeight);
    }];
    
    UIButton *closeBtn = [UIButton new];
    [closeBtn setImage:JCIMAGE(@"post_match_close") forState:0];
    [closeBtn setImage:JCIMAGE(@"post_match_close") forState:UIControlStateHighlighted];
    [closeBtn addTarget:self action:@selector(hide) forControlEvents:UIControlEventTouchUpInside];
    [self.bgView addSubview:closeBtn];
    [closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(0);
        make.top.offset(AUTO(5));
        make.width.height.mas_equalTo(AUTO(44));
    }];
}

- (void)show {

    
    self.bgView.transform = CGAffineTransformMakeTranslation(0, SCREEN_HEIGHT);
        WeakSelf;
        [UIView animateWithDuration:0.3f animations:^{
            weakSelf.bgView.transform = CGAffineTransformIdentity;
        }];
    
}

#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section==0) {
        return 1;
    }
    
    return 50;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==0) {
        JCDiscreteDataModelTrackViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCDiscreteDataModelTrackViewCell"];
        cell.trendArray = @[@""];
        return cell;
    }
    JCDiscreteDataModelTrackRateCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCDiscreteDataModelTrackRateCell"];
    return cell;
    
}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section==0) {
            return AUTO(275);
        }
        return AUTO(30);
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section==1) {
        return [JCDiscreteDataModelTrackTitleView new];
    }
    return [UIView new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section==1) {
        return AUTO(40);
    }
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
//        view.scrollEnabled = NO;
        //注册cell
        [view registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
        [view registerClass:[JCDiscreteDataModelTrackViewCell class] forCellReuseIdentifier:@"JCDiscreteDataModelTrackViewCell"];
        [view registerClass:[JCDiscreteDataModelTrackRateCell class] forCellReuseIdentifier:@"JCDiscreteDataModelTrackRateCell"];
        
        
        _tableView = view;

        
    }
    
    return _tableView;
}
- (void)setDataArray:(NSArray *)dataArray {
    _dataArray = dataArray;
    [self.tableView reloadData];
}

- (void)hide {
    WeakSelf;
    [UIView animateWithDuration:0.3f animations:^{
        weakSelf.bgView.transform = CGAffineTransformMakeTranslation(0, SCREEN_HEIGHT);
         
    }];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [weakSelf removeFromSuperview];;
    });
}

-  (UIView *)bgView {
    if (!_bgView) {
        _bgView = [UIView new];
        _bgView.backgroundColor = JCWhiteColor;
        [_bgView hg_setCornerOnTopWithRadius:20];
    }
    return _bgView;
}
@end
