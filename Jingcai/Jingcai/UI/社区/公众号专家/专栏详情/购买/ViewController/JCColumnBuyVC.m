//
//  JCColumnBuyVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/10/19.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCColumnBuyVC.h"
#import "JCColumnBuyHeadView.h"
#import "JCColumnDetailTitleHeadView.h"
#import "JCPayWayBall.h"
#import "JCBuyPlanPayWayCell.h"
#import "JCDakaBuyPlanProtocolCell.h"
#import "JCColumnBuySuccessView.h"
@interface JCColumnBuyVC ()

@property (nonatomic,strong) JCColumnBuyHeadView *headView;

@property (nonatomic,strong) UIButton *sureProtocolBtn;

@property (nonatomic,strong) UIView *bottomView;

@property (nonatomic, strong) UILabel *priceLab;

@property (nonatomic, strong) UIButton *sureBtn;

@property (nonatomic, strong) JCColumnBuySuccessView *buySuccessView;

@property (nonatomic,strong) NSMutableArray *payWayArray;

@end

@implementation JCColumnBuyVC
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
     self.navigationBarStyle = JCNavigationBarStyleDefault;
    [self setNavBackImgWhiteColor];
    UIImage *navImg =[UIImage imageNamed:@"JCColumnNav"];
      navImg = [navImg resizableImageWithCapInsets:UIEdgeInsetsZero resizingMode:UIImageResizingModeStretch];
    [self.navigationController.navigationBar setBackgroundImage:navImg forBarMetrics:UIBarMetricsDefault];
    if (@available(iOS 15.0, *)) {
        [self configNavBarImage:@"JCColumnNav"];
    }

}


- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    if (@available(iOS 15.0, *)) {
        [self configNavBarImageToNormal];
    }

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = COLOR_F0F0F0;
    // Do any additional setup after loading the view.
    self.title = @"确认订单";
    [self initViews];
    [self refreshData];
}

- (void)refreshData {

//    [self.   view showLoading];

    
//    JCHomeService_New *service = [JCHomeService_New new];
//    [service getGZHT_TuijianExpertDetailWithExpert_id:self.expertID type:@"2" page:self.pageNo Success:^(id  _Nullable object) {
//        if ([JCWJsonTool isSuccessResponse:object]) {
//            [self endRefresh];
//            if (self.pageNo==1) {
//                [self.dataArray removeAllObjects];
//            }
//            NSArray *array = [JCWJsonTool arrayWithJson:object[@"data"][@"best_new_plans"] class:[JCWTjInfoBall class]];
//
//            [self.dataArray addObjectsFromArray:array];
//            if (array.count < PAGE_LIMIT) {
//                [self.tableView.mj_footer endRefreshingWithNoMoreData];
//            }
//            [self.tableView reloadData];
//            self.pageNo++;
//
//
//
//        }else {
//            [JCWToastTool showHint:object[@"msg"]];
//        }
//    } failure:^(NSError * _Nonnull error) {
//
//        [self endRefresh];
//    }];
}
- (void)initViews {
    
    [self.view addSubview:self.bottomView];
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.offset(0);
        make.height.mas_equalTo(AUTO(76)+kBottomTabSafeAreaHeight);
    }];
    
    UIView *bottomView = [UIView new];
    [self.bottomView addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.offset(0);
        make.bottom.offset(-kBottomTabSafeAreaHeight);
    }];
    
    UILabel *titleLab = [UILabel initWithTitle:@"需支付：" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    [bottomView addSubview:titleLab];
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.centerY.equalTo(bottomView);
    }];
    [bottomView addSubview:self.priceLab];
    [self.priceLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(titleLab.mas_right).offset(0);
        make.centerY.equalTo(bottomView);
    }];
    
    [bottomView addSubview:self.sureBtn];
    [self.sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-15));
        make.centerY.equalTo(bottomView);
        make.size.mas_equalTo(CGSizeMake(AUTO(144), AUTO(48)));
    }];
    
    [self.tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
        make.left.right.equalTo(self.view);
        make.bottom.offset(AUTO(-80));
    }];
    
    self.headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, AUTO(192));
    self.tableView.tableHeaderView = self.headView;
    
    self.tableView.separatorInset = UIEdgeInsetsZero;
