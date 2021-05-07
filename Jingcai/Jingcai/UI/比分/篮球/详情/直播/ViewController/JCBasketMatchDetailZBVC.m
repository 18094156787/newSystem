//
//  JCBasketMatchDetailZBVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/4.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBasketMatchDetailZBVC.h"
#import "JCBasketBallMatchGoalDistributionTrendCell.h"
#import "JCBasketBallMatchDetailZBCell.h"
#import "JCZBIncidentModel.h"
#import "CountDown.h"
#import "JNMatchLiveBall.h"
#import "JCBasketMatchDetailTeamScoreCell.h"
#import "JCBasketBallMatchDetailErrorCell.h"
#import "JCBasketMatchDetailZBFormModel.h"
#import "JCBasketMatchDetailZBFanGuiModel.h"
#import "JCBasketMatchDetailTrendModel.h"
#import "JCWZBStatusModel.h"
#import "JNMatchDetailZBTopCell.h"
@interface JCBasketMatchDetailZBVC ()

@property (strong, nonatomic) NSArray * liveArr;
@property (strong, nonatomic) NSArray *incidentArray;
@property (strong, nonatomic) NSArray *trandArray;

@property (strong, nonatomic) NSDictionary * statusDic;

@property (strong, nonatomic) CountDown *countDown;

@property (strong, nonatomic) JCBasketMatchDetailZBFormModel *formModel;

@property (strong, nonatomic) NSArray *fgArray;

@property (strong, nonatomic) JCBasketMatchDetailZBFanGuiModel *fgInfoModel;//犯规信息

@property (strong, nonatomic) JCBasketMatchDetailTrendModel *trendModel;

@property (nonatomic,assign) NSInteger trend_count;//一共多少节,正常是4节

@property (nonatomic,assign) NSInteger trend_per;//每节多少分钟

@end

@implementation JCBasketMatchDetailZBVC

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self.countDown destoryTimer];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    ///每秒回调一次
    WeakSelf;
    [self.countDown countDownWithNumer:10 SECBlock:^{
        [weakSelf refreshData];
        
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    
    [self initViews];
    [self refreshData];
    
}

- (void)initViews {
    self.tableView.separatorStyle = 0;
    [self.tableView registerClass:[JCBasketBallMatchGoalDistributionTrendCell class] forCellReuseIdentifier:@"JCBasketBallMatchGoalDistributionTrendCell"];
    [self.tableView registerClass:[JCBasketBallMatchDetailZBCell class] forCellReuseIdentifier:@"JCBasketBallMatchDetailZBCell"];
    [self.tableView registerClass:[JCBasketMatchDetailTeamScoreCell class] forCellReuseIdentifier:@"JCBasketMatchDetailTeamScoreCell"];
    [self.tableView registerClass:[JCBasketBallMatchDetailErrorCell class] forCellReuseIdentifier:@"JCBasketBallMatchDetailErrorCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"JNMatchDetailZBTopCell" bundle:nil] forCellReuseIdentifier:@"JNMatchDetailZBTopCell"];
//    [self.tableView registerClass:[JNMatchDetailZBTopCell class] forCellReuseIdentifier:@"JNMatchDetailZBTopCell"];
    
    
    
    
    self.tableView.estimatedRowHeight = 200;
//    self.tableView.backgroundColor = COLOR_F6F6F6;
    self.countDown = [[CountDown alloc] init];
    
}


#pragma mark - UITableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section==1) {
        return 2;
    }
    if (section==2) {
        return self.liveArr.count;
    }
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==0) {
        JCBasketBallMatchGoalDistributionTrendCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCBasketBallMatchGoalDistributionTrendCell"];
        cell.matchBall = self.matchBall;
        cell.trendModel = self.trendModel;
        cell.trend_count = self.trend_count;
        cell.trend_per = self.trend_per;
        cell.dataArray = self.trandArray;
        
        return cell;
    }
    if (indexPath.section==1) {
        if (indexPath.row==0&&self.formModel.home_score.count>0) {
            JCBasketMatchDetailTeamScoreCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCBasketMatchDetailTeamScoreCell"];
            cell.formModel = self.formModel;
            return cell;
        }
        if (indexPath.row==1&&self.fgArray.count>0) {
            JCBasketBallMatchDetailErrorCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCBasketBallMatchDetailErrorCell"];
            cell.fgArray = self.fgArray;
            cell.fgInfoModel = self.fgInfoModel;
            return cell;
        }

    }
    if (indexPath.section==2) {

        if (indexPath.row == self.liveArr.count-1) {
            JNMatchDetailZBTopCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JNMatchDetailZBTopCell"];
            cell.liveBall = self.liveArr[indexPath.row];
            return cell;
        }
        JCBasketBallMatchDetailZBCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCBasketBallMatchDetailZBCell"];
        cell.hideTopLine = indexPath.row==0?YES:NO;
        cell.model = self.liveArr[indexPath.row];
        return cell;
    }
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==0) {
        if (self.trandArray.count>0) {
            return 130;
        }else{
            return 0;;
        }
    }
    if (indexPath.section==1) {
        if (indexPath.row==0) {
            return AUTO(110);
        }
        return AUTO(180);
    }
    return UITableViewAutomaticDimension;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section==2) {
        if (self.liveArr.count>0) {
            UIView *titleView = [UIView new];
            titleView.backgroundColor = JCWhiteColor;
            titleView.frame = CGRectMake(0, 0, SCREEN_WIDTH, AUTO(40));
            UILabel *titleLab = [UILabel initWithTitle:@"文字直播" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
            titleLab.frame = titleView.bounds;
            [titleView addSubview:titleLab];
            return titleView;
        }

    }
    return [UIView new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section==2) {
        return AUTO(40);
    }
    return 0.001f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    

    if (section==0&&(self.formModel.home_score.count>0||self.fgArray.count>0)) {
        return AUTO(8);
    }
    if (section==1&&self.liveArr.count>0) {
        return AUTO(8);
    }
    return 0.0001;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    
    if (section<2) {
        UIView *backView= [UIView new];
        backView.backgroundColor = COLOR_F0F0F0;
        return backView;
    }
    return [UIView new];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

}

