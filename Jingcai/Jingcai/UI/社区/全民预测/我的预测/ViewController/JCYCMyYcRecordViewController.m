//
//  JCYCMyYcRecordViewController.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/4/16.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCYCMyYcRecordViewController.h"
#import "JCYCMyYcRecordCell.h"
#import "JCMyZhanJiModel.h"
#import "JCYCMyYcPrizeHeadView.h"
#import "JCYCMyYcPrizeShowView.h"
@interface JCYCMyYcRecordViewController ()

@property (nonatomic,strong) JCYCMyYcPrizeHeadView *headView;

@property (nonatomic,strong) JCYCMyYcPrizeShowView *prizeView;

@property (nonatomic,strong) UIView *bottomView;

@property (nonatomic,strong) NSString *wx;

@end

@implementation JCYCMyYcRecordViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationBarStyle = JCNavigationBarStyleDefault;
    [self setNavBackImg];

}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationBarStyle = JCNavigationBarStyleDefault;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"我的战绩";
    self.view.backgroundColor = COLOR_F0F0F0;
    self.tableView.backgroundColor = JCClearColor;
    [self initViews];
    [self refreshData];
}

- (void)refreshData {
    self.pageNo = 1;
    [self getDataList];
}

- (void)getDataList {
    
    if (self.dataArray.count==0) {
        [self.view showLoading];
    }
    
    JCJingCaiService_New *service = [JCJingCaiService_New new];
    [service getUserZhanjiListWithType:@"1" userID:[JCWUserBall currentUser].id page:self.pageNo success:^(id  _Nullable object) {
        [self endRefresh];
     if ([JCWJsonTool isSuccessResponse:object]) {
         if (self.pageNo==1) {
             [self.dataArray removeAllObjects];
         }
//         self.wx = object[@"data"][@"wx"];
         NSString *all_total = object[@"data"][@"all_total"];
         if ([all_total intValue]==0) {
             all_total = @"0";
         }
         self.headView.price = all_total;
         NSArray *array = [NSArray yy_modelArrayWithClass:[JCMyZhanJiModel class] json:object[@"data"][@"total_list"]];
         [self.dataArray addObjectsFromArray:array];
         [self.tableView reloadData];
         if (array.count < PAGE_LIMIT) {
             [self.tableView.mj_footer endRefreshingWithNoMoreData];
         }
         self.pageNo++;
        
         [self chageImageStr:@"nodata_rank" Title:@"目前还没有上榜战绩，继续努力哟~~" BtnTitle:@"刷新"];;
     }else{
         [JCWToastTool showHint:object[@"msg"]];
     }
    } failure:^(NSError * _Nonnull error) {
        [self chageImageStr:@"nodata_rank" Title:@"目前还没有上榜战绩，继续努力哟~~" BtnTitle:@"刷新"];;
        [self endRefresh];
    }];

}

- (void)initViews {
    
    self.headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, AUTO(30));
    self.tableView.tableHeaderView = self.headView;
    
    self.tableView.separatorStyle = 0;
    [self.tableView registerClass:[JCYCMyYcRecordCell class] forCellReuseIdentifier:@"JCYCMyYcRecordCell"];
//    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.top.offset(0);
//        make.left.right.equalTo(self.view);
//        make.bottom.equalTo(self.view).offset(-kBottomTabSafeAreaHeight-AUTO(110));
//
//    }];
    
    WeakSelf;
    JNDIYemptyView *emptyView = [JNDIYemptyView diyNoDataEmptyViewWithBlock:^{
        [weakSelf refreshData];
    }];
    emptyView.contentViewOffset = AUTO(-100);
    self.tableView.ly_emptyView = emptyView;
    
    self.tableView.mj_header = [JCFootBallHeader headerWithRefreshingBlock:^{
        weakSelf.pageNo = 1;
        [weakSelf refreshData];
    }];
    
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [weakSelf refreshData];
    }];
    
    
    
//    UIView *bottomView = [UIView new];
//    bottomView.backgroundColor = JCWhiteColor;
//    bottomView.hidden = YES;
//    [self.view addSubview:bottomView];
//    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.bottom.equalTo(self.view);
//        make.height.mas_equalTo(AUTO(90));
//    }];
//    self.bottomView = bottomView;
//
//    UIButton *sureBtn = [UIButton initWithText:@"点击按钮 添加客服微信领奖" FontSize:AUTO(16) Weight:2 BackGroundColor:COLOR_EF2F2F TextColors:JCWhiteColor];
//    [sureBtn hg_setAllCornerWithCornerRadius:AUTO(28)];
//    [bottomView addSubview:sureBtn];
//    [sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.offset(AUTO(12));
//        make.right.offset(AUTO(-12));
//        make.top.offset(AUTO(15));
//        make.height.mas_equalTo(AUTO(52));
//    }];
//

}

#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dataArray.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    JCYCMyYcRecordCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCYCMyYcRecordCell"];
    cell.model = self.dataArray[indexPath.row];
    return cell;
}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return AUTO(150);
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.0001f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return [UIView new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.0001;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *backView= [UIView new];
    return backView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    JCMyZhanJiModel *model = self.dataArray[indexPath.row];
    if ([model.use intValue]==0) {
        self.prizeView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        self.prizeView.model = self.dataArray[indexPath.row];
        [[UIApplication sharedApplication].keyWindow addSubview:self.prizeView];
    }

}

- (JCYCMyYcPrizeHeadView *)headView {
    if (!_headView) {
        _headView = [JCYCMyYcPrizeHeadView new];
    }
    return _headView;
}

- (JCYCMyYcPrizeShowView *)prizeView {
    if (!_prizeView) {
        _prizeView = [JCYCMyYcPrizeShowView new];
    }
    return _prizeView;
}

@end
