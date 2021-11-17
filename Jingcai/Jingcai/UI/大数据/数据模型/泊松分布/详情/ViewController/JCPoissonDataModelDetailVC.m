//
//  JCPoissonDataModelDetailVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/10.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCPoissonDataModelDetailVC.h"
#import "JCPoissonDataModelDetailHeadView.h"
#import "JCPoissonDataModelDetailTitleView.h"
#import "JCPoissonDataModelDetailAttackCell.h"
#import "JCPoissonDataModelDetailDistributionCell.h"
#import "JCPoissonDataModelDetailPredictCell.h"
#import "JCKellyDataDetailModel.h"
@interface JCPoissonDataModelDetailVC ()

@property (nonatomic,strong) JCPoissonDataModelDetailHeadView *headView;

@property (nonatomic,strong) UIView *topColorView;

@property (nonatomic,strong) JCKellyDataDetailModel *detailModel;

@end

@implementation JCPoissonDataModelDetailVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationBarStyle = JCNavigationBarStyleTransparent;
//    [self initViews];
    if (!self.hidetopMatch) {
        if (!self.topColorView) {
            [self setupColorView];
        }else{
            [self setNavEffect];
        }
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
    [self.view showLoading];
    JCDataBaseService_New *service = [JCDataBaseService_New new];
    [service getPoissonDataModeDetailWithMatch_id:self.match_id Success:^(id  _Nullable object) {
        [self endRefresh];

        if ([JCWJsonTool isSuccessResponse:object]) {

            self.detailModel = (JCKellyDataDetailModel *)[JCWJsonTool entityWithJson:object[@"data"] class:[JCKellyDataDetailModel class]];
            self.headView.model = self.detailModel;
            if (!self.hidetopMatch&&self.detailModel.competition_type!=1) {
                self.headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, AUTO(160)+kNavigationBarHeight);
                self.tableView.tableHeaderView = self.headView;
            }
            [self.tableView reloadData];
            self.tableView.tableFooterView = self.noMore_footView;
            self.tableView.mj_footer.hidden = YES;


        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        [self endRefresh];
    }];

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
    
    
    
    if (!self.hidetopMatch) {
        self.headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, AUTO(200)+kNavigationBarHeight);
        self.tableView.tableHeaderView = self.headView;
    }else{
        [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.view).offset(0);
        }];
    }
    

    
    WeakSelf;
    self.tableView.estimatedRowHeight = 300;
//    self.tableView.backgroundColor = COLOR_F4F6F9;
    self.tableView.separatorColor = COLOR_DDDDDD;
    self.tableView.separatorInset = UIEdgeInsetsZero;
    self.tableView.separatorStyle = 0;
    // 表格注册cell
    [self.tableView registerClass:[JCPoissonDataModelDetailAttackCell class] forCellReuseIdentifier:@"JCPoissonDataModelDetailAttackCell"];
    [self.tableView registerClass:[JCPoissonDataModelDetailDistributionCell class] forCellReuseIdentifier:@"JCPoissonDataModelDetailDistributionCell"];
    [self.tableView registerClass:[JCPoissonDataModelDetailPredictCell class] forCellReuseIdentifier:@"JCPoissonDataModelDetailPredictCell"];
    
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
    
    UILabel *titleLab = [UILabel initWithTitle:@"泊松预测详情" andFont:17 andWeight:3 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    [self.topColorView addSubview:titleLab];
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(backBtn);
        make.centerX.equalTo(self.topColorView);
    }];
    

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 3;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section==0) {
        return 4;
    }
    if (section==1) {
        return 2;
    }
    if (section==2) {
        if (self.detailModel.score_guess.count>0) {
            return 1;
        }
    }
    return 0;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==0) {
        return AUTO(50);
    }
    if (indexPath.section==1) {
        return AUTO(56);
    }
    if (indexPath.section==2) {
        int row = ceil(self.detailModel.score_guess.count/6.0);
        return row*AUTO(48);
    }
    return UITableViewAutomaticDimension;
}



- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section<2) {
        return AUTO(8);
    }
    return 0.01f;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *footVew = [UIView new];
    footVew.backgroundColor = UIColorFromRGB(0xF5F5F5);
    return footVew;

}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    JCPoissonDataModelDetailTitleView *headView = [JCPoissonDataModelDetailTitleView new];
    if (section==0) {
        headView.titleLab.text = @"进攻防守实力";
    }
    if (section==1) {
        headView.titleLab.text = @"泊松分布预测";
    }
    if (section==2) {
        headView.titleLab.text = @"泊松预测比分概率";
    }
    return headView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {

    return AUTO(50);
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==0) {
        JCPoissonDataModelDetailAttackCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCPoissonDataModelDetailAttackCell"];
        if (indexPath.row==0) {
            cell.titleLab.text = @"场均进球";
            cell.dataArray = self.detailModel.goals_avg;
        }
        if (indexPath.row==1) {
            cell.titleLab.text = @"进攻能力";
            cell.dataArray = self.detailModel.attacking;
        }
        if (indexPath.row==2) {
            cell.titleLab.text = @"场均失球";
            cell.dataArray = self.detailModel.goals_against_avg;
        }
        if (indexPath.row==3) {
            cell.titleLab.text = @"防守能力";
            cell.dataArray = self.detailModel.defending;
        }
    //    JCMatchInfoModel *model = self.dataArray[indexPath.section];
    //    cell.model = model;

        return cell;
    }
    if (indexPath.section==1) {
        JCPoissonDataModelDetailDistributionCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCPoissonDataModelDetailDistributionCell"];
        cell.lineView.hidden = indexPath.row==0?NO:YES;
        if (indexPath.row==0) {
            cell.bf_array = self.detailModel.bi_fen;
        }else{
            cell.jqs_array = self.detailModel.jin_qiu_shu;
        }
        return cell;
    }
    if (indexPath.section==2) {
        JCPoissonDataModelDetailPredictCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCPoissonDataModelDetailPredictCell"];
        cell.dataArray = self.detailModel.score_guess;
        return cell;
    }

    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    return cell;
    
}

#pragma mark - ScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [super scrollViewDidScroll:scrollView];
    if (!self.hidetopMatch) {
        [self setNavEffect];
    }


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

- (JCPoissonDataModelDetailHeadView *)headView {
    if (!_headView) {
        _headView = [JCPoissonDataModelDetailHeadView new];
    }
    return _headView;
}

@end
