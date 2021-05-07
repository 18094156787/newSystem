//
//  JCTeamDetailMatchListVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/16.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCTeamDetailMatchListVC.h"
#import "JCTeamMatchInfoMatchCell.h"
#import "JCTeamDetailMatchHeadView.h"
#import "ZJPickerView.h"
#import "JCTeamMatchInfoMatchHeadView.h"
#import "JCTeamMatchInfoMatchContentCell.h"
#import "JCTeamMatchInfoModel.h"
#import "JCTeamMatchTimeInfoModel.h"
#import "JCTeamMatchWMStickVC.h"
#import "JCTeamDetailMatchTitleHeadView.h"
@interface JCTeamDetailMatchListVC ()

@property (nonatomic,strong) JCTeamDetailMatchHeadView *headView;

@property (nonatomic,strong) NSMutableArray *dataSource;

@property (nonatomic,strong) NSString *match_id;//当前的联赛id

@property (nonatomic,assign) JCTeamMatchInfoModel *firstMatchModel;

@property (nonatomic,assign) JCTeamMatchInfoModel *selMatchModel;

@property (nonatomic,strong) JCTeamMatchInfoModel *moreFirsrtMatchModel;

@end

@implementation JCTeamDetailMatchListVC

- (void)viewDidLoad {
    self.style = 1;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.match_id = @"0";
    [self initViews];
    [self refreshData];
    [ZJPickerView clear];

}


- (void)refreshData{
    [self.fatherView showLoading];
    JCDataBaseService_New *service = [JCDataBaseService_New new];//self.team_id
    [service getDataBaseTeam_MatchListWithTeam_id:self.team_id page:self.pageNo Success:^(id  _Nullable object) {
        [self.fatherView endLoading];
        [self endRefresh];
        if ([JCWJsonTool isSuccessResponse:object]) {
            if (self.pageNo==1) {
                [self.dataArray removeAllObjects];
                [self.dataSource removeAllObjects];
            }
            

            NSMutableArray *dataArray = [NSMutableArray array];
            NSArray *array0 = object[@"data"];
            for (int i=0; i<array0.count; i++) {
                NSDictionary *dic = array0[i];
                JCTeamMatchInfoModel *model = (JCTeamMatchInfoModel *)[JCWJsonTool entityWithJson:dic[@"match_info"] class:[JCTeamMatchInfoModel class]];
                [dataArray addObject:model];
            }
            [dataArray enumerateObjectsUsingBlock:^(JCTeamMatchInfoModel  * infoModel, NSUInteger idx, BOOL * _Nonnull stop) {
            
                if (idx==0&&!self.selMatchModel) {
                    self.selMatchModel = infoModel;
                    [self.dataArray addObject:infoModel];
    //
                }else{
                    //如果跟上一个记录的相等,说明已经在数组里面了,不用重复添加
                    if ([self.selMatchModel.competition_info.competition_id integerValue]==[infoModel.competition_info.competition_id integerValue]) {
                        NSMutableArray *array = self.selMatchModel.match_list;
                        [array addObjectsFromArray:infoModel.match_list];
                        infoModel.match_list = [NSMutableArray arrayWithArray:array];
//                        self.selMatchModel = infoModel;
//                        [self.dataArray removeObject:infoModel];
                        self.selMatchModel = infoModel;
                        
                    }else{
                        self.selMatchModel = infoModel;
                        [self.dataArray addObject:infoModel];
                    }
                   
                }
            }];
            
//            [self.dataArray addObjectsFromArray:dataArray];

            
//            [JCWJsonTool arrayWithJson:object[@"data"][@"match"] class:[JCTeamMatchModel class]];//JCTeamMatchInfoModel
//            [array enumerateObjectsUsingBlock:^(JCTeamMatchModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
////                obj.match_status = obj.status_desc;
//                if (idx==0&&!self.selMatchModel) {
//
//                    JCTeamMatchInfoModel *infoModel = [JCTeamMatchInfoModel new];
//                    NSMutableArray *matchArray = [NSMutableArray array];
//                    [matchArray addObject:obj];
//                    infoModel.title = obj.event_name;
//                    infoModel.event_id = obj.event_id;
//                    infoModel.event_logo = obj.event_logo;
//                    infoModel.match = matchArray;
//                    [dataArray addObject:infoModel];
//                    self.selMatchModel = infoModel;
//                    self.firstMatchModel = infoModel;
////
//                }else{
//
//                    if ([self.selMatchModel.title isEqualToString:obj.event_name]) {
//                        [self.selMatchModel.match addObject:obj];
//                    }else{
//                        JCTeamMatchInfoModel *infoModel = [JCTeamMatchInfoModel new];
//                        NSMutableArray *matchArray = [NSMutableArray array];
//                        [matchArray addObject:obj];
//                        infoModel.title = obj.event_name;
//                        infoModel.event_id = obj.event_id;
//                        infoModel.event_logo = obj.event_logo;
//                        infoModel.match = matchArray;
//                        [dataArray addObject:infoModel];
//                        self.selMatchModel = infoModel;
//                    }
//
//                }
//            }];
            
//            [self.dataArray addObjectsFromArray:dataArray];
//            [self.dataSource addObjectsFromArray:dataArray];
            
//            return;
            [self.tableView reloadData];
            self.pageNo++;
            if (dataArray.count <=0) {
                [self.tableView.mj_footer endRefreshingWithNoMoreData];
            }
            if (self.dataArray.count>0) {
                [self.tableView hideNoData];

            }else{
                [self.tableView showTopNoData];
            }
            

        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        [self.fatherView endLoading];
    }];

}

- (void)initViews {

    self.tableView.separatorStyle = 0;
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(10));
    }];
//    self.tableView.separatorColor = COLOR_F4F6F9;
    [self.tableView registerClass:[JCTeamMatchInfoMatchContentCell class] forCellReuseIdentifier:@"JCTeamMatchInfoMatchContentCell"];

    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self refreshData];
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

    JCTeamMatchInfoMatchContentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCTeamMatchInfoMatchContentCell"];
//    cell.isCircle = indexPath.row==4?NO:YES;
    JCTeamMatchInfoModel *model = self.dataArray[indexPath.section];
    cell.dataArray = model.match_list;
    return cell;
}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    JCTeamMatchInfoModel *model = self.dataArray[indexPath.section];
    return AUTO(75)*model.match_list.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return AUTO(32);
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    JCTeamDetailMatchTitleHeadView *headView = [JCTeamDetailMatchTitleHeadView new];
    JCTeamMatchInfoModel *model = self.dataArray[section];
    headView.titleLab.text = model.competition_info.name_zh;
    [headView.iconImgView sd_setImageWithURL:[NSURL URLWithString:model.competition_info.logo]];
    WeakSelf;
    [headView bk_whenTapped:^{
        JCTeamMatchWMStickVC *vc = [JCTeamMatchWMStickVC new];
        vc.competition_id = model.competition_info.competition_id;
        [weakSelf.navigationController pushViewController:vc animated:YES];

    }];
    
    
    
    return headView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {

    return AUTO(10);
    
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *backView= [UIView new];
    backView.backgroundColor = JCClearColor;
    return backView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (JCTeamDetailMatchHeadView *)headView {
    if (!_headView) {
        _headView = [JCTeamDetailMatchHeadView new];
    }
    return _headView;
}

- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}


@end
