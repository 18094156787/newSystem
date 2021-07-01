//
//  JCActivityHdViewController.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/3/9.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCActivityHdViewController.h"
#import "JCActivityHdCell.h"
#import "JCActivityDetailCommomVC.h"
#import "JCActivityGuessVC.h"
#import "JCActivityKindVC.h"
#import "JCActivityGuess_SPF_VC.h"
@interface JCActivityHdViewController ()

@end

@implementation JCActivityHdViewController

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
    
//    [self.fatherView showLoading];
//    UIViewController *vc = self.navigationController.viewControllers.firstObject;
    if (self.dataArray.count==0) {
        [self.jcWindow showLoading];
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
    

    
//    self.view.backgroundColor = COLOR_006DAB;
    self.tableView.backgroundColor = COLOR_F0F0F0;
    self.view.backgroundColor = COLOR_F0F0F0;
    // 表格注册cell
    self.tableView.separatorStyle = 0;
    self.tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    self.tableView.estimatedRowHeight = 100;
    [self.tableView registerClass:[JCActivityHdCell class] forCellReuseIdentifier:@"JCActivityHdCell"];
    
    
    

    
    
    
    JNDIYemptyView *emptyView = [JNDIYemptyView diyNoDataEmptyViewWithBlock:^{
        [self refreshData];
    }];
//    emptyView.contentViewOffset = -AUTO(50);
    self.tableView.ly_emptyView = emptyView;
//
    self.tableView.mj_header = [JCFootBallHeader headerWithRefreshingBlock:^{

        [self refreshData];

    }];
//
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self getDataList];
    }];
    
    [self chageImageStr:@"nodata_fangan" Title:@"当前暂无活动哦~" BtnTitle:@""];
    
    
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


@end
