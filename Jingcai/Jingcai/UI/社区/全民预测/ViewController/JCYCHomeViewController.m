//
//  JCYCHomeViewController.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/3/27.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCYCHomeViewController.h"
#import "JCYCCountHeadView.h"
#import "JCParticipateSingleJingCaiCell.h"
#import "JCYCHomeMatchSelectView.h"
#import "JCEventInfoModel.h"
#import "JCDiXianFootView.h"
//#import "JCYCMyFriendViewController.h"
//#import "JCYCHongBaoWMVC.h"
@interface JCYCHomeViewController ()

@property (nonatomic,strong) JCYCHomeMatchSelectView *matchSelectView;

@property (nonatomic,strong) JCJingCaiMatchModel *currentJingModel;

@property (nonatomic,strong) NSArray *eventArray;

@property (nonatomic,strong) JCEventInfoModel *currentEventModel;//当前选择的联赛

@property (nonatomic, strong) JCDiXianFootView *footView;

@end

@implementation JCYCHomeViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    self.navigationBarStyle = JCNavigationBarStyleDefault;

}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
//    self.navigationBarStyle = JCNavigationBarStyleDefault;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"全民鲸猜";
    self.view.backgroundColor = COLOR_F0F0F0;
    [self initViews];
    
    [self refreshData];
}

- (void)refreshData {
    self.pageNo = 1;
    [self getDataList];
//    [self getEventListWithShow:NO];
}

- (void)getDataList {
    [self.jcWindow showLoading];
    JCJingCaiService_New *service = [JCJingCaiService_New service];
    NSString *competition_id = @"0";
    if (self.currentEventModel.competition_id) {
        competition_id = self.currentEventModel.competition_id;
    }
//
    [service getJingcaiHomeDataWithCompetition_id:competition_id page:self.pageNo success:^(id  _Nullable object) {
        [self endRefresh];
        [self.fatherView endLoading];
        if (self.JCEndRefreshBlock) {
            self.JCEndRefreshBlock();
        }
       if ([JCWJsonTool isSuccessResponse:object]) {
           if (self.pageNo==1) {
//               [self.btnArray removeAllObjects];
               [self.dataArray removeAllObjects];
           }
           NSArray *event_array = [NSArray yy_modelArrayWithClass:[JCEventInfoModel class] json:object[@"data"][@"competition_list"]];
           JCEventInfoModel *baseModel = [JCEventInfoModel new];
           baseModel.competition_name = @"全部比赛";
           baseModel.event_id = @"0";
           NSMutableArray *baseArray = [NSMutableArray arrayWithObject:baseModel];
           [baseArray addObjectsFromArray:event_array];
           self.eventArray = [NSArray arrayWithArray:baseArray];
           self.matchSelectView.dataArray = self.eventArray;
           
           
           NSArray *array = [NSArray yy_modelArrayWithClass:[JCJingCaiMatchModel class] json:object[@"data"][@"match_info"]];
           [array enumerateObjectsUsingBlock:^(JCJingCaiMatchModel *obj, NSUInteger idx, BOOL * _Nonnull stop) {
               if (obj.home_rate.count==4) {
                   JCJingCaiMatchInfoModel *noRq = [JCJingCaiMatchInfoModel new];
                   NSString *rq = [NSString stringWithFormat:@"%@",obj.home_rate[0]];
                   NSString *win = [NSString stringWithFormat:@"%@",obj.home_rate[1]];
                   NSString *equal = [NSString stringWithFormat:@"%@",obj.home_rate[2]];
                   NSString *lose = [NSString stringWithFormat:@"%@",obj.home_rate[3]];
                   noRq.rq = rq;
                   noRq.win = win;
                   noRq.equal = equal;
                   noRq.lose = lose;
                   obj.noRq = noRq;
               }
               if (obj.away_rate.count==4) {
                   JCJingCaiMatchInfoModel *rq_object = [JCJingCaiMatchInfoModel new];
                   NSString *rq = [NSString stringWithFormat:@"%@",obj.away_rate[0]];
                   NSString *win = [NSString stringWithFormat:@"%@",obj.away_rate[1]];
                   NSString *equal = [NSString stringWithFormat:@"%@",obj.away_rate[2]];
                   NSString *lose = [NSString stringWithFormat:@"%@",obj.away_rate[3]];
                   rq_object.rq = rq;
                   rq_object.win = win;
                   rq_object.equal = equal;
                   rq_object.lose = lose;
                   obj.Rq = rq_object;
               }
               
               
               if (obj.noRq||obj.Rq) {
                   [self.dataArray addObject:obj];
               }
           }];

           [self.tableView reloadData];
           
           if (self.JCBlock) {
               self.JCBlock(self.dataArray);
           }
           if (array.count < PAGE_LIMIT) {
               [self.tableView.mj_footer endRefreshingWithNoMoreData];

           }
           if (array.count < PAGE_LIMIT&&self.dataArray.count>0) {
               self.tableView.tableFooterView = self.noMore_footView;
               self.tableView.mj_footer.hidden = YES;
           }else{
               self.tableView.tableFooterView = [UIView new];
               self.tableView.mj_footer.hidden = NO;
           }
           
           self.pageNo++;
           [self showNoDataView];
       }else{
           [JCWToastTool showHint:object[@"msg"]];
       }

    } failure:^(NSError * _Nonnull error) {
        [self endRefresh];
        [self.jcWindow endLoading];
        [self showNoDataView];
        if (self.JCEndRefreshBlock) {
            self.JCEndRefreshBlock();
        }
    }];


}