//    self.tableView.separatorStyle = 0;
    self.tableView.estimatedRowHeight = 80;
    // 表格注册cell
    [self.tableView registerClass:[JCBuyPlanPayWayCell class] forCellReuseIdentifier:@"JCBuyPlanPayWayCell"];
    [self.tableView registerClass:[JCDakaBuyPlanProtocolCell class] forCellReuseIdentifier:@"JCDakaBuyPlanProtocolCell"];
    
    WeakSelf;
    self.tableView.mj_header = [JCFootBallHeader headerWithRefreshingBlock:^{
        weakSelf.pageNo = 1;
        [weakSelf refreshData];
    }];

    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [weakSelf refreshData];
    }];
    
    JNDIYemptyView *emptyView = [JNDIYemptyView diyNoDataEmptyViewWithBlock:^{
        [weakSelf refreshData];
    }];
    self.tableView.ly_emptyView = emptyView;
    
    NSString *price = [NSString stringWithFormat:@"%@红币",@"688"];
    NSMutableAttributedString *price_attr = [[NSMutableAttributedString alloc]initWithString:price];
    NSRange price_range = [price rangeOfString:@"红币"];
    [price_attr addAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(12)],NSForegroundColorAttributeName:COLOR_2F2F2F} range:price_range];
    self.priceLab.attributedText = price_attr;
    

    
}

#pragma mark - Protocol
#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section==0) {
        return self.payWayArray.count;
    }
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==0) {
        JCBuyPlanPayWayCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCBuyPlanPayWayCell"];
        JCPayWayBall *payWayball = self.payWayArray[indexPath.row];
        cell.payWayball = payWayball;
        return cell;
    }
    
    
    JCDakaBuyPlanProtocolCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCDakaBuyPlanProtocolCell"];
    cell.contentView.backgroundColor = JCClearColor;
    cell.backgroundColor = JCClearColor;
    self.sureProtocolBtn = cell.sureProtocolBtn;
    return cell;
    
    
//    JCFootBallAuthorColumnCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCFootBallAuthorColumnCell"];
////    cell.model = model;
//    return cell;

    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section==0) {
        JCColumnDetailTitleHeadView *headView = [JCColumnDetailTitleHeadView new];
        headView.titleLab.text = @"购买方式";
        headView.lineView.hidden = NO;
        return headView;
    }
    return [UIView new];

}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section==0) {
        return AUTO(40);
    }
    return 0.01;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==0) {
        return AUTO(54);
    }
    return AUTO(40);
}

#pragma mark//购买

- (void)sureBtnClick {
    self.buySuccessView = [JCColumnBuySuccessView new];
    self.buySuccessView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    [self.jcWindow addSubview:self.buySuccessView];
    [self.navigationController popViewControllerAnimated:YES];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.buySuccessView removeFromSuperview];
    });
}

- (void)dealloc {
    
}

- (JCColumnBuyHeadView *)headView {
    if (!_headView) {
        _headView = [JCColumnBuyHeadView new];
    }
    return _headView;
}

- (UIView *)bottomView {
    if (!_bottomView) {
        _bottomView = [UIView new];
        _bottomView.backgroundColor = [UIColor whiteColor];
    }
    return _bottomView;
}

- (UILabel *)priceLab {
    if (!_priceLab) {
        _priceLab = [UILabel initWithTitle:@"" andFont:AUTO(26) andWeight:2 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _priceLab;
}

- (UIButton *)sureBtn {
    if (!_sureBtn) {
        _sureBtn = [UIButton initWithText:@"确认支付" FontSize:AUTO(16) Weight:2 BackGroundColor:JCBaseColor TextColors:JCWhiteColor];
        [_sureBtn hg_setAllCornerWithCornerRadius:AUTO(24)];
        [_sureBtn addTarget:self action:@selector(sureBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sureBtn;
}




- (NSMutableArray *)payWayArray {
    if (!_payWayArray) {
        _payWayArray = [NSMutableArray array];
        
//        JCPayWayBall * hongbaoBall = [[JCPayWayBall alloc] init];
//        hongbaoBall.title = @"红包抵扣";
//        hongbaoBall.payWay = JCPayWayEnumHongbao;
        
        
        //默认选中第一个
        JCPayWayBall * caiyunBall = [[JCPayWayBall alloc] init];
        caiyunBall.state_issel = YES;
        caiyunBall.payWay = JCPayWayEnumCaiyun;
        caiyunBall.title = @"红币支付";
//        self.selPayWay= caiyunBall;


//        [_payWayArray addObject:hongbaoBall];
        [_payWayArray addObject:caiyunBall];

    }
    return _payWayArray;
}
@end
