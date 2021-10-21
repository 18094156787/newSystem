//
//  JCFootBallAuthorDetailVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2019/8/8.
//  Copyright © 2019年 blockstar. All rights reserved.
//

#import "JCFootBallAuthorNewPlaneDetailVC.h"
#import "JCFootBallAuthorNewPlaneCell.h"
#import "JCFootBallAuthorHistoryPlaneCell.h"
#import "JCFootBallAuthorCodeView.h"
#import "JCFootBallAuthorCodeNodataView.h"
#import "JCWMyHongbaoBall.h"
#import "JCDakaPlanDetailStickWMVC.h"
#import "JCGZHBannerModel.h"
#import "JCGZMBannerHeadView.h"
#import "JCGZMBannerDetailVC.h"
#import "JCWExpertBall.h"
#import "JCDakaHistoryTitleView.h"
@interface JCFootBallAuthorNewPlaneDetailVC ()

@property (nonatomic,strong) JCFootBallAuthorCodeView *codeView;

@property (nonatomic,strong) JCFootBallAuthorCodeNodataView *codeNoDataView;

@property (nonatomic,strong) JCGZMBannerHeadView *headView;

@property (nonatomic,strong) JCWExpertBall *expertDetailModel;

@property (nonatomic,strong) JCGZHBannerModel *bannerModel;

@property (nonatomic,strong) JNDIYemptyView *emptyView;

@property (nonatomic,strong) JCDakaHistoryTitleView *titleView;

@property (nonatomic,strong) NSMutableArray *historyArray;

@property (nonatomic,strong) NSArray *last_historyArray;//记录最新一次请求的历史数据

@end

@implementation JCFootBallAuthorNewPlaneDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = COLOR_F0F0F0;
    
    // Do any additional setup after loading the view.
    [self initViews];
    [self getNewListData];
    [self getHistoryListData];
}

- (void)getNewListData {
    if (!self.expertID) {
        return;
    }
    [self.jcWindow showLoading];
//    @weakify(self);
    
    JCHomeService_New *service = [JCHomeService_New new];
    [service getGZHT_TuijianExpertDetailWithExpert_id:self.expertID type:@"1" page:self.pageNo Success:^(id  _Nullable object) {
        [self.jcWindow endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
            [self endRefresh];
//            if (self.pageNo==1) {
//                [self.dataArray removeAllObjects];
//            }
//            [self.dataArray removeAllObjects];
            if (object[@"data"][@"record_introduction"]) {
                self.bannerModel = (JCGZHBannerModel *)[JCWJsonTool entityWithJson:object[@"data"][@"record_introduction"] class:[JCGZHBannerModel class]];
                if (self.bannerModel.img_info) {
                    self.headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 100);
                    self.headView.model = self.bannerModel;
                    self.tableView.tableHeaderView = self.headView;
                }



            }
            self.expertDetailModel = (JCWExpertBall *)[JCWJsonTool entityWithJson:object[@"data"][@"base_info"] class:[JCWExpertBall class]];
            
            NSArray *array = [JCWJsonTool arrayWithJson:object[@"data"][@"best_new_plans"] class:[JCWTjInfoBall class]];
            self.dataArray = [NSMutableArray arrayWithArray:array];
//            [self.dataArray addObjectsFromArray:array];
            if (array.count < PAGE_LIMIT) {
                [self.tableView.mj_footer endRefreshingWithNoMoreData];
            }
            [self.tableView reloadData];


            [self show_NoDataView];
        }else {
            [JCWToastTool showHint:object[@"msg"]];
        }
    } failure:^(NSError * _Nonnull error) {
//        [self chageImageStr:@"nodata_fangan" Title:@"暂时还没有发布方案哦~" BtnTitle:@""];
        [self show_NoDataView];
        [self endRefresh];
        [self.jcWindow endLoading];
    }];
}

- (void)getHistoryListData {
    if (!self.expertID) {
        return;
    }
    [self.jcWindow showLoading];

    JCHomeService_New *service = [JCHomeService_New new];
    [service getGZHT_TuijianExpertDetailWithExpert_id:self.expertID type:@"2" page:self.pageNo Success:^(id  _Nullable object) {
        if ([JCWJsonTool isSuccessResponse:object]) {
            [self endRefresh];
            if (self.pageNo==1) {
                [self.historyArray removeAllObjects];
            }
            NSArray *array = [JCWJsonTool arrayWithJson:object[@"data"][@"best_new_plans"] class:[JCWTjInfoBall class]];
            self.last_historyArray = array;
            [self.historyArray addObjectsFromArray:array];
            if (array.count < PAGE_LIMIT) {
                [self.tableView.mj_footer endRefreshingWithNoMoreData];
            }
            [self.tableView reloadData];
            self.pageNo++;

//            self.isLoad = YES;

//            if (array.count < PAGE_LIMIT&&self.dataArray.count>0) {
//                    self.tableView.tableFooterView = self.noMore_footView;
//                    self.tableView.mj_footer.hidden = YES;
//                }else{
//                    self.tableView.tableFooterView = [UIView new];
//                    self.tableView.mj_footer.hidden = NO;
//                }
            [self show_NoDataView];
            NSLog(@"数据%@",self.dataArray);
//            [self chageImageStr:@"nodata_fangan" Title:@"暂时还没有发布方案哦~" BtnTitle:@""];
        }else {
            [JCWToastTool showHint:object[@"msg"]];
        }
    } failure:^(NSError * _Nonnull error) {
        [self show_NoDataView];
        [self endRefresh];
    }];
}