- (void)initViews {
    
    self.headView.frame = CGRectMake(0, 0, SCREEN_WIDTH-AUTO(30), AUTO(65));
    
    self.tableView.tableHeaderView= self.headView;
    self.tableView.separatorColor = COLOR_F0F0F0;
    self.tableView.separatorInset = UIEdgeInsetsZero;
    self.tableView.estimatedRowHeight = 150;
    [self.tableView registerClass:[JCParticipateSingleJingCaiCell class] forCellReuseIdentifier:@"JCParticipateSingleJingCaiCell"];
    
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(AUTO(15));
        make.right.equalTo(self.view).offset(AUTO(-15));
        make.bottom.offset(-kTabBarHeight-10);
    }];
    
    
//    UIView *footView = [UIView new];
//    footView.frame = CGRectMake(0, 0, SCREEN_WIDTH,kTabBarHeight+110+kBottomTabSafeAreaHeight);
//    footView.backgroundColor = COLOR_F0F0F0;
//    self.tableView.tableFooterView = footView;
//    self.footView = footView;
    
    JNDIYemptyView *emptyView = [JNDIYemptyView diyNoDataEmptyViewWithBlock:^{
        [self refreshData];
    }];
    emptyView.contentViewOffset = 40;
    self.tableView.ly_emptyView = emptyView;

    [self.headView.selectBtn addTarget:self action:@selector(showMatchSelectView) forControlEvents:UIControlEventTouchUpInside];
    
    MJRefreshFooter *mj_foot = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self getDataList];
    }];
    self.tableView.mj_footer = mj_foot;
//    mj_foot.tit
}



#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JCParticipateSingleJingCaiCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCParticipateSingleJingCaiCell"];
    cell.selectionStyle = 0;
    JCJingCaiMatchModel *model = self.dataArray[indexPath.row];
    cell.JCJingcaiBlock = ^(NSMutableArray * _Nonnull btnArray) {
//        self.btnArray = btnArray;
        self.currentJingModel = model;
        if (self.JCBlock) {
            self.JCBlock(self.dataArray);
        }
        NSMutableArray *array = [NSMutableArray array];

        [self.dataArray enumerateObjectsUsingBlock:^(JCJingCaiMatchModel *model, NSUInteger idx, BOOL * _Nonnull stop) {
            if (model.isSelect) {
                [array addObject:model];
     
            }
        }];

    };

    cell.model = model;
    cell.dataArray = self.dataArray;
    return cell;

}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return UITableViewAutomaticDimension;
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
    
}

- (void)showMatchSelectView {
    if (self.eventArray.count>0) {
        [[UIApplication sharedApplication].windows.lastObject addSubview:self.matchSelectView];
        [self.matchSelectView show];
    }

}

- (void)setSettingModel:(JCYuceSettingModel *)settingModel {
    _settingModel =settingModel;
    self.headView.settingModel = settingModel;
}

- (JCYCCountHeadView *)headView {
    if (!_headView) {
        _headView = [JCYCCountHeadView new];
    }
    return _headView;
}

- (void)setHideShowInfo:(BOOL)hideShowInfo {
    _hideShowInfo = hideShowInfo;
    if (hideShowInfo) {
        [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view).offset(AUTO(15));
            make.right.equalTo(self.view).offset(AUTO(-15));
            make.bottom.offset(-kTabBarHeight-10);
        }];
    }else{
        [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view).offset(AUTO(15));
            make.right.equalTo(self.view).offset(AUTO(-15));
            make.bottom.offset(-100-kTabBarHeight);
        }];
    }
}

- (JCYCHomeMatchSelectView *)matchSelectView {
    if (!_matchSelectView) {
        _matchSelectView = [JCYCHomeMatchSelectView new];
        _matchSelectView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        WeakSelf;
        _matchSelectView.JCTitleBlock = ^(JCEventInfoModel * _Nonnull model) {
            weakSelf.currentEventModel = model;
            if (model.competition_name.length>4) {
                [weakSelf.headView.selectBtn setTitle:[model.competition_name substringToIndex:4] forState:0];
            }else{
                [weakSelf.headView.selectBtn setTitle:model.competition_name forState:0];

            }
            
            [weakSelf refreshData];
            
        };

    }
    return _matchSelectView;
}

- (JCDiXianFootView *)footView {
    if (!_footView) {
        _footView = [JCDiXianFootView new];
    }
    return _footView;
}
@end
