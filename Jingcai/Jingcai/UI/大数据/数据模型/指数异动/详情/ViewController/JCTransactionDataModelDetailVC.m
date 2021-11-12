//
//  JCTransactionDataModelDetailVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/12.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCTransactionDataModelDetailVC.h"
#import "JCPoissonDataModelDetailHeadView.h"
#import "JCKellyDataModelDetailInfoCell.h"

#import "JCKellyDataModelSampleTitleView.h"


#import "JCTransactionDataModelDetailHeadView.h"
#import "JCTransactionDataModelDetailDataCell.h"
#import "JCTransactionDataModelDetailSameMatchCell.h"
#import "JCTransactionDataModelDetailZhiShuCell.h"
#import "JCPoissonDataModelDetailAttackCell.h"
#import "JCTransactionDataModelTitleView.h"

@interface JCTransactionDataModelDetailVC ()

@property (nonatomic,strong) JCTransactionDataModelDetailHeadView *headView;

@property (nonatomic,strong) UIView *topColorView;

@end

@implementation JCTransactionDataModelDetailVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationBarStyle = JCNavigationBarStyleTransparent;
//    [self initViews];
    if (!self.topColorView) {
        [self setupColorView];
    }else{
        [self setNavEffect];
    }


}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
//      self.navigationBarStyle = JCNavigationBarStyleTransparent;
    self.topColorView.alpha = 0;

}

- (void)viewDidLoad {
    self.style = 1;
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

//    [self.jcWindow showLoading];
//    JCMatchService_New *service = [JCMatchService_New new];
//    [service getPredictedMatchListWithType:@"2" Key_word:@"" Page:self.pageNo Success:^(id  _Nullable object) {
//        [self endRefresh];
//
//        if ([JCWJsonTool isSuccessResponse:object]) {
//            if (self.pageNo==1) {
//                [self.dataArray removeAllObjects];
//            }
//            NSArray *array = [JCWJsonTool arrayWithJson:object[@"data"][@"list"] class:[JCMatchInfoModel class]];
//             [self.dataArray addObjectsFromArray:array];
//            if (array.count <PAGE_LIMIT) {
//                [self.tableView.mj_footer endRefreshingWithNoMoreData];
//            }
//            [self.tableView reloadData];
//            self.pageNo++;
//            [self chageImageStr:@"nodata" Title:@"暂无更多比赛" BtnTitle:@""];
//
//            if (array.count ==0&&self.dataArray.count>0) {
//                  self.tableView.tableFooterView = self.noMore_footView;
//                  self.tableView.mj_footer.hidden = YES;
//              }else{
//                  self.tableView.tableFooterView = [UIView new];
//                  self.tableView.mj_footer.hidden = NO;
//              }
//
//        }else{
//            [JCWToastTool showHint:object[@"msg"]];
//        }
//
//    } failure:^(NSError * _Nonnull error) {
//        [self endRefresh];
//        [self chageImageStr:@"nodata" Title:@"暂无更多比赛" BtnTitle:@""];
//    }];

}


- (void)initViews {
//    JCJingCaiAIBigDataMatchTitleView *titleView = [[JCJingCaiAIBigDataMatchTitleView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, AUTO(45))];
//    titleView.backgroundColor = JCWhiteColor;
//    titleView.titleLab.text = @"比赛列表";
//    titleView.iconView.hidden = NO;
//    self.tableView.tableHeaderView = titleView;
//
//    titleView.JCBlcok = ^{
//        [weakSelf.navigationController pushViewController:[JCJingCaiAIBigDataHomeVC new] animated:YES];
//    };
    
    UIButton *customView = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    [customView addTarget:self action:@selector(backItemClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:customView];
    
    
    self.headView.titleLab.text = @"异动详情";
    self.headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, AUTO(175)+kNavigationBarHeight);
    self.tableView.tableHeaderView = self.headView;
    
    WeakSelf;
    self.tableView.estimatedRowHeight = 300;
//    self.tableView.backgroundColor = COLOR_F4F6F9;
    self.tableView.separatorColor = COLOR_DDDDDD;
    self.tableView.separatorInset = UIEdgeInsetsZero;
    self.tableView.separatorStyle = 0;
    // 表格注册cell
    [self.tableView registerClass:[JCTransactionDataModelDetailDataCell class] forCellReuseIdentifier:@"JCTransactionDataModelDetailDataCell"];
    [self.tableView registerClass:[JCTransactionDataModelDetailSameMatchCell class] forCellReuseIdentifier:@"JCTransactionDataModelDetailSameMatchCell"];
    [self.tableView registerClass:[JCPoissonDataModelDetailAttackCell class] forCellReuseIdentifier:@"JCPoissonDataModelDetailAttackCell"];
    
    [self.tableView registerClass:[JCTransactionDataModelDetailZhiShuCell class] forCellReuseIdentifier:@"JCTransactionDataModelDetailZhiShuCell"];

    
//    self.headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, AUTO(48));
//    self.tableView.tableHeaderView = self.headView;
    
    
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 10)];

    JNDIYemptyView *emptyView = [JNDIYemptyView diyNoDataEmptyViewWithBlock:^{
        [weakSelf refreshData];
    }];
    emptyView.contentViewOffset = 0;
    self.tableView.ly_emptyView = emptyView;

 

}

