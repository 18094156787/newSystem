//
//  JNBasketBallMatchZS_DetailVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/7.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JNBasketBallMatchZS_DetailVC.h"
#import "JNBaksetBallMatchZS_ZSDetailInfoHeadView.h"
#import "JNBasketBallMatchZS_ZSDetailInfoTableView.h"
#import "JNMatchZS_ZSDetailInfoCell.h"
#import "JNMatchZS_PLModel.h"
@interface JNBasketBallMatchZS_DetailVC ()

@property (nonatomic,strong) JNBaksetBallMatchZS_ZSDetailInfoHeadView *headView;

@property (nonatomic,strong) JNBasketBallMatchZS_ZSDetailInfoTableView *infoTableView;

@property (nonatomic,strong)JNMatchZS_PLModel *selModel;

@property (nonatomic,strong) NSMutableArray *dataSource;

@end

@implementation JNBasketBallMatchZS_DetailVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    self.navigationBarStyle = JCNavigationBarStyleRed;
    [self setNavBackImg];
}

- (void)viewDidLoad {
//    self.style = 1;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"指数详情";
    [self initViews];
    [self getDataList];
}

- (void)refreshData {
    self.pageNo = 1;
    [self getDataList];
}

- (void)getDataList {
    WeakSelf;
    [self.jcWindow showLoading];
    JCBasketBallMatchService_New * service = [JCBasketBallMatchService_New service];//self.match_num
//    self.match_num = @"3492334";
    [service getBasketBallZhishuDetailWithMatch_id:self.match_num company_id:self.company_id type:self.type Success:^(id  _Nullable object) {
        [self.jcWindow endLoading];
        [self.infoTableView.tableView.mj_footer endRefreshing];
        if ([JCWJsonTool isSuccessResponse:object]) {
            [weakSelf.dataArray removeAllObjects];
            if (self.pageNo==1) {
                [self.dataSource removeAllObjects];
            }

            NSArray * dataArr = [JCWJsonTool arrayWithJson:object[@"data"] class:[JNMatchZS_PLModel class]];
            [weakSelf.dataArray addObjectsFromArray:dataArr];
            [weakSelf.dataArray enumerateObjectsUsingBlock:^(JNMatchZS_PLModel *obj, NSUInteger idx, BOOL * _Nonnull stop) {
                if ([obj.company_id isEqualToString:self.company_id]) {
//                    obj.is_select = YES;
                    [self.dataSource addObjectsFromArray:obj.detail];
                    weakSelf.infoTableView.dataArray = self.dataSource;
                    weakSelf.selModel = obj;
                    weakSelf.selModel.is_select = YES;
                    *stop = YES;
                    if (obj.detail.count < 10) {
                        [weakSelf.tableView.mj_footer endRefreshingWithNoMoreData];
                    }
                }
            }];

            if (!self.selModel) {
                if (weakSelf.dataArray.count>0) {
                    self.selModel = weakSelf.dataArray.firstObject;
                    self.selModel.is_select = YES;
                }
            }
            
//
            self.pageNo++;

            [weakSelf.tableView reloadData];

        }
    } failure:^(NSError * _Nonnull error) {
        [self.jcWindow endLoading];
    }];


}

- (void)initViews {
    self.headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, AUTO(32));
    [self.view addSubview:self.headView];
    if ([self.type integerValue]==4) {
        self.headView.windLab.text = @"客胜";
        self.headView.equalLab.text = @"指数";
        self.headView.loseLab.text = @"主胜";
    }
    if ([self.type integerValue]==3) {
        self.headView.windLab.text = @"客胜";
        self.headView.equalLab.text = @"";
        self.headView.loseLab.text = @"主胜";
    }
    if ([self.type integerValue]==5){
        self.headView.windLab.text = @"大分";
        self.headView.equalLab.text = @"指数";
        self.headView.loseLab.text = @"小分";
    }

    self.tableView.backgroundColor = COLOR_F4F6F9;
    self.tableView.separatorStyle = 0;
    [self.tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(32));
        make.left.equalTo(self.view);
        make.width.mas_equalTo(AUTO(90));
        if (@available(iOS 11.0, *)) {
            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        } else {
            make.bottom.equalTo(self.view);
            // Fallback on earlier versions
        }
    }];
    
    [self.view addSubview:self.infoTableView];
    [self.infoTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(32));
        make.right.equalTo(self.view);
        make.left.equalTo(self.tableView.mas_right);
        if (@available(iOS 11.0, *)) {
            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        } else {
            make.bottom.equalTo(self.view);
            // Fallback on earlier versions
        }
    }];

    [self.tableView registerClass:[JNMatchZS_ZSDetailInfoCell class] forCellReuseIdentifier:@"JNMatchZS_ZSDetailInfoCell"];
    
//    
//    self.infoTableView.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
//        [self getDataList];
//    }];

    
    
    
}

#pragma mark - Protocol
#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return self.dataArray.count;
    return self.dataArray.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    JNMatchZS_ZSDetailInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JNMatchZS_ZSDetailInfoCell"];
    JNMatchZS_PLModel *model = self.dataArray[indexPath.row];
    cell.model = model;
    return cell;
}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return AUTO(40);
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    JNMatchZS_PLModel *model = self.dataArray[indexPath.row];
//    self.selModel.is_select = NO;
//    model.is_select = YES;
//    self.selModel = model;
//    self.infoTableView.dataArray = model.info;
//    [self.tableView reloadData];
    JNMatchZS_PLModel *model = self.dataArray[indexPath.row];
    self.company_id =  model.company_id;
    [self refreshData];
}

- (JNBaksetBallMatchZS_ZSDetailInfoHeadView *)headView {
    if (!_headView) {
        _headView = [JNBaksetBallMatchZS_ZSDetailInfoHeadView new];
        _headView.type = [self.type integerValue];
    }
    return _headView;
}

- (JNBasketBallMatchZS_ZSDetailInfoTableView *)infoTableView {
    if (!_infoTableView) {
        _infoTableView = [JNBasketBallMatchZS_ZSDetailInfoTableView new];
        _infoTableView.type = [self.type integerValue];
//        _infoTableView.backgroundColor = COLOR_F0F0F0;
    }
    return _infoTableView;
}
- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}
@end
