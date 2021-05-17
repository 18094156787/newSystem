//
//  JNMatchSJViewController.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/17.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JNMatchSJViewController.h"
#import "JCDataBaseTitleHeadView.h"
#import "JNMatchSJLianSaiScoreTableViewCell.h"
#import "JNMatchSJZhanjiTableViewCell.h"
#import "JNMatchSJHurtTableViewCell.h"
#import "JNMatchSJInBallTableViewCell.h"
#import "JCDiXianFootView.h"
#import "JNMatchInjuryBall.h"
#import "JNMatchZJBall.h"
#import "JCMatchEnterBallModel.h"
@interface JNMatchSJViewController ()

@property (nonatomic, assign) CGFloat tableH;

@property (nonatomic, strong) JCDiXianFootView *footView;

@end

@implementation JNMatchSJViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    CGFloat tableH = self.tableView.contentSize.height;
    if (self.needReturnHeightBlock) {
        self.needReturnHeightBlock(tableH);
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
}

- (void)initView {
//    self.tableView.scrollEnabled = NO;
    self.view.backgroundColor = COLOR_F0F0F0;
    [self.tableView registerClass:[JNMatchSJInBallTableViewCell class] forCellReuseIdentifier:@"JNMatchSJInBallTableViewCell"];
    [self.tableView registerClass:[JNMatchSJHurtTableViewCell class] forCellReuseIdentifier:@"JNMatchSJHurtTableViewCell"];
    [self.tableView registerClass:[JNMatchSJLianSaiScoreTableViewCell class] forCellReuseIdentifier:@"JNMatchSJLianSaiScoreTableViewCell"];
    [self.tableView registerClass:[JNMatchSJZhanjiTableViewCell class] forCellReuseIdentifier:@"JNMatchSJZhanjiTableViewCell"];
    self.footView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 40);
    self.tableView.tableFooterView = self.footView;
}

