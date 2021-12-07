//
//  JCDatabaseViewController.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/6.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCDatabaseViewController.h"
#import "JCTeamMatchWMStickVC.h"
#import "JCDataBaseTitleHeadView.h"
#import "JCDatabaseAllMatchCell.h"
#import "JCDatabaseCommomMatchCell.h"
#import "JCTeamMatchWMStickVC.h"
#import "JCDataBaseAreaModel.h"
#import "JCDataBaseMatchModel.h"
#import "JCTeamDetailWMStickVC.h"
@interface JCDatabaseViewController ()

@property (nonatomic,strong) NSArray *areaArray;

@end

@implementation JCDatabaseViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationBarStyle = JCNavigationBarStyleDefault;
}


- (void)viewDidLoad {
    self.style = 1;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"资料库";
    [self initViews];
    [self getCache];
    [self refreshData];
}

- (void)refreshData {
    [self.view showLoading];
    JCDataBaseService_New *service = [JCDataBaseService_New new];
    [service getDataBaseHomeDataWithSuccess:^(id  _Nullable object) {
        [self endRefresh];
        if ([JCWJsonTool isSuccessResponse:object]) {
            NSData *data = [NSJSONSerialization dataWithJSONObject:object options:NSJSONWritingPrettyPrinted error:nil];
            [[NSUserDefaults standardUserDefaults] setObject:data forKey:JCBigData_Database];
            [self deathWithData:object];

        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        [self endRefresh];
    }];
}

- (void)deathWithData:(id)object {
    self.areaArray = [JCWJsonTool arrayWithJson:object[@"data"][@"block_name"] class:[JCDataBaseAreaModel class]];
    NSArray *dataArray = [JCWJsonTool arrayWithJson:object[@"data"][@"hot_match"] class:[JCDataBaseMatchModel class]];
    self.dataArray = [NSMutableArray arrayWithArray:dataArray];
    [self.tableView reloadData];
}

- (void)getCache {

    id object_data = [[NSUserDefaults standardUserDefaults] objectForKey:JCBigData_Database];
    id object = [JCWAppTool dictionaryForJsonData:object_data];
    if (object) {
        [self deathWithData:object];
    }
}

- (void)initViews {
    self.tableView.separatorInset = UIEdgeInsetsZero;
    self.tableView.separatorColor = COLOR_F4F6F9;
    [self.tableView registerClass:[JCDatabaseAllMatchCell class] forCellReuseIdentifier:@"JCDatabaseAllMatchCell"];
    [self.tableView registerClass:[JCDatabaseCommomMatchCell class] forCellReuseIdentifier:@"JCDatabaseCommomMatchCell"];
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, AUTO(20), 0);
    WeakSelf;
    self.tableView.mj_header = [JCFootBallHeader headerWithRefreshingBlock:^{
        [weakSelf refreshData];
    }];
    
}



#pragma mark - Protocol
#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section==0) {
        return self.areaArray.count>0?1:0;
    }
    
//    return self.dataArray.count;
    return self.dataArray.count>0?1:0;
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==0) {
        JCDatabaseAllMatchCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCDatabaseAllMatchCell"];
        cell.dataSource = self.areaArray;
        return cell;
    }
    JCDatabaseCommomMatchCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCDatabaseCommomMatchCell"];
    cell.dataSource = self.dataArray;
    return cell;
}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==0) {
        return AUTO(80);
    }
    NSInteger count = ceil(self.dataArray.count/3.0f);
    return AUTO(70)*count+AUTO(10);
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return self.areaArray.count>0?AUTO(49):0.001f;
    }
    if (section==1) {
        return self.dataArray.count>0?AUTO(49):0.001f;
    }
    return 0.001f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    JCDataBaseTitleHeadView *headView = [JCDataBaseTitleHeadView new];
    headView.titleLab.text = section==0?@"全部赛事":@"热门赛事";
//    headView.lineView.hidden = section==0?YES:NO;
    headView.lineView.hidden = YES;
    if (section==0&&self.areaArray.count>0) {
        return headView;
    }
    if (section==1&&self.dataArray.count>0) {
        return headView;
    }
    return [UIView new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section==0) {
        return AUTO(8);
    }
    return 0.001f;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *backView= [UIView new];
    backView.backgroundColor = section==0?COLOR_F4F6F9:JCClearColor;
    return backView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
//    JCTeamMatchWMStickVC *vc = [JCTeamMatchWMStickVC new];
//    JCDataBaseMatchModel *model = self.dataArray[indexPath.row];
//    vc.event_id = model.event_id;
//    [self.navigationController pushViewController:vc animated:YES];
//    
   
    
    
}

@end
