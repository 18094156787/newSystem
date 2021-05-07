//
//  JCBasketBallMatchFanganVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/4.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBasketBallMatchFanganVC.h"
#import "JCDakaPlanDetailStickWMVC.h"
#import "JCFamousExpertCell.h"
#import "JCWMyHongbaoBall.h"

@interface JCBasketBallMatchFanganVC ()

@property (nonatomic,strong) NSString *end;

@property (nonatomic,strong) NSString *tuijianid;


@end

@implementation JCBasketBallMatchFanganVC



- (void)viewDidLoad {
    self.style = 0;
    [super viewDidLoad];
    self.view.backgroundColor = COLOR_F4F6F9;
    // Do any additional setup after loading the view.
    self.end = @"";
    self.tuijianid = @"";

    [self initViews];
    [self refreshData];
}

- (void)refreshData {
    self.pageNo = 1;
    [self getDataList];
}

- (void)getDataList {
    if (self.matchBall.id.length==0) {
        return;
    }
    
    JCBasketBallMatchService_New *service = [JCBasketBallMatchService_New service];
    [service getBasketBallMatchPlanListWithMatch_id:self.matchBall.id Page:self.pageNo Success:^(id  _Nullable object) {
        [self endRefresh];
        if ([JCWJsonTool isSuccessResponse:object]) {
            if (self.pageNo==1) {
                [self.dataArray removeAllObjects];
            }

            NSArray *array = [JCWJsonTool arrayWithJson:object[@"data"] class:[JCWTjInfoBall class]];

            [self.dataArray addObjectsFromArray:array];
            if (array.count < PAGE_LIMIT) {
                [self.tableView.mj_footer endRefreshingWithNoMoreData];
            }
//            [self showNoDataView];
            [self.tableView reloadData];
            self.pageNo++;
            if (self.dataArray.count==0) {
                UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200)];
                [headView showNoDataClearViewWithTitle:@"暂时无方案" isTop:YES];
                self.tableView.tableHeaderView = headView;
            }else{
                [self.tableView hideNoData];
                self.tableView.tableHeaderView = [UIView new];
            }

        }
    } failure:^(NSError * _Nonnull error) {
        [self endRefresh];
    }];

}

- (void)initViews {
    

    self.tableView.separatorInset = UIEdgeInsetsZero;
    self.tableView.separatorStyle = 0;
    self.tableView.estimatedRowHeight = 80;
    // 表格注册cell
    [self.tableView registerClass:[JCFamousExpertCell class] forCellReuseIdentifier:@"JCFamousExpertCell"];
    
    WeakSelf;
    JNDIYemptyView *emptyView = [JNDIYemptyView diyNoDataEmptyViewWithBlock:^{
        [weakSelf refreshData];
    }];
    self.tableView.ly_emptyView = emptyView;
    
    //
        self.tableView.mj_header = [JCFootBallHeader headerWithRefreshingBlock:^{
//            self.end = @"";
//            self.tuijianid = @"";
            weakSelf.pageNo = 1;
            [weakSelf refreshData];
        }];
    //
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
    JCWTjInfoBall *model = self.dataArray[indexPath.section];
    JCFamousExpertCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCFamousExpertCell"];
    cell.model = model;
//    cell.timeLab.text = [NSString stringWithFormat:@"截止时间: %@",model.end_time];
    cell.timeLab.textColor = COLOR_2F2F2F;
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *view = [UIView new];
    view.backgroundColor = COLOR_F6F6F6;
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (self.dataArray.count>0) {
        if (section==self.dataArray.count-1) {
            return 0.01f;
        }
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
@end