- (void)show_NoDataView {
    if (self.historyArray.count==0&&self.dataArray.count==0) {
        [self chageImageStr:@"nodata_fangan" Title:@"暂时还没有发布方案哦~" BtnTitle:@""];
        [self.tableView ly_showEmptyView];
    }else{
        [self.tableView ly_hideEmptyView];
        
        if (self.last_historyArray.count < PAGE_LIMIT&&self.historyArray.count>0) {
                self.tableView.tableFooterView = self.noMore_footView;
                self.tableView.mj_footer.hidden = YES;
            }else{
                self.tableView.tableFooterView = [UIView new];
                self.tableView.mj_footer.hidden = NO;
            }
        
    }
}

- (void)initViews {
    self.tableView.separatorStyle = 0;
    self.tableView.separatorInset = UIEdgeInsetsZero;
    self.tableView.estimatedRowHeight = 180;
    self.tableView.scrollEnabled = YES;
    // 表格注册cell
    [self.tableView registerClass:[JCFootBallAuthorNewPlaneCell class] forCellReuseIdentifier:@"JCFootBallAuthorNewPlaneCell"];
    
    [self.tableView registerClass:[JCFootBallAuthorHistoryPlaneCell class] forCellReuseIdentifier:@"JCFootBallAuthorHistoryPlaneCell"];

    
    WeakSelf;
    self.tableView.mj_header = [JCFootBallHeader headerWithRefreshingBlock:^{
        weakSelf.pageNo = 1;
//        [self.dataArray removeAllObjects];
        [weakSelf getNewListData];
        [weakSelf getHistoryListData];
    }];

    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [weakSelf getHistoryListData];
    }];
    
    JNDIYemptyView *emptyView = [JNDIYemptyView diyNoDataEmptyViewWithBlock:^{
        [weakSelf refreshData];
    }];
    emptyView.contentViewOffset = -150;
    self.emptyView =  emptyView;
    self.tableView.ly_emptyView = emptyView;
    
    
//    WeakSelf;
    self.headView.JCHeightBlock = ^(float height) {
        weakSelf.headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, height);
        weakSelf.tableView.tableHeaderView = weakSelf.headView;
        
        if (weakSelf.bannerModel.img_info) {
            dispatch_async(dispatch_get_main_queue(), ^{
                //刷新UI的代码放到主线程执行
//                weakSelf.emptyView.contentViewOffset = height-50;
                weakSelf.emptyView.contentViewY = height+20;
                weakSelf.tableView.ly_emptyView = weakSelf.emptyView;
            });


        }
    };
    
    [self.headView bk_whenTapped:^{
        if (weakSelf.bannerModel.describe.length>0) {
            JCGZMBannerDetailVC *vc = [JCGZMBannerDetailVC new];
            vc.content = weakSelf.bannerModel.describe;
            vc.title = weakSelf.expertDetailModel.user_name;
            [weakSelf.navigationController pushViewController:vc animated:YES];

        }
            
    }];

}



#pragma mark - Protocol
#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return 1;
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if (section==0) {
        return self.dataArray.count;
    }
    return self.historyArray.count;

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.section==0) {
        JCFootBallAuthorNewPlaneCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCFootBallAuthorNewPlaneCell"];
        
        cell.model = self.dataArray[indexPath.row];
        return cell;
    }
    JCWTjInfoBall *model = self.historyArray[indexPath.row];
    JCFootBallAuthorHistoryPlaneCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCFootBallAuthorHistoryPlaneCell"];
    cell.model = model;
    return cell;
    
    
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section==1) {
        if (self.historyArray.count>0) {
            return self.titleView;
        }
    }
    return [UIView new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section==1) {
        if (self.historyArray.count>0) {
            return 50;
        }
    }
    return 0.01f;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *view = [UIView new];
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.001f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (![JCWUserBall currentUser]) {
        [self presentLogin];
        return ;
    }
    if (indexPath.section==0) {
        JCWTjInfoBall *model = self.dataArray[indexPath.row];
        [JCTuiJianManager loadGZH_ArticleDetailWithArticleID:model.id orderID:@"" type:@"" WithViewController:self is_push:YES];
    }else{
        JCWTjInfoBall *model = self.historyArray[indexPath.row];
        [JCTuiJianManager loadGZH_ArticleDetailWithArticleID:model.id orderID:@"" type:@"" WithViewController:self is_push:YES];
        
    }


}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (JCFootBallAuthorCodeView *)codeView {
    if (!_codeView) {
        _codeView = [JCFootBallAuthorCodeView new];
        _codeView.frame = CGRectMake(0, 0, SCREEN_WIDTH, AUTO(300));

    }
    return _codeView;
}

- (JCFootBallAuthorCodeNodataView *)codeNoDataView {
    if (!_codeNoDataView) {
        _codeNoDataView = [JCFootBallAuthorCodeNodataView new];
         _codeNoDataView.frame = CGRectMake(0, 0, SCREEN_WIDTH, AUTO(500));
    }
    return _codeNoDataView;
}
- (JCGZMBannerHeadView *)headView {
    if (!_headView) {
        _headView = [JCGZMBannerHeadView new];
    }
    return _headView;
}

- (NSMutableArray *)historyArray {
    if (!_historyArray) {
        _historyArray = [NSMutableArray array];
    }
    return _historyArray;
}

- (JCDakaHistoryTitleView *)titleView {
    if (!_titleView) {
        _titleView = [JCDakaHistoryTitleView new];
    }
    return _titleView;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