- (void)getDataList {
    [self.jcWindow showLoading];
    JCMatchService_New * service = [JCMatchService_New service];
    [service getMatchDataWithMatchnum:self.matchBall.id success:^(id  _Nullable object) {
        [self.jcWindow endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
            if ([object[@"data"] isKindOfClass:[NSDictionary class]]) {
                NSDictionary *dataDic = object[@"data"];
                if (dataDic.allKeys.count==0) {
                    [self.view showTopNoData];
                    return ;
                }

                //进球分布
                self.homeGoalArr = object[@"data"][@"goal_distribution"][@"home"][@"all"][@"scored"];
                self.awayGoalArr = object[@"data"][@"goal_distribution"][@"away"][@"all"][@"scored"];

                
                if ([object[@"data"][@"league_points"] isKindOfClass:[NSDictionary class]]) {
                    //联赛积分
                    if ([self.type integerValue]==1) {
                        //主场
                        JNMatchTableBall * homeTableBall_all_model = (JNMatchTableBall *)[JCWJsonTool entityWithJson:object[@"data"][@"league_points"][@"data"][@"home"][@"all"] class:[JNMatchTableBall class]];
                        homeTableBall_all_model.title = @"总";
                        JNMatchTableBall * homeTableBall_home_model = (JNMatchTableBall *)[JCWJsonTool entityWithJson:object[@"data"][@"league_points"][@"data"][@"home"][@"home"] class:[JNMatchTableBall class]];
                        homeTableBall_home_model.title = @"主场";
                        JNMatchTableBall * homeTableBall_away_model = (JNMatchTableBall *)[JCWJsonTool entityWithJson:object[@"data"][@"league_points"][@"data"][@"home"][@"away"] class:[JNMatchTableBall class]];
                        homeTableBall_away_model.title = @"客场";
                        NSMutableArray *liansaiScoreArray_home = [NSMutableArray array];
                        if (homeTableBall_all_model) {
                            [liansaiScoreArray_home addObject:homeTableBall_all_model];
                        }
                        if (homeTableBall_home_model) {
                            [liansaiScoreArray_home addObject:homeTableBall_home_model];
                        }
                        if (homeTableBall_away_model) {
                            [liansaiScoreArray_home addObject:homeTableBall_away_model];
                        }
                        


                        self.lianSaiScoreArray= liansaiScoreArray_home;
                    }else {
                        //主场
                        JNMatchTableBall * homeTableBall_all_model = (JNMatchTableBall *)[JCWJsonTool entityWithJson:object[@"data"][@"league_points"][@"data"][@"away"][@"all"] class:[JNMatchTableBall class]];
                        homeTableBall_all_model.title = @"总";
                        JNMatchTableBall * homeTableBall_home_model = (JNMatchTableBall *)[JCWJsonTool entityWithJson:object[@"data"][@"league_points"][@"data"][@"away"][@"home"] class:[JNMatchTableBall class]];
                        homeTableBall_home_model.title = @"主场";
                        JNMatchTableBall * homeTableBall_away_model = (JNMatchTableBall *)[JCWJsonTool entityWithJson:object[@"data"][@"league_points"][@"data"][@"away"][@"away"] class:[JNMatchTableBall class]];
                        homeTableBall_away_model.title = @"客场";
                        NSMutableArray *liansaiScoreArray_home = [NSMutableArray array];
                        
                        if (homeTableBall_all_model) {
                            [liansaiScoreArray_home addObject:homeTableBall_all_model];
                        }
                        if (homeTableBall_home_model) {
                            [liansaiScoreArray_home addObject:homeTableBall_home_model];
                        }
                        if (homeTableBall_away_model) {
                            [liansaiScoreArray_home addObject:homeTableBall_away_model];
                        }

                        self.lianSaiScoreArray= liansaiScoreArray_home;
                    }

                }


                //历史对战
                self.historyArr = [JCWJsonTool arrayWithJson:object[@"data"][@"history"] class:[JNMatchZJBall class]];
                if ([self.type integerValue]==1) {
                    //伤停情况
                    self.injuryArr = [JCWJsonTool arrayWithJson:object[@"data"][@"injury"][@"home"] class:[JNMatchInjuryBall class]];
                    //近期战绩-主队
                   self.recentArr = [JCWJsonTool arrayWithJson:object[@"data"][@"recent"][@"home"] class:[JNMatchZJBall class]];
                    
                }else {
                    //伤停情况
                    self.injuryArr = [JCWJsonTool arrayWithJson:object[@"data"][@"injury"][@"away"] class:[JNMatchInjuryBall class]];
                    //近期战绩-客队
                   self.recentArr = [JCWJsonTool arrayWithJson:object[@"data"][@"recent"][@"away"] class:[JNMatchZJBall class]];
                }


                
                if (self.injuryArr.count > 0 || self.homeGoalArr.count > 0 || self.awayGoalArr.count > 0 || self.lianSaiScoreArray.count > 0 || self.recentArr.count > 0 || self.historyArr.count > 0) {
                    [self.view hideNoData];
                }else{
                    [self.view showTopNoData];
                }

                [self.tableView reloadData];
            }

        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }
    } failure:^(NSError * _Nonnull error) {
        [self.jcWindow endLoading];
    }];
//    [service getMatchDataWithMatchnum:self.matchBall.id type:NonNil(self.type) success:^(id  _Nullable object) {
//
//
//    } failure:^(NSError * _Nonnull error) {
//        [self.jcWindow endLoading];
//    }];


}

#pragma mark - SETTER

- (void)setMatchBall:(JCMatchBall *)matchBall {
    _matchBall = matchBall;
    [self getDataList];
//    [self.tableView reloadData];
}



