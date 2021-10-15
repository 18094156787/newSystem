//
//  JCDakaFreePlanListVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/16.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCDakaFreePlanListVC.h"
#import "JCFootBallAuthorNewPlaneCell.H"
#import "JCFootBallAuthorCodeView.h"
#import "JCFootBallAuthorCodeNodataView.h"
#import "JCWMyHongbaoBall.h"
#import "JCDakaPlanDetailStickWMVC.h"
@interface JCDakaFreePlanListVC ()

@property (nonatomic,strong) JCFootBallAuthorCodeView *codeView;

@property (nonatomic,strong) JCFootBallAuthorCodeNodataView *codeNoDataView;

@property (nonatomic,assign) BOOL isLoad;

@end

@implementation JCDakaFreePlanListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = COLOR_F0F0F0;
    // Do any additional setup after loading the view.
    [self initViews];
    [self refreshData];
}

- (void)refreshData {
    if (!self.expertID) {
        return;
    }

    [self.jcWindow showLoading];
    JCHomeService_New *service = [JCHomeService_New new];
    [service getGZHT_TuijianExpertDetailWithExpert_id:self.expertID type:NonNil(self.type) page:self.pageNo Success:^(id  _Nullable object) {
        if ([JCWJsonTool isSuccessResponse:object]) {
            [self endRefresh];
            if (self.pageNo==1) {
                [self.dataArray removeAllObjects];
            }
            NSArray *array = [JCWJsonTool arrayWithJson:object[@"data"][@"best_new_plans"] class:[JCWTjInfoBall class]];
            
            [self.dataArray addObjectsFromArray:array];
            if (array.count < PAGE_LIMIT) {
                [self.tableView.mj_footer endRefreshingWithNoMoreData];
            }
            [self.tableView reloadData];
            self.pageNo++;

            self.isLoad = YES;

            if (array.count < PAGE_LIMIT&&self.dataArray.count>0) {
                    self.tableView.tableFooterView = self.noMore_footView;
                    self.tableView.mj_footer.hidden = YES;
                }else{
                    self.tableView.tableFooterView = [UIView new];
                    self.tableView.mj_footer.hidden = NO;
                }
            
            NSLog(@"数据%@",self.dataArray);
            [self chageImageStr:@"nodata_fangan" Title:@"暂时还没有发布方案哦~" BtnTitle:@""];
        }else {
            [JCWToastTool showHint:object[@"msg"]];
        }
    } failure:^(NSError * _Nonnull error) {
        [self chageImageStr:@"nodata_fangan" Title:@"暂时还没有发布方案哦~" BtnTitle:@""];
        [self endRefresh];
    }];
}


- (void)initViews {
    self.tableView.separatorStyle = 0;
    self.tableView.separatorInset = UIEdgeInsetsZero;
    self.tableView.estimatedRowHeight = 180;
    self.tableView.scrollEnabled = YES;
    // 表格注册cell
    [self.tableView registerClass:[JCFootBallAuthorNewPlaneCell class] forCellReuseIdentifier:@"JCFootBallAuthorNewPlaneCell"];

    
    WeakSelf;
    JNDIYemptyView *emptyView = [JNDIYemptyView diyNoDataEmptyViewWithBlock:^{
        [weakSelf refreshData];
    }];
    emptyView.contentViewOffset = -150;
    self.tableView.ly_emptyView = emptyView;

    

    
    self.tableView.mj_header = [JCFootBallHeader headerWithRefreshingBlock:^{
        weakSelf.pageNo = 1;
//        [self.dataArray removeAllObjects];
        [weakSelf refreshData];
    }];

    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [weakSelf refreshData];
    }];
    
}



#pragma mark - Protocol
#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return 1;
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dataArray.count;

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JCFootBallAuthorNewPlaneCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCFootBallAuthorNewPlaneCell"];
    cell.type = self.type;
    cell.model = self.dataArray[indexPath.row];
    return cell;
    
    
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *view = [UIView new];
    view.backgroundColor = COLOR_F6F6F6;
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
    JCWTjInfoBall *model = self.dataArray[indexPath.row];
    [JCTuiJianManager loadGZH_ArticleDetailWithArticleID:model.id orderID:@"" type:@"" WithViewController:self is_push:YES];

}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (void)setCodeUrl:(NSString *)codeUrl {
    _codeUrl = codeUrl;
//    if (self.isLoad) {
//        if (self.dataArray.count>0) {
//            self.codeView.url = codeUrl;
//            self.tableView.tableFooterView = self.codeView;
//        }else{
//            self.codeNoDataView.url = codeUrl;
//            self.tableView.tableFooterView = self.codeNoDataView;
//        }
//    }

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

@end
