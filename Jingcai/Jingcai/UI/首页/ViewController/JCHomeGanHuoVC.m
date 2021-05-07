//
//  JCHomeGanHuoVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/24.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCHomeGanHuoVC.h"
#import "JNNewsTableViewCell.h"
#import "JCArticleDetailVC.h"
#import "JCHomeGanHuoHeadView.h"
#import "JCBookeViewController.h"
#import "JCDiXianFootView.h"
@interface JCHomeGanHuoVC ()

@property (nonatomic,strong) JCHomeGanHuoHeadView *headView;

@property (nonatomic, strong) JCDiXianFootView *footView;

@end

@implementation JCHomeGanHuoVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    self.navigationBarStyle = JCNavigationBarStyleTransparent;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initViews];
    [self refreshData];
}

- (void)refreshData {
    self.pageNo = 1;
    [self getDataList];

}

- (void)getDataList {
    
//    [self.fatherView showLoading];
//    UIViewController *vc = self.navigationController.viewControllers.firstObject;
    if (self.dataArray.count==0) {
        [self.jcWindow showLoading];
    }
    JCHomeService_New *service = [JCHomeService_New service];
    [service getHomeDataWithType:NonNil(self.type) page:self.pageNo success:^(id  _Nullable object) {
        [self.jcWindow endLoading];
        [self endRefresh];
         if ([JCWJsonTool isSuccessResponse:object]) {
            if (self.pageNo==1) {
                [self.dataArray removeAllObjects];
            }
            NSArray *array = [NSArray yy_modelArrayWithClass:[JCWNewsBall  class] json:object[@"data"][@"recommend_article"]];
            [self.dataArray addObjectsFromArray:array];
             
             if ([self.type integerValue]==100||[self.type integerValue]==101||[self.type integerValue]==102) {
                 self.headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, AUTO(136));
                 self.tableView.tableHeaderView = self.headView;
                 if ([self.type integerValue]==100) {
                     self.headView.url = @"http://image.yixinzuqiu.com/static/image/wap/zucai/jcxy.jpg";
                     WeakSelf;
                     [self.headView bk_whenTapped:^{
                         JCBookeViewController *vc = [JCBookeViewController new];
                         [weakSelf.navigationController pushViewController:vc animated:YES];
                     }];
                 }
                 
                 if ([self.type integerValue]==101) {
                     self.headView.url = @"http://image.yixinzuqiu.com/static/image/miji.jpg";
                 }
                 if ([self.type integerValue]==102) {
                     self.headView.url = @"http://image.yixinzuqiu.com/static/image/sfc.jpg";
                 }
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

        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        [self showNoDataView];
        [self.jcWindow endLoading];
    }];


       
}

- (void)initViews {
    

    
    self.view.backgroundColor = COLOR_F0F0F0;
    // 表格注册cell
    self.tableView.separatorStyle = 0;
    self.tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    self.tableView.estimatedRowHeight = 100;
    [self.tableView registerClass:[JNNewsTableViewCell class] forCellReuseIdentifier:@"JNNewsTableViewCell"];
    
    
    JNDIYemptyView *emptyView = [JNDIYemptyView diyNoDataEmptyViewWithBlock:^{
        [self refreshData];
    }];
    emptyView.contentViewOffset = AUTO(50);
    self.tableView.ly_emptyView = emptyView;
//
//    self.tableView.mj_header = [JCFootBallHeader headerWithRefreshingBlock:^{
//        self.pageNo = 1;
//        [self getHomeData];
//        [self getNewsData];
//    }];
//
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self getDataList];
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return self.dataArray.count;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;

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

    return [UIView new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.001f;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    JNNewsTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JNNewsTableViewCell"];
    cell.model = self.dataArray[indexPath.section];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    JCArticleDetailVC *vc = [JCArticleDetailVC new];
    
    JCWNewsBall *model = self.dataArray[indexPath.section];
    vc.articalId = model.zucai_information_id;
    [self.navigationController pushViewController:vc animated:YES];
}
- (JCHomeGanHuoHeadView *)headView {
    if (!_headView) {
        _headView = [JCHomeGanHuoHeadView new];
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
