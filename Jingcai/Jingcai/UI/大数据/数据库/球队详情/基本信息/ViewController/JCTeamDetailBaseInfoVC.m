//
//  JCTeamDetailBaseInfoVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/13.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCTeamDetailBaseInfoVC.h"
#import "JCTeamMatchInfoPlanView.h"
#import "JCDataBaseTitleHeadView.h"
#import "JCTeamDetailBaseInfoCell.h"
#import "JCTeamDetailZhuanHuiCell.h"
#import "JCTeamDetailHonorCell.h"
#import "JCTeamDetailHonorShowView.h"
#import "JCTeamMatchModel.h"
#import "JCTeamMatchInfoPlanCell.h"
#import "JCTeamMatchBaseInfoModel.h"
#import "JCTeamDetailInfoZhuanHuiModel.h"
#import "JCTeamDetailInfoHonorModel.h"
#import "JCMatchDetailWMStickVC.h"
#import "JCTeamMatchTeamInfoModel.h"
@interface JCTeamDetailBaseInfoVC ()

@property (nonatomic,strong) JCTeamMatchModel *matchModel;

@property (nonatomic,strong) JCTeamMatchTeamInfoModel *teamModel;

@property (nonatomic,strong) NSMutableArray *statisticsArray;

@property (nonatomic,strong) JCTeamDetailInfoZhuanHuiModel *zhuanRuModel;

@property (nonatomic,strong) JCTeamDetailInfoZhuanHuiModel *zhuanChuModel;

@property (nonatomic,strong) NSArray *honorArray;;//球队荣誉

@end

@implementation JCTeamDetailBaseInfoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initViews];
    [self refreshData];
}

- (void)initViews {

    self.tableView.separatorColor = COLOR_F4F6F9;
    [self.tableView registerClass:[JCTeamMatchInfoPlanCell class] forCellReuseIdentifier:@"JCTeamMatchInfoPlanCell"];
    [self.tableView registerClass:[JCTeamDetailBaseInfoCell class] forCellReuseIdentifier:@"JCTeamDetailBaseInfoCell"];
    [self.tableView registerClass:[JCTeamDetailHonorCell class] forCellReuseIdentifier:@"JCTeamDetailHonorCell"];
    [self.tableView registerClass:[JCTeamDetailZhuanHuiCell class] forCellReuseIdentifier:@"JCTeamDetailZhuanHuiCell"];

    
    
    
}

- (void)refreshData {
    [self.fatherView showLoading];
//    self.team_id = @"10107";
    JCDataBaseService_New *service = [JCDataBaseService_New new];
    [service getDataBaseTeamInfoWithTeam_id:self.team_id Success:^(id  _Nullable object) {
        [self.fatherView endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
            self.statisticsArray = [NSMutableArray array];
            NSDictionary *match_info = object[@"data"][@"match_info"];
            self.matchModel = (JCTeamMatchModel *)[JCWJsonTool entityWithJson:match_info class:[JCTeamMatchModel class]];

            
//            self.statisticsArray = [JCWJsonTool arrayWithJson:object[@"data"][@"statistics"] class:[JCTeamMatchBaseInfoModel class]];

            self.honorArray = [JCWJsonTool arrayWithJson:object[@"data"][@"team_honor"] class:[JCTeamDetailInfoHonorModel class]];
            
            JCTeamMatchTeamInfoModel *teamModel = (JCTeamMatchTeamInfoModel *)[JCWJsonTool entityWithJson:object[@"data"][@"team_info"] class:[JCTeamMatchTeamInfoModel class]];
            if (teamModel.foundation_time.length>0) {
                JCTeamMatchBaseInfoModel *model = [JCTeamMatchBaseInfoModel new];
                model.name = @"成立时间";
                model.desc = [NSString stringWithFormat:@"%@年",teamModel.foundation_time];
                [self.statisticsArray addObject:model];
            }
            if (teamModel.manager_name.length>0||teamModel.manager_name_en.length>0) {
                JCTeamMatchBaseInfoModel *model = [JCTeamMatchBaseInfoModel new];
                model.name = @"主教练";
                model.desc = teamModel.manager_name.length>0?teamModel.manager_name:teamModel.manager_name_en;
                [self.statisticsArray addObject:model];
            }
            if (teamModel.venue_name.length>0||teamModel.venue_name_en.length>0) {
                JCTeamMatchBaseInfoModel *model = [JCTeamMatchBaseInfoModel new];
                model.name = @"球场";
                model.desc = teamModel.venue_name.length>0?teamModel.venue_name:teamModel.venue_name_en;
                [self.statisticsArray addObject:model];
            }
            if (teamModel.capacity.length>0) {
                JCTeamMatchBaseInfoModel *model = [JCTeamMatchBaseInfoModel new];
                model.name = @"球场容量";
                model.desc = [NSString stringWithFormat:@"%@人",teamModel.capacity];
                [self.statisticsArray addObject:model];
            }
            
            //转会记录
            self.zhuanRuModel = [JCTeamDetailInfoZhuanHuiModel new];
            self.zhuanRuModel.player_count = object[@"data"][@"player_transfer_info"][@"play_to_count"];
            NSArray *zhuanRuArray = object[@"data"][@"player_transfer_info"][@"play_to_info"];
            NSMutableArray *zrArray = [NSMutableArray array];
            [zhuanRuArray enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL * _Nonnull stop) {
                NSString *logo =  obj[@"logo"];
                if (logo.length>0) {
                    [zrArray addObject:logo];
                }
            }];
            self.zhuanRuModel.player = zrArray;
//            self.zhuanRuModel = (JCTeamDetailInfoZhuanHuiModel *)[JCWJsonTool entityWithJson:object[@"data"][@"transfer_from"] class:[JCTeamDetailInfoZhuanHuiModel class]];
//            self.zhuanChuModel = (JCTeamDetailInfoZhuanHuiModel *)[JCWJsonTool entityWithJson:object[@"data"][@"transfer_to"] class:[JCTeamDetailInfoZhuanHuiModel class]];
            self.zhuanChuModel = [JCTeamDetailInfoZhuanHuiModel new];
            self.zhuanChuModel.player_count = object[@"data"][@"player_transfer_info"][@"play_from_count"];
            NSArray *zhuanChuArray = object[@"data"][@"player_transfer_info"][@"play_from_info"];
            NSMutableArray *zcArray = [NSMutableArray array];
            [zhuanChuArray enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL * _Nonnull stop) {
                NSString *logo =  obj[@"logo"];
                if (logo.length>0) {
                    [zcArray addObject:logo];
                }
            }];
            self.zhuanChuModel.player = zcArray;
            
            
            
            [self.tableView reloadData];

        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        [self.fatherView endLoading];
    }];

}