- (void)refreshData {

//    if (self.liveArr.count==0&&self.trandArray.count==0&&self.incidentArray.count==0&&!self.statusDic) {
//        [self.view showLoadingTop];
//    }
//    [self.view showLoadingTop];////3574821
    WeakSelf;//self.matchBall.id
    JCBasketBallMatchService_New * service = [JCBasketBallMatchService_New service];//3574634
    [service getBasketBallMatchtDetailZhiboWithMatch_id:self.matchBall.id success:^(id  _Nullable object) {
        if ([JCWJsonTool isSuccessResponse:object]) {
            JCBasketBallMatchBall *matchInfoModel = (JCBasketBallMatchBall *)[JCWJsonTool entityWithJson:object[@"data"] class:[JCBasketBallMatchBall class]];
            
            NSArray * dataArr = [JCWJsonTool arrayWithJson:object[@"data"][@"tlive"] class:[JNMatchLiveBall class]];
            dataArr = [[dataArr reverseObjectEnumerator] allObjects];
            if (dataArr.count>0) {
                NSMutableArray *m_array = [NSMutableArray arrayWithArray:dataArr];
                JNMatchLiveBall *liveBall = [JNMatchLiveBall new];
                liveBall.data = @"大家好，欢迎收看本场比赛直播，球员们正在热身，比赛即将开始";
                [m_array addObject:liveBall];
                weakSelf.liveArr = [NSArray arrayWithArray:m_array];
            }

//            weakSelf.liveArr = dataArr;
            self.formModel= (JCBasketMatchDetailZBFormModel *)[JCWJsonTool entityWithJson:object[@"data"][@"score"] class:[JCBasketMatchDetailZBFormModel class]];
            self.formModel.home_name = matchInfoModel.home_team_name;
            self.formModel.away_name = matchInfoModel.away_team_name;
            self.fgArray = [JCWJsonTool arrayWithJson:object[@"data"][@"stats"][@"detail"] class:[JCWZBStatusModel class]];
            self.fgInfoModel = (JCBasketMatchDetailZBFanGuiModel *)[JCWJsonTool entityWithJson:object[@"data"][@"stats"] class:[JCBasketMatchDetailZBFanGuiModel class]];
            
            weakSelf.incidentArray = [JCWJsonTool arrayWithJson:object[@"data"][@"incidents"] class:[JCZBIncidentModel class]];
            weakSelf.trandArray = object[@"data"][@"trend"][@"data"];
            NSString *trend_count = object[@"data"][@"trend"][@"count"];
            weakSelf.trend_count = [trend_count integerValue];
            NSString *trend_per = object[@"data"][@"trend"][@"per"];
            weakSelf.trend_per = [trend_per integerValue];
            [weakSelf.tableView reloadData];
            
            if (weakSelf.liveArr.count==0&&weakSelf.trandArray.count==0&&self.fgArray.count==0&&self.formModel.home_score.count==0) {
                [weakSelf.tableView showNoZhiBoData];
            }else{
                [weakSelf.tableView hideNoData];
            }
//            if (weakSelf.JCRefreshBlock) {
//                weakSelf.JCRefreshBlock(matchInfoModel);
//            }
        }
    } failure:^(NSError * _Nonnull error) {
        [self.tableView showNoZhiBoData];
        [self.view endLoading];
    }];


}

@end
