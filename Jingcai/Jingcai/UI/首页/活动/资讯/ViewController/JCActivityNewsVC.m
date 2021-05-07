//
//  JCActivityNewsVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/3/4.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCActivityNewsVC.h"
#import "JCActivityNewsCell.h"
#import "JCArticleDetailVC.h"
#import "JCActivityNewsHeadView.h"
#import "JCBookeViewController.h"
#import "JCDiXianFootView.h"
#import "JCActivityNewsTitleImgView.h"
#import "JCWMatchBall.h"
@interface JCActivityNewsVC ()

@property (nonatomic,strong) JCActivityNewsHeadView *headView;

@property (nonatomic, strong) JCDiXianFootView *footView;

@end

@implementation JCActivityNewsVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    self.navigationBarStyle = JCNavigationBarStyleTransparent;
}

- (void)viewDidLoad {
    self.style = 1;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initViews];
    [self refreshData];
//    [self getHomeData];
}

- (void)refreshData {
    self.pageNo = 1;
    [self getDataList];
}

- (void)getDataList {

    if (self.dataArray.count==0) {
        [self.jcWindow showLoading];
    }
    JCActivityService *service = [JCActivityService service];
    [service getHomeDataWithPage:self.pageNo success:^(id  _Nullable object) {
        [self.jcWindow endLoading];
        [self endRefresh];
         if ([JCWJsonTool isSuccessResponse:object]) {
            if (self.pageNo==1) {
                [self.dataArray removeAllObjects];
            }
            NSArray *array = [NSArray yy_modelArrayWithClass:[JCWNewsBall  class] json:object[@"data"][@"recommend_article"]];
            [self.dataArray addObjectsFromArray:array];
             
             NSArray *matchArray = [JCWJsonTool arrayWithJson:object[@"data"][@"recommend_match"] class:[JCWMatchBall class]];
             if (matchArray.count>0) {
                 self.headView.bannerArray = matchArray;
                 self.headView.frame = CGRectMake(8, 0, SCREEN_WIDTH-16, AUTO(280));
                 self.tableView.tableHeaderView = self.headView;
                 
             }
             

//             [self.dataArray removeAllObjects];
            [self.tableView reloadData];
             if (array.count < PAGE_LIMIT) {
                 [self.tableView.mj_footer endRefreshingWithNoMoreData];

             }
             if (array.count < PAGE_LIMIT&&self.dataArray.count>0) {
                 self.tableView.tableFooterView = self.noMore_footView;
                 self.tableView.mj_footer.hidden = YES;
             }else{
                 self.tableView.tableFooterView = [UIView new];
                 self.tableView.mj_footer.hidden = NO;
             }
            self.pageNo++;
             [self showNoDataView];
             
             if (self.dataArray.count==0) {
                 self.view.backgroundColor = JCWhiteColor;
                 self.tableView.backgroundColor = JCWhiteColor;
             }else {
                 self.view.backgroundColor = COLOR_006DAB;
                 self.tableView.backgroundColor = JCClearColor;
             }

        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        self.view.backgroundColor = JCWhiteColor;
        self.tableView.backgroundColor = JCWhiteColor;
        [self showNoDataView];
        [self.jcWindow endLoading];
    }];

       
}

- (void)initViews {
    

    
    self.view.backgroundColor = COLOR_006DAB;
    self.tableView.backgroundColor = JCClearColor;
    // 表格注册cell
    self.tableView.separatorStyle = 0;
    self.tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    self.tableView.estimatedRowHeight = 100;
    [self.tableView registerClass:[JCActivityNewsCell class] forCellReuseIdentifier:@"JCActivityNewsCell"];
    
    
    

    
    
    WeakSelf;
    JNDIYemptyView *emptyView = [JNDIYemptyView diyNoDataEmptyViewWithBlock:^{
        [weakSelf refreshData];
    }];
    emptyView.contentViewOffset = AUTO(50);
    self.tableView.ly_emptyView = emptyView;
//
    self.tableView.mj_header = [JCFootBallHeader headerWithRefreshingBlock:^{
        weakSelf.pageNo = 1;
        [weakSelf refreshData];
    }];
//
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [weakSelf getDataList];
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dataArray.count;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return AUTO(95);
}


- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *footView = [UIView new];
    footView.backgroundColor = COLOR_F0F0F0;
    return footView;
}


- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.001f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (self.dataArray.count>0) {
        return [JCActivityNewsTitleImgView new];
    }
    return [UIView new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (self.dataArray.count>0) {
        return 56;
    }
    return 0.01;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    JCActivityNewsCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCActivityNewsCell"];
    cell.backgroundColor = JCClearColor;
    cell.model = self.dataArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    JCArticleDetailVC *vc = [JCArticleDetailVC new];
    
    JCWNewsBall *model = self.dataArray[indexPath.row];
    vc.articalId = model.zucai_information_id;
    [self.navigationController pushViewController:vc animated:YES];
}
- (JCActivityNewsHeadView *)headView {
    if (!_headView) {
        _headView = [JCActivityNewsHeadView new];
    }
    return _headView;
}
- (JCDiXianFootView *)footView {
    if (!_footView) {
        _footView = [JCDiXianFootView new];
    }
    return _footView;
}
@end