#pragma mark - Protocol
#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section==0&&self.matchModel) {
        return 1;
    }
    if (section==1) {
        return self.statisticsArray.count;
    }
    if (section==2&&(self.zhuanRuModel.player.count>0||self.zhuanChuModel.player.count>0)) {
        return 1;
    }
    if (section==3&&self.honorArray.count>0) {
        return 1;
    }
    return 0;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==0) {
        JCTeamMatchInfoPlanCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCTeamMatchInfoPlanCell"];
        cell.teamModel= self.matchModel;
        return cell;
    }
    if (indexPath.section==1) {
        JCTeamDetailBaseInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCTeamDetailBaseInfoCell"];
        cell.model = self.statisticsArray[indexPath.row];

        return cell;
    }
    if (indexPath.section==2) {
        JCTeamDetailZhuanHuiCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCTeamDetailZhuanHuiCell"];
        cell.team_id = self.team_id;
        cell.zhuanRuModel = self.zhuanRuModel;
        cell.zhuanChuModel = self.zhuanChuModel;
        return cell;
    }
    if (indexPath.section==3) {
        JCTeamDetailHonorCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCTeamDetailHonorCell"];
        cell.dataSource = self.honorArray;
        WeakSelf;
        cell.JCBlock = ^{
            JCTeamDetailHonorShowView *showTableView = [[JCTeamDetailHonorShowView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
            showTableView.dataArray = weakSelf.honorArray;
//            showTableView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
            [weakSelf.view addSubview:showTableView];
        };
        return cell;
    }

//    if (indexPath.section==3||indexPath.section==4) {
//        JCTeamMatchInfoTeamCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCTeamMatchInfoTeamCell"];
//        return cell;
//    }
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    
    return cell;
}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==0&&self.matchModel) {
        return AUTO(110);
    }
    if (indexPath.section==1) {
        return AUTO(32);
    }
    if (indexPath.section==2) {
        return AUTO(120);
    }
    if (indexPath.section==3) {
        return AUTO(102);
    }
    return 0.001f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    if (section==1&&self.statisticsArray.count>0) {
        return AUTO(44);
    }
    if (section==2&&(self.zhuanRuModel.player.count>0||self.zhuanChuModel.player.count>0)) {
        return AUTO(44);
    }
    if (section==3&&self.honorArray.count>0) {
        return AUTO(44);
    }
    return 0.001f;
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return [UIView new];
    }
    JCDataBaseTitleHeadView *headView = [JCDataBaseTitleHeadView new];
    headView.titleLab.font = [UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(14)];
    headView.contentLab.hidden= NO;
    headView.lineView.hidden = YES;
    if (section==1&&self.statisticsArray.count>0) {
        headView.titleLab.text = @"球队资料";
        headView.contentLab.text = @"";
//        headView.lineView.hidden = NO;
        return headView;
    }
    if (section==2) {
        if (self.zhuanRuModel.player.count>0||self.zhuanChuModel.player.count>0) {
            headView.titleLab.text = @"转会";
//            headView.lineView.hidden = NO;
            headView.contentLab.text = @"";
            return headView;
        }

    }
    if (section==3) {
        if (self.honorArray.count>0) {
            headView.titleLab.text = @"球队荣誉";
//            headView.lineView.hidden = NO;
            headView.contentLab.text = @"查看年份";
            WeakSelf;
            [headView bk_whenTapped:^{
                if (section==3) {
                    JCTeamDetailHonorShowView *showTableView = [[JCTeamDetailHonorShowView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
                    showTableView.dataArray = weakSelf.honorArray;
                    [weakSelf.view addSubview:showTableView];
                }
            }];
            return headView;
        }

    }

    return [UIView new];
}


- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section==0&&self.matchModel) {
        return AUTO(8);
    }
    if (section==1&&self.statisticsArray.count>0&&(self.zhuanRuModel.player.count>0||self.zhuanChuModel.player.count>0)) {
        return AUTO(8);
    }
    if (section==2&&(self.zhuanRuModel.player.count>0||self.zhuanChuModel.player.count>0)&&self.honorArray.count>0) {
        return AUTO(8);
    }
//    if (section==3&&self.honorArray.count>0) {
//        return AUTO(8);
//    }
    return 0.001f;
    
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *backView= [UIView new];
    backView.backgroundColor = COLOR_F4F6F9;
    return backView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==0) {
        NSLog(@"%@",[self getViewController]);
        JCMatchDetailWMStickVC *vc = [JCMatchDetailWMStickVC new];
        vc.matchNum = self.matchModel.match_id;
        [self.navigationController pushViewController:vc animated:YES];
    }

}


@end
