//
//  JCBaseTableViewController.m
//  Jingcai
//
//  Created by 陈继伟 on 2019/8/6.
//  Copyright © 2019年 blockstar. All rights reserved.
//

#import "JCBaseTableViewController.h"


@interface JCBaseTableViewController ()



@end

@implementation JCBaseTableViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = JCWhiteColor;
    [self initSubView];
    // Do any additional setup after loading the view.
    [self defaultData];
}

- (void)defaultData {
    self.pageNo = 1;
    self.pageSize = 10;
}

- (void)initSubView {
    
    [self.view addSubview:self.tableView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
        make.left.right.equalTo(self.view);
        //        make.bottom.equalTo(self.view).offset(-kTabBarHeight);
        if (@available(iOS 11.0, *)) {
            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        } else {
            make.bottom.equalTo(self.view);
            // Fallback on earlier versions
        }
    }];
    
}

- (void)endRefresh {
    [self.view endLoading];
    [self.jcWindow endLoading];
    [self.tableView.mj_header endRefreshing];
    [self.tableView.mj_footer endRefreshing];
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
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    
    return cell;
}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 44;
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
- (void)refreshData {
    [self endRefresh];
}

- (void)chageImageStr:(NSString *)ImageStr Title:(NSString *)title BtnTitle:(NSString *)btnTtitle {
    self.tableView.ly_emptyView.imageStr = ImageStr;
    self.tableView.ly_emptyView.titleStr = title;
    self.tableView.ly_emptyView.titleLabTextColor = COLOR_9F9F9F;
    self.tableView.ly_emptyView.titleLabFont = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(12)];
    self.tableView.ly_emptyView.btnTitleStr = btnTtitle;
//    [self.tableView ly_showEmptyView];
    self.tableView.ly_emptyView.actionButton.hidden = btnTtitle.length>0?NO:YES;
    if (self.dataArray.count>0) {
        [self.tableView ly_hideEmptyView];
    }else {
        [self.tableView ly_showEmptyView];
    }
}

- (void)chageTitle:(NSString *)title DetailStr:(NSString *)detail BtnTitle:(NSString *)btnTtitle {
    self.tableView.ly_emptyView.imageStr = @"";
    self.tableView.ly_emptyView.titleStr = title;
    self.tableView.ly_emptyView.detailStr = detail;
    self.tableView.ly_emptyView.detailLabTextColor = COLOR_9F9F9F;
    self.tableView.ly_emptyView.titleLabTextColor = COLOR_2F2F2F;
    self.tableView.ly_emptyView.titleLabFont = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(13)];
    self.tableView.ly_emptyView.btnTitleStr = btnTtitle;
//    [self.tableView ly_showEmptyView];
    self.tableView.ly_emptyView.actionButton.hidden = btnTtitle.length>0?NO:YES;
    if (self.dataArray.count>0) {
        [self.tableView ly_hideEmptyView];
    }else {
        [self.tableView ly_showEmptyView];
    }
}

- (void)showNoDataView {
    self.tableView.ly_emptyView.imageStr = @"nodata";
    self.tableView.ly_emptyView.titleStr = @"空的，啥也没有啦~";
    self.tableView.ly_emptyView.btnTitleStr = @"点击重试";
    self.tableView.ly_emptyView.actionButton.hidden = YES;
    
    if (self.dataArray.count>0) {
        [self.tableView ly_hideEmptyView];
    }else {
        [self.tableView ly_showEmptyView];
    }
}

- (void)showNonetView {
    if (![[AFNetworkReachabilityManager sharedManager] isReachable]) {
        self.tableView.ly_emptyView.imageStr = @"nonet";
        self.tableView.ly_emptyView.titleStr = @"哎呀，网络找不到啦~";
        self.tableView.ly_emptyView.btnTitleStr = @"点击重试";
        self.tableView.ly_emptyView.actionButton.hidden = NO;
        [self.tableView ly_showEmptyView];
    };

}


- (UITableView *)tableView {
    if (!_tableView) {
        UITableView *view = [[UITableView alloc] initWithFrame:CGRectZero style:self.style];
        view.dataSource = self;
        view.delegate = self;
        //        view.separatorStyle = UITableViewCellSeparatorStyleNone;
        //view.separatorColor = COLOR_SEPRATE;
        view.separatorInset = UIEdgeInsetsMake(0.0f, 15, 0.0f, 0.0f);
        view.showsVerticalScrollIndicator = NO;
        //        view.delaysContentTouches = NO;
        view.estimatedSectionHeaderHeight = 0;
        view.estimatedSectionFooterHeight = 0;
        view.backgroundColor = JCClearColor;
        view.tableFooterView = [UIView new];
        //注册cell
        [view registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
        
        _tableView = view;
//        if (@available(iOS 15.0, *)) {
//            view.sectionHeaderTopPadding = 0;
//        }
        if (@available(iOS 11.0, *)) {
            
            view.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
            
        } else {
            
            self.automaticallyAdjustsScrollViewInsets = NO;
            
        }

        
    }
    
    return _tableView;
}

- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}
- (JCDiXianFootView *)noMore_footView {
    if (!_noMore_footView) {
        _noMore_footView = [JCDiXianFootView new];
        _noMore_footView.frame = CGRectMake(0, 0, SCREEN_WIDTH, AUTO(50));

    }
    return _noMore_footView;
}
@end
