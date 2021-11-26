//
//  JCTransactionDataModelDetailVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/12.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCTransactionDataModelDetailVC.h"

#import "JCTransactionDataModelDetailHeadView.h"
#import "JCTransactionDataModelDetailDataCell.h"
#import "JCTransactionDataModelDetailSameMatchCell.h"
#import "JCTransactionDataModelDetailZhiShuCell.h"
#import "JCPoissonDataModelDetailAttackCell.h"
#import "JCTransactionDataModelTitleView.h"
#import "JCTransactionDataModelAgainstTitleView.h"
#import "JCKellyDataDetailModel.h"

@interface JCTransactionDataModelDetailVC ()

@property (nonatomic,strong) JCTransactionDataModelDetailHeadView *headView;

@property (nonatomic,strong) UIView *topColorView;

@property (nonatomic,strong) JCKellyDataDetailModel *detailModel;

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

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self.topColorView removeAllSubviews];
    [self.topColorView removeFromSuperview];
    self.topColorView = nil;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
//      self.navigationBarStyle = JCNavigationBarStyleTransparent;
    self.topColorView.alpha = 0;
    [self.topColorView removeFromSuperview];

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
    [service getTransactionDataModeDetailWithMatch_id:self.match_id type:self.type Page:self.pageNo PageSize:@"20" Success:^(id  _Nullable object) {
        [self endRefresh];
        if ([JCWJsonTool isSuccessResponse:object]) {

            if (self.pageNo==1) {
                [self.dataArray removeAllObjects];
                self.detailModel = (JCKellyDataDetailModel *)[JCWJsonTool entityWithJson:object[@"data"] class:[JCKellyDataDetailModel class]];
                self.headView.model_id = self.model_id;
                self.headView.match_id = self.match_id;
                self.headView.model = self.detailModel;
            }
            NSArray *array = [JCWJsonTool arrayWithJson:object[@"data"][@"odds_list"] class:[JCTransactionDataOddsDetailModel class]];
            if (array.count < 20) {
                [self.tableView.mj_footer endRefreshingWithNoMoreData];
            }
            [self.dataArray addObjectsFromArray:array];
            if (self.pageNo>1&&array.count>0) {
                [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:3] withRowAnimation:UITableViewRowAnimationFade];
            }else{

                [self.tableView reloadData];
            }
            
            self.pageNo++;


        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        [self endRefresh];
    }];


}


- (void)initViews {

    UIButton *customView = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    [customView addTarget:self action:@selector(backItemClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:customView];
    
    
    self.headView.titleLab.text = @"异动详情";
    self.headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, AUTO(175)+kNavigationBarHeight);
    self.tableView.tableHeaderView = self.headView;
    
   
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

//    JNDIYemptyView *emptyView = [JNDIYemptyView diyNoDataEmptyViewWithBlock:^{
//        [weakSelf refreshData];
//    }];
//    emptyView.contentViewOffset = 0;
//    self.tableView.ly_emptyView = emptyView;

    WeakSelf;
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [weakSelf refreshData];
    }];
 

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
        if (self.detailModel.same_initial_compensation.count>0) {
            return 1;
        }
        return 0;
    }
    if (section==2) {
        
       
        return self.detailModel.data_contrast.count;
    }


    return 1;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==0) {
        NSInteger height = self.detailModel.compare_odds.count>=2?AUTO(30):0;
        return height+self.detailModel.odds_change_list.count*AUTO(35);
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
        if (!self.detailModel) {
            return 1000;
        }
        return AUTO(30)*self.dataArray.count+AUTO(40);
    }
    
    return UITableViewAutomaticDimension;
}



- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section==1) {
        if(self.detailModel.same_initial_compensation.count==0){
            return 0.01f;
        }
    }
    if (section==2) {
        if(self.detailModel.data_contrast.count==0){
            return 0.01f;
        }
    }
    if (section==3) {
        return 0.01f;
    }
    return AUTO(8);
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *footVew = [UIView new];
    footVew.backgroundColor = COLOR_F0F0F0;
    return footVew;

}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {

    JCTransactionDataModelTitleView *headView = [JCTransactionDataModelTitleView new];
    headView.detailView.hidden = YES;
    headView.infoLab.text = @"";
    if (section==0) {
        headView.titleLab.text = @"异动数据";
//        headView.inf
    }
    if (section==1) {
        
        if(self.detailModel.same_initial_compensation.count==0){
            return [UIView new];
        }
//
        if (self.detailModel.same_initial_compensation.count>0) {
            JCHistoryPayDataModel *model = self.detailModel.same_initial_compensation.firstObject;

            if ([self.type integerValue]==1) {
                headView.infoLab.text = [NSString stringWithFormat:@"初指 %@ %@ %@",model.last_odds.won,model.last_odds.draw,model.last_odds.loss];
            }else{
                NSString *equal = [NSString stringWithFormat:@" (%@) ",model.last_odds.draw];
                NSMutableAttributedString *equalAttr = [[NSMutableAttributedString alloc] initWithString:equal];
                NSRange range = [equal rangeOfString:model.last_odds.draw];
                if (range.location!=NSNotFound) {
                    [equalAttr addAttributes:@{NSForegroundColorAttributeName:UIColorFromRGB(0x0050D0)} range:range];
                }
                NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:@"初指 "];
                [attr appendString:model.last_odds.won];
                [attr appendAttributedString:equalAttr];
                [attr appendString:model.last_odds.loss];
                headView.infoLab.attributedText = attr;
            }
        }
        headView.titleLab.text = @"初指相同的比赛";
    }
    if (section==2) {
        if (self.detailModel.data_contrast.count==0) {
            return [UIView new];
        }
        JCTransactionDataModelAgainstTitleView *againstView = [JCTransactionDataModelAgainstTitleView new];
        againstView.titleLab.text = @"数据对比";
        return againstView;
    }
    if (section==3) {
        if (self.dataArray.count==0) {
            return [UIView new];
        }
        headView.titleLab.text = @"指数详情";
    }

    
    return headView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section==1) {
        if(self.detailModel.same_initial_compensation.count==0){
            return 0.01;
        }
    }
    if (section==2) {
        if(self.detailModel.data_contrast.count==0){
            return 0.01;
        }
    }
    if (section==3) {
        if (self.dataArray.count==0) {
            return 0.01f;
        }
    }
    return AUTO(40);
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==0) {
        JCTransactionDataModelDetailDataCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCTransactionDataModelDetailDataCell"];
        cell.type = self.type;
        
        cell.dataArray = self.detailModel.compare_odds;
        cell.detailModel = self.detailModel;
        return cell;
    }
    if (indexPath.section==1) {
        JCTransactionDataModelDetailSameMatchCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCTransactionDataModelDetailSameMatchCell"];
        cell.type = self.type;
        cell.dataArray = self.detailModel.same_initial_compensation;
        return cell;
    }
    if (indexPath.section==2) {
        
        JCPoissonDataModelDetailAttackCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCPoissonDataModelDetailAttackCell"];
        cell.againstModel = self.detailModel.data_contrast[indexPath.row];
        return cell;
    }
    
    if (indexPath.section==3) {
        
        JCTransactionDataModelDetailZhiShuCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCTransactionDataModelDetailZhiShuCell"];
        cell.type = self.type;
        cell.dataArray = self.dataArray;
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
    if (percent>=0.98) {
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
