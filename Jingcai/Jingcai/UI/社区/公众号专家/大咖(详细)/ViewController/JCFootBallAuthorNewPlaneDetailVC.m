//
//  JCFootBallAuthorDetailVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2019/8/8.
//  Copyright © 2019年 blockstar. All rights reserved.
//

#import "JCFootBallAuthorNewPlaneDetailVC.h"
#import "JCFootBallAuthorNewPlaneCell.H"
#import "JCFootBallAuthorCodeView.h"
#import "JCFootBallAuthorCodeNodataView.h"
#import "JCWMyHongbaoBall.h"
#import "JCDakaPlanDetailStickWMVC.h"
@interface JCFootBallAuthorNewPlaneDetailVC ()

@property (nonatomic,strong) JCFootBallAuthorCodeView *codeView;

@property (nonatomic,strong) JCFootBallAuthorCodeNodataView *codeNoDataView;

@property (nonatomic,assign) BOOL isLoad;


@end

@implementation JCFootBallAuthorNewPlaneDetailVC

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
//    @weakify(self);
    
    JCHomeService_New *service = [JCHomeService_New new];
    [service getGZHT_TuijianExpertDetailWithExpert_id:self.expertID type:@"1" page:self.pageNo Success:^(id  _Nullable object) {
        [self.jcWindow endLoading];
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
        [self.jcWindow endLoading];
    }];
}

- (void)initViews {
    self.tableView.separatorStyle = 0;
    self.tableView.separatorInset = UIEdgeInsetsZero;
    self.tableView.estimatedRowHeight = 180;
    self.tableView.scrollEnabled = YES;
    // 表格注册cell
    [self.tableView registerClass:[JCFootBallAuthorNewPlaneCell class] forCellReuseIdentifier:@"JCFootBallAuthorNewPlaneCell"];
//    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.left.right.top.equalTo(self.view);
//        make.bottom.equalTo(self.view).mas_offset(-kTabBarHeight);
//
//    }];
    

    WeakSelf;
    self.tableView.mj_header = [JCFootBallHeader headerWithRefreshingBlock:^{
        weakSelf.pageNo = 1;
//        [self.dataArray removeAllObjects];
        [weakSelf refreshData];
    }];

    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [weakSelf refreshData];
    }];
    
    JNDIYemptyView *emptyView = [JNDIYemptyView diyNoDataEmptyViewWithBlock:^{
        [weakSelf refreshData];
    }];
    emptyView.contentViewOffset = -150;
    self.tableView.ly_emptyView = emptyView;
    
}



#pragma mark - Protocol
#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return 1;
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1;

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JCFootBallAuthorNewPlaneCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCFootBallAuthorNewPlaneCell"];
    cell.model = self.dataArray[indexPath.section];
    return cell;
    
    
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *view = [UIView new];
    view.backgroundColor = COLOR_F0F0F0;
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section==self.dataArray.count-1) {
        return 0.001f;
    }
    return AUTO(5);
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (![JCWUserBall currentUser]) {
        [self presentLogin];
        return ;
    }
    JCWTjInfoBall *model = self.dataArray[indexPath.section];
    [JCTuiJianManager loadGZH_ArticleDetailWithArticleID:model.id orderID:@"" type:@"" WithViewController:self is_push:YES];

}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

//- (void)setCodeUrl:(NSString *)codeUrl {
//    _codeUrl = codeUrl;
//    if (self.isLoad) {
//        if (self.dataArray.count>0) {
//            self.codeView.url = codeUrl;
//            self.tableView.tableFooterView = self.codeView;
//        }else{
//            self.codeNoDataView.url = codeUrl;
//            self.tableView.tableFooterView = self.codeNoDataView;
//        }
//    }
//
//}

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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
