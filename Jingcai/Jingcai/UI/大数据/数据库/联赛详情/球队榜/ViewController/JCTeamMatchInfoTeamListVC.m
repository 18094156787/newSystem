//
//  JCTeamMatchInfoTeamListVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/7.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCTeamMatchInfoTeamListVC.h"
#import "JCTeamMatchInfoTeamHeadView.h"
#import "JCTeamMatchInfoUserTypeCell.h"
#import "JCTeamMatchInfoTeamTableView.h"
#import "JCEventScorePlayerInfoModel.h"
@interface JCTeamMatchInfoTeamListVC ()

@property (nonatomic,strong) NSArray *dataSource;

@property (nonatomic,strong) JCTeamMatchInfoTeamHeadView *headView;

@property (nonatomic,strong) JCTeamMatchInfoTeamTableView *infoTableView;

@property (nonatomic,strong) JCEventScorePlayerInfoModel *selModel;//当前选中

@end

@implementation JCTeamMatchInfoTeamListVC

- (void)viewDidLoad {
    self.style = 1;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initViews];
    [self refreshData];
}
- (void)refreshData {
    [self.fatherView showLoading];
    
    JCDataBaseService_New *service = [JCDataBaseService_New new];
    [service getDataBaseEventPlayerOrTeamLeftInfoWithType:@"0" success:^(id  _Nullable object) {
        [self.fatherView endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
            NSArray *array = [JCWJsonTool arrayWithJson:object[@"data"] class:[JCEventScorePlayerInfoModel class]];
            [array enumerateObjectsUsingBlock:^(JCEventScorePlayerInfoModel  *obj, NSUInteger idx, BOOL * _Nonnull stop) {
                if (idx==0) {
                    obj.is_select = YES;
                    self.selModel = obj;
                    [self getDataListWithType:obj.field];
                    *stop = YES;
                }

            }];
            self.dataArray = [NSMutableArray arrayWithArray:array];

            [self.tableView reloadData];
            
            self.infoTableView.hidden  = self.dataArray.count==0?YES:NO;
            if (self.dataArray.count>0) {
                [self.view hideNoData];

            }else{
                [self.view showTopNoData];
            }

        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        [self.fatherView endLoading];
    }];
    

}

- (void)getDataListWithType:(NSString *)type {
    [self.fatherView showLoading];

    JCDataBaseService_New *service = [JCDataBaseService_New new];
    [service getDataBaseEventTeamListInfoWithCompetiton_id:self.event_id type:type season_id:NonNil(self.season_id) success:^(id  _Nullable object) {
        [self.fatherView endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
            NSArray *array = [JCWJsonTool arrayWithJson:object[@"data"] class:[JCEventScorePlayerModel class]];
            self.dataSource = [NSMutableArray arrayWithArray:array];
            self.infoTableView.dataArray = self.dataSource;

        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        [self.fatherView endLoading];
    }];


}

- (void)initViews {
    self.headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, AUTO(32));
    [self.view addSubview:self.headView];

    self.tableView.backgroundColor = COLOR_F0F0F0;
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

    [self.tableView registerClass:[JCTeamMatchInfoUserTypeCell class] forCellReuseIdentifier:@"JCTeamMatchInfoUserTypeCell"];

    
    
    
}

#pragma mark - Protocol
#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    JCTeamMatchInfoUserTypeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCTeamMatchInfoUserTypeCell"];
    cell.model = self.dataArray[indexPath.row];
    return cell;
}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return AUTO(40);
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    JCEventScorePlayerInfoModel *model = self.dataArray[indexPath.row];
    self.selModel.is_select = NO;
    model.is_select = YES;
    self.selModel = model;
//    self.infoTableView.dataArray = self.selModel.info;
    [self getDataListWithType:model.field];
    [self.tableView reloadData];
}


- (JCTeamMatchInfoTeamHeadView *)headView {
    if (!_headView) {
        _headView = [JCTeamMatchInfoTeamHeadView new];
    }
    return _headView;
}

- (JCTeamMatchInfoTeamTableView *)infoTableView {
    if (!_infoTableView) {
        _infoTableView = [JCTeamMatchInfoTeamTableView new];
    }
    return _infoTableView;
}

@end