- (void)backItemClick {
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)setupColorView {
    self.topColorView = [UIView new];
    self.topColorView.backgroundColor = JCWhiteColor;
    self.topColorView.alpha = 0;
    self.topColorView.frame = CGRectMake(0, 0, SCREEN_WIDTH, kNavigationBarHeight);
        [self.navigationController.view insertSubview:self.topColorView belowSubview:self.navigationController.navigationBar];
//    [self.navigationController.view addSubview:self.topColorView];
    
    UIButton *backBtn = [UIButton new];
    [self.topColorView addSubview:backBtn];
    [backBtn setImage:JCIMAGE(@"common_title_back_black_bold") forState:0];
    [backBtn setImage:JCIMAGE(@"common_title_back_black_bold") forState:UIControlStateHighlighted];
    [backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(5);
        make.top.offset(StatusBar_HEIGHT);
        make.bottom.offset(0);
        make.width.mas_equalTo(44);
    }];
//    [backBtn addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *titleLab = [UILabel initWithTitle:@"异动详情" andFont:17 andWeight:3 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    [self.topColorView addSubview:titleLab];
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(backBtn);
        make.centerX.equalTo(self.topColorView);
    }];
    

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 4;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section==0) {
        return 1;
    }
    if (section==1) {
        return 1;
    }
    if (section==2) {
        return 5;
    }


    return 1;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==0) {
        return AUTO(100);
    }
//    if (indexPath.section==2) {
//        return AUTO(35);
//    }
//    if (indexPath.section==4) {
//        return AUTO(60);
//    }
    if (indexPath.section==1) {
        return AUTO(105);
    }
    if (indexPath.section==2) {
        return AUTO(50);
    }
    if (indexPath.section==3) {
        return AUTO(30)*5+AUTO(10);
    }
    
    return UITableViewAutomaticDimension;
}



- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {

    return AUTO(8);
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *footVew = [UIView new];
    footVew.backgroundColor = COLOR_F0F0F0;
    return footVew;

}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {

    JCTransactionDataModelTitleView *headView = [JCTransactionDataModelTitleView new];
    
    if (section==0) {
        headView.titleLab.text = @"异动数据";
//        headView.inf
    }
    if (section==1) {
        headView.titleLab.text = @"初赔相同的比赛";
    }
    if (section==2) {
        headView.titleLab.text = @"数据对比";
    }
    if (section==3) {
        headView.titleLab.text = @"指数详情";
    }

    
    return headView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return AUTO(40);
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==0) {
        JCTransactionDataModelDetailDataCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCTransactionDataModelDetailDataCell"];
        return cell;
    }
    if (indexPath.section==1) {
        JCTransactionDataModelDetailSameMatchCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCTransactionDataModelDetailSameMatchCell"];
        return cell;
    }
    if (indexPath.section==2) {
        JCPoissonDataModelDetailAttackCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCPoissonDataModelDetailAttackCell"];
        if (indexPath.row==0) {
            cell.titleLab.text = @"场均进球";
        }
        if (indexPath.row==1) {
            cell.titleLab.text = @"场均失球";
        }
        if (indexPath.row==2) {
            cell.titleLab.text = @"场均角球";
        }
        if (indexPath.row==3) {
            cell.titleLab.text = @"场均射门";
        }
        if (indexPath.row==4) {
            cell.titleLab.text = @"场均控球率";
        }

        return cell;
    }
    
    if (indexPath.section==3) {
        JCTransactionDataModelDetailZhiShuCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCTransactionDataModelDetailZhiShuCell"];
        return cell;
    }
    
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    return cell;
    
}

#pragma mark - ScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [super scrollViewDidScroll:scrollView];
//    if (scrollView.contentOffset.y < 0) {
//        [self.view setNeedsLayout];
//    }
    [self setNavEffect];


    NSLog(@"%.0f",scrollView.contentOffset.y);
}

- (void)setNavEffect {

    CGFloat offsetY = self.tableView.contentOffset.y;
    CGFloat maxOffsetY = AUTO(200);
    float percent = offsetY/maxOffsetY;
    self.topColorView.alpha = percent;
//    NSLog(@"%.2f",percent);
//    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    if (percent>=1) {
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;//
    }else{
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    }
//    self.navShadow.alpha= percent;

}

- (JCTransactionDataModelDetailHeadView *)headView {
    if (!_headView) {
        _headView = [JCTransactionDataModelDetailHeadView new];
    }
    return _headView;
}

@end
