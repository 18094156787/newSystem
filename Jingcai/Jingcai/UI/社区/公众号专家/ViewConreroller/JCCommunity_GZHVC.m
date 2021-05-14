//
//  JCCommunity_GZHVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/10/27.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCCommunity_GZHVC.h"
#import "JCFootBallAuthorHistoryPlaneCell.h"
#import "JCCommunity_GZH_HeadView.h"
#import "JCFamousExpertCell.h"
#import "JCDakaPlanDetailStickWMVC.h"
#import "JCWMyHongbaoBall.h"
@interface JCCommunity_GZHVC ()

@property (nonatomic,strong) JCCommunity_GZH_HeadView *headView;

@property (nonatomic,strong) NSString *end;

@property (nonatomic,strong) NSString *tuijianid;

@end

@implementation JCCommunity_GZHVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    self.navigationBarStyle = JCNavigationBarStyleDefault;
    [self setNavBackImg];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
//    self.navigationBarStyle = JCNavigationBarStyleDefault;
}


- (void)viewDidLoad {
    self.style = 1;
    [super viewDidLoad];
    self.view.backgroundColor = JCWhiteColor;
    // Do any additional setup after loading the view.
    self.end = @"";
    self.tuijianid = @"";
    self.title = @"公众号专家";
    [self initViews];
    [self getCache];
    [self refreshData];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshData) name:NotificationUserLogin object:nil];
}

- (void)refreshData {

    [self.jcWindow showLoading];
    JCCommunityService_New *service = [JCCommunityService_New service];
    [service getDakaExpertLsitWithPage:self.pageNo success:^(id  _Nullable object) {
        [self endRefresh];
        if ([JCWJsonTool isSuccessResponse:object]) {
            if (self.pageNo==1) {
 
                
                NSData *data = [NSJSONSerialization dataWithJSONObject:object options:NSJSONWritingPrettyPrinted error:nil];
                [[NSUserDefaults standardUserDefaults] setObject:data forKey:JCCommunity_GZH];
                
                [self.dataArray removeAllObjects];
                
                NSArray *expertArray = [JCWJsonTool arrayWithJson:object[@"data"][@"expert_info"] class:[JCWExpertBall class]];
                NSMutableArray *array = [NSMutableArray arrayWithArray:expertArray];
                
                if (array.count==0) {
                    self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0.01)];
                }else{
                    self.headView.dataSource = array;
                    self.tableView.tableHeaderView = self.headView;
                }
            }
            
            NSArray *array = [JCWJsonTool arrayWithJson:object[@"data"][@"expert_list"] class:[JCWTjInfoBall class]];
            
            [self.dataArray addObjectsFromArray:array];
            if (array.count < PAGE_LIMIT) {
                [self.tableView.mj_footer endRefreshingWithNoMoreData];
            }
            [self showNoDataView];
            [self.tableView reloadData];
            self.pageNo++;
            NSLog(@"数据%@",self.dataArray);
            

        }
    } failure:^(NSError * _Nonnull error) {
        [self endRefresh];
    }];

}




- (void)getCache {
    id object_data = [[NSUserDefaults standardUserDefaults] objectForKey:JCCommunity_GZH];
    id object = [JCWAppTool dictionaryForJsonData:object_data];
    if (object) {
        [self deathWithData:object];
    }
}

- (void)deathWithData:(id)object {
    NSArray *expertArray = [JCWJsonTool arrayWithJson:object[@"data"][@"expert_info"] class:[JCWExpertBall class]];
    NSMutableArray *array = [NSMutableArray arrayWithArray:expertArray];
    self.headView.dataSource = array;
}


- (void)initViews {
    
    self.headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, AUTO(208));
//    self.tableView.tableHeaderView = self.headView;
    
    self.tableView.separatorInset = UIEdgeInsetsZero;
    self.tableView.separatorStyle = 0;
    self.tableView.estimatedRowHeight = 80;
    // 表格注册cell
    [self.tableView registerClass:[JCFamousExpertCell class] forCellReuseIdentifier:@"JCFamousExpertCell"];

    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.view);
        make.bottom.equalTo(self.view);
    }];
    WeakSelf;
    JNDIYemptyView *emptyView = [JNDIYemptyView diyNoDataEmptyViewWithBlock:^{
        [weakSelf refreshData];
    }];
    self.tableView.ly_emptyView = emptyView;
    
    //
    self.tableView.mj_header = [JCFootBallHeader headerWithRefreshingBlock:^{
        weakSelf.end = @"";
        weakSelf.tuijianid = @"";
        weakSelf.pageNo = 1;
        [weakSelf refreshData];
        if (weakSelf.JCRefreshBlock) {
            weakSelf.JCRefreshBlock();
        }
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
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [UIView new];
    view.backgroundColor = COLOR_F0F0F0;
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return AUTO(8);
}

//- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
//    UIView *view = [UIView new];
//    view.backgroundColor = COLOR_F6F6F6;
//    return view;
//}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
//    return AUTO(5);
//}

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

- (JCCommunity_GZH_HeadView *)headView {
    if (!_headView) {
        _headView = [JCCommunity_GZH_HeadView new];
    }
    return _headView;
}

@end