#pragma mark - 📌 UITableViewDelegate, UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) return self.injuryArr.count == 0 ? 0 : 1;
    if (section == 1) return (self.homeGoalArr.count == 0 && self.awayGoalArr.count == 0) ? 0 : 1;
    if (section == 2) return self.lianSaiScoreArray.count == 0 ? 0 : 1;
    if (section == 3) return self.recentArr.count >0?1:0;//
    if (section == 4) return self.historyArr.count >0?1:0;
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        JNMatchSJHurtTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JNMatchSJHurtTableViewCell"];
        cell.dataSource = self.injuryArr;
        return cell;
    }
    if (indexPath.section == 1) {
        JNMatchSJInBallTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JNMatchSJInBallTableViewCell"];
        cell.homeGoalArr = self.homeGoalArr;
        cell.awayGoalArr = self.awayGoalArr;
        cell.homeName = self.matchBall.home_team.name_zh;
        cell.awayName = self.matchBall.away_team.name_zh;
        return cell;
    }
    if (indexPath.section == 2) {
        JNMatchSJLianSaiScoreTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JNMatchSJLianSaiScoreTableViewCell"];
        cell.dataArray = self.lianSaiScoreArray;
//        cell.tableBall = indexPath.item == 0 ? self.homeTableBall : self.awayTableBall;
//        cell.title = indexPath.item == 0 ? @"主":@"客";
        return cell;
    }
    if (indexPath.section == 3) {
        JNMatchSJZhanjiTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JNMatchSJZhanjiTableViewCell"];
        cell.dataArray = self.recentArr;
        return cell;
    }
    if (indexPath.section == 4) {
        JNMatchSJZhanjiTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JNMatchSJZhanjiTableViewCell"];
        cell.dataArray = self.historyArr;
        return cell;
    }
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==0&&self.injuryArr.count>0) {
        NSInteger count = ceil(self.injuryArr.count/2.0f);
        return count*AUTO(64)+15;
    }
    if (indexPath.section == 1 && (self.homeGoalArr > 0 || self.awayGoalArr.count > 0)){
        return AUTO(106);
    }
    if (indexPath.section==2&&self.lianSaiScoreArray.count>0) {
        return AUTO(20)+AUTO(12)+AUTO(32)*self.lianSaiScoreArray.count;
    }
    if (indexPath.section==3&&self.recentArr.count>0) {
        return AUTO(20)+AUTO(12)+AUTO(32)*self.recentArr.count;
    }
    if (indexPath.section==4&&self.historyArr.count>0) {
        return AUTO(20)+AUTO(12)+AUTO(32)*self.historyArr.count;
    }
    return  0;//UITableViewAutomaticDimension
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0 && self.injuryArr.count == 0) return 0;
    if (section == 1){
        if (self.homeGoalArr.count == 0 && self.awayGoalArr.count == 0) {
            return 0;
        }
        return AUTO(44);
    }
    if (section == 2 && self.lianSaiScoreArray.count == 0) return 0;
    if (section == 3 && self.recentArr.count == 0) return 0;
    if (section == 4 && self.historyArr.count == 0) return 0;
    return AUTO(44);
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section == 0 && self.injuryArr.count == 0) return 0;
    if (section == 1 ) {
        if (self.homeGoalArr.count == 0 && self.awayGoalArr.count == 0) {
            return 0;
        }
    }
        
    if (section == 2 && self.lianSaiScoreArray.count == 0) return 0;
    if (section == 3 && self.recentArr.count == 0) return 0;
    if (section == 4 && self.historyArr.count == 0) return 0;
    return AUTO(8);
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    JCDataBaseTitleHeadView *headView = [JCDataBaseTitleHeadView new];
    headView.titleLab.font = [UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(14)];
    headView.lineView.hidden= YES;
    headView.titleLab.text = @"";
    if (section == 0) {
        headView.titleLab.text = @"伤停情况";
    }
    if (section == 1) {
        if (self.homeGoalArr.count==0 &&self.awayGoalArr.count==0) {
            return [UIView new];
        }
        headView.titleLab.text = @"进球分布";
    }
    if (section == 2) {
        headView.titleLab.text = @"联赛积分";
    }
    if (section == 3) {
        headView.titleLab.text = @"近期战绩";
    }
    if (section == 4) {
        headView.titleLab.text = @"历史交锋";
    }
    return headView;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *backView= [UIView new];
    backView.backgroundColor = COLOR_F0F0F0;
    return backView;
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if([indexPath row] == ((NSIndexPath*)[[tableView indexPathsForVisibleRows] lastObject]).row) {
        WeakSelf;
        dispatch_async(dispatch_get_main_queue(), ^{
            CGFloat tableH = tableView.contentSize.height;
            weakSelf.tableH = tableH;
            if (weakSelf.needReturnHeightBlock) {
                weakSelf.needReturnHeightBlock(tableH);
            }
        });
    }
}
#pragma mark - OVERRIDE
- (CGFloat)contentH {
    return self.tableView.contentSize.height;
}

- (JCDiXianFootView *)footView {
    if (!_footView) {
        _footView = [JCDiXianFootView new];
    }
    return _footView;
}

@end
