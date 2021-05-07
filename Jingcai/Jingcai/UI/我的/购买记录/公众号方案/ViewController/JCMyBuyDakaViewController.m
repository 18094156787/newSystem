//
//  JCMyBuyDakaViewController.m
//  Jingcai
//
//  Created by 陈继伟 on 2019/8/16.
//  Copyright © 2019年 blockstar. All rights reserved.
//

#import "JCMyBuyDakaViewController.h"
#import "JCMyBuyDakaViewCell.h"
#import "JCPlaneDetailVC.h"
#import "JCDakaPlanDetailStickWMVC.h"
#import "JCWMyHongbaoBall.h"
#import "JCFamousExpertCell.h"
@interface JCMyBuyDakaViewController ()

@end

@implementation JCMyBuyDakaViewController


- (void)viewDidLoad {
    self.style = 1;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initViews];
    [self refreshData];
    
}

- (void)refreshData {
    
    [self loadTjData];
    
}

- (void)initViews {
    //    self.tableView.backgroundColor = COLOR_F6F6F6;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.estimatedRowHeight = 100;
    // 表格注册cell
    [self.tableView registerClass:[JCMyBuyDakaViewCell class] forCellReuseIdentifier:@"JCMyBuyDakaViewCell"];
//    [self.tableView registerClass:[JCFamousExpertCell class] forCellReuseIdentifier:@"JCFamousExpertCell"];
    
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.view);
        make.bottom.equalTo(self.view).mas_offset(-kBottomTabSafeAreaHeight);
    }];
    WeakSelf;
    JNDIYemptyView *emptyView = [JNDIYemptyView diyNoDataEmptyViewWithBlock:^{
        [weakSelf refreshData];
    }];
    self.tableView.ly_emptyView = emptyView;
    
    self.tableView.mj_header = [JCFootBallHeader headerWithRefreshingBlock:^{
        weakSelf.pageNo = 1;
        
        [weakSelf refreshData];
    }];
    
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [weakSelf refreshData];
    }];
    
}

#pragma mark - Protocol
#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    JCMyBuyDakaViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCMyBuyDakaViewCell"];
    cell.model = self.dataArray[indexPath.section];
    return cell;
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    JCWTjInfoBall *model = self.dataArray[indexPath.section];
    [JCTuiJianManager loadGZH_ArticleDetailWithArticleID:model.zucai_order_unique_id orderID:model.zucai_order_id type:@"2" WithViewController:self is_push:YES];

}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    
    return UITableViewAutomaticDimension;
}




- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *footView = [UIView new];
    footView.backgroundColor = COLOR_F6F6F6;
    return footView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return AUTO(5);
}

#pragma mark lazyload


//分割线至顶部
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsMake(0, 15, 0, 15)];
    }
    //
}

#pragma mark DataRequest

- (void)loadTjData{
    WeakSelf;
    if (self.dataArray.count==0) {
        [self.fatherView showLoading];
    }
    JCUserService_New *service = [JCUserService_New service];
    [service getMyBuyPlanListWithType:@"1" WithPage:self.pageNo DataSuccess:^(id  _Nullable object) {
        [weakSelf endRefresh];
        [self.fatherView endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
            if (self.pageNo==1) {
                [self.dataArray removeAllObjects];
            }
            
            
            NSArray *array = [JCWJsonTool arrayWithJson:object[@"data"] class:[JCWTjInfoBall class]];
            [self.dataArray addObjectsFromArray:array];
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
            }            [self chageImageStr:@"nodata_buyRecord" Title:@"暂时没有你的购买记录~" BtnTitle:@""];
            self.pageNo++;
        }
        
    } failure:^(NSError * _Nonnull error) {
        [self chageImageStr:@"nodata_buyRecord" Title:@"暂时没有你的购买记录~" BtnTitle:@""];
        [weakSelf endRefresh];
        [self.fatherView endLoading];
    }];

    
    
}

@end
