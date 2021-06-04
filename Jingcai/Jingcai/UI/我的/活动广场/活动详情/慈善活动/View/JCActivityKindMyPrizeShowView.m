//
//  JCActivityKindMyPrizeShowView.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/6/4.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCActivityKindMyPrizeShowView.h"

@implementation JCActivityKindMyPrizeShowView

- (void)initViews {
    

    self.backgroundColor = [JCBlackColor colorWithAlphaComponent:0.5];
    UIView *bgView = [UIView new];
    [bgView hg_setCornerOnTopWithRadius:AUTO(15)];
    bgView.backgroundColor = JCWhiteColor;
    [self addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self);
        make.height.mas_equalTo(442);
    }];
    self.bgView = bgView;
    
    UIView *bgView1 = [UIView new];
    bgView1.backgroundColor = JCClearColor;
    [self addSubview:bgView1];
    [bgView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self);
        make.bottom.equalTo(bgView.mas_top);
    }];
    
    UILabel *titleLab = [UILabel initWithTitle:@"我的奖励" andFont:AUTO(15) andWeight:2 andTextColor:COLOR_FB5835 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
//    titleLab.font = [UIFont boldSystemFontOfSize:AUTO(15)];
    [bgView addSubview:titleLab];
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(15));
        make.centerX.equalTo(self);
        make.height.mas_equalTo(AUTO(20));
    }];
    
    UIButton *closeBtn = [UIButton new];
    [closeBtn setImage:JCIMAGE(@"post_match_close") forState:0];
    [closeBtn setImage:JCIMAGE(@"post_match_close") forState:UIControlStateHighlighted];
    [bgView addSubview:closeBtn];
    [closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-15));
        make.centerY.equalTo(titleLab);
        make.width.height.mas_equalTo(AUTO(40));
    }];
    
    
    self.tableView.estimatedRowHeight = 100;
    [bgView addSubview:self.tableView];
     
     [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.offset(50);
         make.left.right.equalTo(bgView);
         //        make.bottom.equalTo(self.view).offset(-kTabBarHeight);
         if (@available(iOS 11.0, *)) {
             make.bottom.equalTo(self.mas_safeAreaLayoutGuideBottom);
         } else {
             make.bottom.equalTo(self);
             // Fallback on earlier versions
         }
     }];
    
    
    WeakSelf;
    [closeBtn bk_whenTapped:^{
        [weakSelf removeFromSuperview];
    }];
    
    [bgView1 bk_whenTapped:^{
        [weakSelf removeFromSuperview];
    }];
//    self.tableView.mj_header = [MJRefreshHeader headerWithRefreshingBlock:^{
//        
//    }];
//    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
////        [weakSelf getDataList];
//    }];
//    [self show];
}


- (void)show {
      self.bgView.transform = CGAffineTransformMakeTranslation(0, SCREEN_HEIGHT);
    WeakSelf;
    [UIView animateWithDuration:0.3f animations:^{
        weakSelf.bgView.transform = CGAffineTransformIdentity;

    }];
}

#pragma mark - Protocol
#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    JCActivityPrizeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCActivityPrizeTableViewCell"];
    cell.model = self.dataArray[indexPath.row];
    return cell;
}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return UITableViewAutomaticDimension;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.0001f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return [UIView new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.0001;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *backView= [UIView new];
    return backView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
 
}

- (void)setDataArray:(NSArray *)dataArray {
    _dataArray = dataArray;
    [self.tableView reloadData];
}


- (UITableView *)tableView {
    if (!_tableView) {
        
        UITableView *view = [[UITableView alloc] initWithFrame:CGRectZero style:0];
        view.dataSource = self;
        view.delegate = self;
        view.separatorStyle = UITableViewCellSeparatorStyleNone;
        //view.separatorColor = COLOR_SEPRATE;
        view.separatorInset = UIEdgeInsetsMake(0.0f, 15, 0.0f, 0.0f);
        view.showsVerticalScrollIndicator = NO;
        view.separatorColor = COLOR_DDDDDD;
        //        view.delaysContentTouches = NO;
        view.estimatedSectionHeaderHeight = 0;
        view.estimatedSectionFooterHeight = 0;
        view.backgroundColor = JCClearColor;
        //注册cell
        [view registerClass:[JCActivityPrizeTableViewCell class] forCellReuseIdentifier:@"JCActivityPrizeTableViewCell"];
        
        _tableView = view;
    }
    
    return _tableView;
}


@end
