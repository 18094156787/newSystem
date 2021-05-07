//
//  JCDakaGanHuoListVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/16.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCDakaGanHuoListVC.h"
#import "JNNewsTableViewCell.h"
#import "JCArticleDetailVC.h"
@interface JCDakaGanHuoListVC ()

@end

@implementation JCDakaGanHuoListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = COLOR_F0F0F0;
    [self initViews];
    [self refreshData];
}

-(void)refreshData {
    self.pageNo = 1;
    [self getDataList];
}

- (void)getDataList {
    
    [self.jcWindow showLoading];
    JCHomeService_New *service = [JCHomeService_New new];
    [service getGZHT_TuijianExpertDetailWithExpert_id:self.expertID type:NonNil(self.type) page:self.pageNo Success:^(id  _Nullable object) {
        [self endRefresh];
        if ([JCWJsonTool isSuccessResponse:object]) {
            if (self.pageNo==1) {
                [self.dataArray removeAllObjects];
            }
            NSArray *array = [JCWJsonTool arrayWithJson:object[@"data"][@"best_new_plans"] class:[JCWNewsBall class]];
            
            [self.dataArray addObjectsFromArray:array];

            if (array.count < PAGE_LIMIT) {
                [self.tableView.mj_footer endRefreshingWithNoMoreData];
            }
            [self.tableView reloadData];
            self.pageNo++;
//            [self showNoDataView];
            if (array.count < PAGE_LIMIT&&self.dataArray.count>0) {
                    self.tableView.tableFooterView = self.noMore_footView;
                    self.tableView.mj_footer.hidden = YES;
                }else{
                    self.tableView.tableFooterView = [UIView new];
                    self.tableView.mj_footer.hidden = NO;
                }
            
           [self chageImageStr:@"nodata_fangan" Title:@"暂时还没有干货哦~~！" BtnTitle:@""];
            NSLog(@"数据%@",self.dataArray);
        }
    } failure:^(NSError * _Nonnull error) {
        [self endRefresh];
        [self showNoDataView];
       [self chageImageStr:@"nodata_fangan" Title:@"暂时还没有干货哦~~" BtnTitle:@""];
    }];
    
       
}

- (void)initViews {
    
    // 表格注册cell
    self.tableView.separatorStyle = 0;
    self.tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    self.tableView.estimatedRowHeight = 100;
    [self.tableView registerClass:[JNNewsTableViewCell class] forCellReuseIdentifier:@"JNNewsTableViewCell"];
    
    
    WeakSelf;
    JNDIYemptyView *emptyView = [JNDIYemptyView diyNoDataEmptyViewWithBlock:^{
        [weakSelf refreshData];
    }];
    self.tableView.ly_emptyView = emptyView;
    emptyView.contentViewOffset = -150;
    
    
    self.tableView.mj_header = [JCFootBallHeader headerWithRefreshingBlock:^{
        weakSelf.pageNo = 1;
//        [self.dataArray removeAllObjects];
        [weakSelf refreshData];
    }];
    
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

    return AUTO(110);
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

@end
