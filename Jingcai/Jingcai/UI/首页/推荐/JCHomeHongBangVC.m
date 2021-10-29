//
//  JCHomeHongBangVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/11/9.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCHomeHongBangVC.h"
#import "JCCommentCell.h"
#import "JCFamousExpertHeadView.h"
#import "JCShareView.h"
#import "JCHongbangWMstckyVC.h"
#import "JCHongbangCommomCell.h"
#import "JCMatchDetailWMStickVC.h"
#import "JCWTjInfoBall.h"
#import "JCFamousExpertCell.h"
#import "JCDakaPlanDetailStickWMVC.h"
#import "JCWMyHongbaoBall.h"
#import "JCTuiJianManager.h"
#import "JCJingCaiAIBigDataHomeVC.h"
@interface JCHomeHongBangVC ()

@property (nonatomic,strong) JCFamousExpertHeadView *headView;

@property (nonatomic,strong) JCShareView *shareView;

@property (nonatomic,strong) NSArray *tjDataArr;

@property (nonatomic,strong) NSString *end;

@property (nonatomic,strong) NSString *tuijianid;

@end

@implementation JCHomeHongBangVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    self.navigationBarStyle = JCNavigationBarStyleTransparent;
    [self setNavBackImg];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
//    self.navigationBarStyle = JCNavigationBarStyleDefault;
}

- (void)viewDidLoad {
    self.style = 1;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.title = @"红榜达人";
    [self initViews];
    [self refreshData];
    
}

- (void)refreshData {
    self.pageNo = 1;
    [self getDataList];
}

- (void)getDataList {
    
    [self.jcWindow showLoading];
    JCHomeService_New *service = [JCHomeService_New service];
    [service getHomeDataWithType:NonNil(self.type) page:self.pageNo success:^(id  _Nullable object) {
        [self endRefresh];
         if ([JCWJsonTool isSuccessResponse:object]) {
            if (self.pageNo==1) {
                [self.dataArray removeAllObjects];
            }

             NSArray *array = object[@"data"][@"recommend_article"];
             for (NSDictionary *dic in array) {
                 if (dic[@"base_info"][@"type"]) {
                     NSString *type = dic[@"base_info"][@"type"];//1公众号方案 2达人方案
                     if ([type integerValue]==1) {
                         JCWTjInfoBall *model = (JCWTjInfoBall *)[JCWJsonTool entityWithJson:dic[@"base_info"] class:[JCWTjInfoBall class]];
                         [self.dataArray addObject:model];
                     }
                     if ([type integerValue]==2) {
                         JCHongBangBall *model = (JCHongBangBall *)[JCWJsonTool entityWithJson:dic class:[JCHongBangBall class]];
                         [self.dataArray addObject:model];
                     }
                 }

             }
//            [self.dataArray addObjectsFromArray:array];
            [self.tableView reloadData];
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
        [self showNoDataView];
        [self.jcWindow endLoading];
    }];


       
}



- (void)initViews {

    self.view.backgroundColor = COLOR_F0F0F0;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    // 表格注册cell
    [self.tableView registerNib:[UINib nibWithNibName:@"JCCommentCell" bundle:nil] forCellReuseIdentifier:@"JCCommentCell"];
    [self.tableView registerClass:[JCHongbangCommomCell class] forCellReuseIdentifier:@"JCHongbangCommomCell"];
    [self.tableView registerClass:[JCFamousExpertCell class] forCellReuseIdentifier:@"JCFamousExpertCell"];
    self.tableView.estimatedRowHeight = 200;
//    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.left.right.top.equalTo(self.view);
//        make.bottom.equalTo(self.view).mas_offset(-kBottomTabSafeAreaHeight);
//    }];
    WeakSelf;
    JNDIYemptyView *emptyView = [JNDIYemptyView diyNoDataEmptyViewWithBlock:^{
        [weakSelf refreshData];
    }];
    self.tableView.ly_emptyView = emptyView;
    
    self.tableView.mj_header = [JCFootBallHeader headerWithRefreshingBlock:^{
        weakSelf.pageNo = 1;
        weakSelf.end = @"";
        weakSelf.tuijianid = @"";
        [weakSelf refreshData];
    }];
    
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [weakSelf getDataList];
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
    id model = self.dataArray[indexPath.section];
    if ([model isKindOfClass:[JCHongBangBall class]]) {
        JCHongbangCommomCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCHongbangCommomCell"];
        cell.lineView.hidden = YES;
        cell.dianPingBall = model;
        WeakSelf;
        cell.matchClickBlock = ^(NSString *matchNum) {
            JCMatchDetailWMStickVC * detailVC = [JCMatchDetailWMStickVC new];
            detailVC.matchNum = matchNum;
            [weakSelf.navigationController pushViewController:detailVC animated:YES];
        };
        cell.userClickBlock = ^(NSString * _Nullable tjUserId) {
            JCHongbangWMstckyVC * userVC = [JCHongbangWMstckyVC new];
            userVC.autherID = tjUserId;
            [weakSelf.navigationController pushViewController:userVC animated:YES];
        };
        
        return cell;
    }

    JCFamousExpertCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCFamousExpertCell"];
    cell.model = model;
    return cell;

    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    JCJingCaiAIBigDataHomeVC *vc = [JCJingCaiAIBigDataHomeVC new];
//    [self.navigationController pushViewController:vc animated:YES];
//    return;
    
    
    id model = self.dataArray[indexPath.section];
    if ([model isKindOfClass:[JCHongBangBall class]]) {

        JCHongBangBall * dianPingBall = (JCHongBangBall *)model;
        [JCTuiJianManager getTuiJianDetailWithTuiJianID:dianPingBall.base_info.tuijian_id orderID:@"" type:@"" WithViewController:self is_push:YES success:^{
            
        }];

        
    }else{
        // 查看需要登录
        if (![JCWUserBall currentUser]) {
            [self presentLogin];
            return ;
        }
        JCWTjInfoBall *tjBallModel = (JCWTjInfoBall *)model;
        [JCTuiJianManager loadGZH_ArticleDetailWithArticleID:tjBallModel.tuijian_id orderID:@"" type:@"" WithViewController:self is_push:YES];

    }

    
}


#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    id model = self.dataArray[indexPath.row];
//    if ([model isKindOfClass:[JCDianPingBall class]]) {
//
//    }
//    JCDianPingBall * dianPingBall = self.dataArray[indexPath.row];
//
////    return AUTO(130)+dianPingBall.match_data.count*AUTO(20)+10;
    return UITableViewAutomaticDimension;
}




- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *footView = [UIView new];
    footView.backgroundColor = COLOR_F0F0F0;
    return footView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return AUTO(8);
//    return 0.001;
}

#pragma mark lazyload


//分割线至顶部
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsMake(0, 15, 0, 15)];
    }
    //
}

#pragma mark DataRequest



- (JCFamousExpertHeadView *)headView {
    if (!_headView) {
        _headView = [JCFamousExpertHeadView new];
        _headView.isHongbang = YES;
    }
    return _headView;
}

- (JCShareView *)shareView {
    if (!_shareView) {
        _shareView = [JCShareView viewFromXib];
    }
    return _shareView;
}

@end
