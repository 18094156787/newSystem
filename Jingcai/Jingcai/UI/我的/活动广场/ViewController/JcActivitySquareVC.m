//
//  JcActivitySquareVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/3/16.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JcActivitySquareVC.h"
#import "JCActivityHdCell.h"
#import "JcActivityHistoryVC.h"
#import "JCActivityDetailCommomVC.h"
#import "JCActivityGuessVC.h"
#import "JCActivityGuess_SPF_VC.h"
#import "JCActivityKindVC.h"

@interface JcActivitySquareVC ()

@end

@implementation JcActivitySquareVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationBarStyle = JCNavigationBarStyleDefault;
}

- (void)viewDidLoad {
    self.style = 1;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"活动广场";
    [self initViews];
    [self refreshData];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshData) name:@"refreshKindActivityDetail" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshData) name:@"refreshKindActivityDetail_After" object:nil];
    
//    [self getHomeData];
}

- (void)refreshData {
    self.pageNo = 1;
    [self getDataList];

}

- (void)getDataList {

    if (self.dataArray.count==0) {
        [self.view showLoading];
    }
    JCActivityService *service = [JCActivityService service];
    [service getActivityListWithType:@"1" page:self.pageNo success:^(id  _Nullable object) {
        [self endRefresh];
         if ([JCWJsonTool isSuccessResponse:object]) {
            if (self.pageNo==1) {
                [self.dataArray removeAllObjects];
            }
            NSArray *array = [NSArray yy_modelArrayWithClass:[JCWSlideBall class] json:object[@"data"]];
            [self.dataArray addObjectsFromArray:array];


//             [self.dataArray removeAllObjects];
            [self.tableView reloadData];
             if (array.count < PAGE_LIMIT) {
                 [self.tableView.mj_footer endRefreshingWithNoMoreData];

             }

            self.pageNo++;
//             [self showNoDataView];
             [self chageImageStr:@"nodata_fangan" Title:@"当前暂无活动哦~" BtnTitle:@""];

        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        [self chageImageStr:@"nodata_fangan" Title:@"抱歉！未能获取数据，请重新刷新~" BtnTitle:@""];
        [self endRefresh];
    }];

}

- (void)initViews {
    UIButton *historyBtn = [UIButton initWithText:@"历史活动" FontSize:AUTO(14) Weight:1 BackGroundColor:JCClearColor TextColors:COLOR_1B1B1B];
    [historyBtn addTarget:self action:@selector(historyItemClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *historyItem = [[UIBarButtonItem alloc] initWithCustomView:historyBtn];
     historyItem.tintColor = COLOR_1B1B1B;
    self.navigationItem.rightBarButtonItem = historyItem;


    
//    self.view.backgroundColor = COLOR_006DAB;
    self.tableView.backgroundColor = COLOR_F0F0F0;
    self.view.backgroundColor = COLOR_F0F0F0;
    // 表格注册cell
    self.tableView.separatorStyle = 0;
    self.tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    self.tableView.estimatedRowHeight = 100;
    [self.tableView registerClass:[JCActivityHdCell class] forCellReuseIdentifier:@"JCActivityHdCell"];
    
    
    

    
    WeakSelf;
    
    JNDIYemptyView *emptyView = [JNDIYemptyView diyNoDataEmptyViewWithBlock:^{
        [weakSelf refreshData];
    }];
//    emptyView.contentViewOffset = -AUTO(50);
    self.tableView.ly_emptyView = emptyView;
//
    self.tableView.mj_header = [JCFootBallHeader headerWithRefreshingBlock:^{
        [weakSelf refreshData];
    }];

    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [weakSelf getDataList];
    }];
    
//    [self chageImageStr:@"nodata_fangan" Title:@"当前暂无活动哦~" BtnTitle:@""];
    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dataArray.count;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return UITableViewAutomaticDimension;
}


- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *footView = [UIView new];
    footView.backgroundColor = COLOR_F0F0F0;
    return footView;
}


- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.001f;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    JCActivityHdCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCActivityHdCell"];
    cell.model = self.dataArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    JCWSlideBall *model = self.dataArray[indexPath.row];
    if ([model.type integerValue]==1) {

        if (![JCWStringTool isEmptyStr:model.app_url]) {
            [JCPageRedirectManager redirectWithRoute:model.app_url vc:self];
            return ;
        }
        //网址无效不跳转
        if (![JCWStringTool isUrlAddress:model.url]) {
            return ;
        }
        WebViewController *webVC = [WebViewController new];
        webVC.urlStr = model.url;
        [self.navigationController pushViewController:webVC animated:YES];
    }
    
    if ([model.type integerValue]==2||[model.type integerValue]==3) {
        JCActivityDetailCommomVC *vc = [JCActivityDetailCommomVC new];
        vc.actID = model.id;
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    if ([model.type integerValue]==4) {

        JCActivityGuessVC *vc = [JCActivityGuessVC new];
        vc.actID = model.id;
        [self.navigationController pushViewController:vc animated:YES];
        
//        JCActivityGuess_SPF_VC *vc = [JCActivityGuess_SPF_VC new];
//        vc.actID = model.id;
//        [self.navigationController pushViewController:vc animated:YES];
    }
    if ([model.type integerValue]==5) {
        JCActivityKindVC *vc = [JCActivityKindVC new];
        vc.actID = model.id;
        [self.navigationController pushViewController:vc animated:YES];
    }
    if ([model.type integerValue]==6) {
        JCActivityGuess_SPF_VC *vc = [JCActivityGuess_SPF_VC new];
        vc.actID = model.id;
        [self.navigationController pushViewController:vc animated:YES];
    }
    

}



- (void)historyItemClick {
    [self.navigationController pushViewController:[JcActivityHistoryVC new] animated:YES];
}
@end
