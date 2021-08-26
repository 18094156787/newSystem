//
//  JNMatchDetailZBVC.m
//  Jingcai
//
//  Created by Administrator on 2019/6/5.
//  Copyright © 2019 jingcai. All rights reserved.
//

#import "JNMatchDetailZBVC.h"
#import "JNMatchDetailZBTopCell.h"
#import "JNMatchDetailZBCell.h"
#import "JCWJsonTool.h"
#import "RNNoData.h"
#import "JCMatchGoalDistributionTrendCell.h"
#import "JCMatchGoalDistributionInfoCell.h"
#import "CountDown.h"
#import "JCMatchDetailZBCell.h"
#import "JCLiveDistributionModel.h"
#import "JCMatchGoalDistributionTrendHeadView.h"
@interface JNMatchDetailZBVC () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView * tableView;
@property (assign, nonatomic) CGFloat tableH;
@property (strong, nonatomic) NSArray * liveArr;
@property (strong, nonatomic) NSArray *incidentArray;
@property (strong, nonatomic) NSArray *trandArray;
@property (assign, nonatomic) BOOL isLoad;
@property (strong, nonatomic) JCLiveDistributionModel *liveStatsModel;
@property (strong, nonatomic) CountDown *countDown;

@property (strong, nonatomic) JCMatchGoalDistributionTrendHeadView *trendHeadView;
@end

@implementation JNMatchDetailZBVC

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
//    [self.countDown destoryTimer];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    /每秒回调一次
//    [self.countDown countDownWithNumer:10 SECBlock:^{
//        [self loadDataWithMatchNum:self.matchBall.id];
//
//    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.scrollEnabled = YES;
    self.tableView.backgroundColor= COLOR_F0F0F0;
    [self.tableView registerNib:[UINib nibWithNibName:@"JNMatchDetailZBTopCell" bundle:nil] forCellReuseIdentifier:@"JNMatchDetailZBTopCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"JNMatchDetailZBCell" bundle:nil] forCellReuseIdentifier:@"JNMatchDetailZBCell"];
    [self.tableView registerClass:[JCMatchGoalDistributionTrendCell class] forCellReuseIdentifier:@"JCMatchGoalDistributionTrendCell"];
    [self.tableView registerClass:[JCMatchGoalDistributionInfoCell class] forCellReuseIdentifier:@"JCMatchGoalDistributionInfoCell"];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    [self.tableView registerClass:[JCMatchDetailZBCell class] forCellReuseIdentifier:@"JCMatchDetailZBCell"];

    
    WeakSelf;
    if (self.matchBall&&self.matchBall.status_id<8) {
//        status_id=8 是已完场,对未完场的比赛进行轮询
        self.countDown = [[CountDown alloc] init];
        [self.countDown countDownWithNumer:10 SECBlock:^{
            [weakSelf loadDataWithMatchNum:self.matchBall.id];

        }];
    }else{
        [self loadDataWithMatchNum:self.matchBall.id];
    }



}

#pragma mark - UITableViewDelegate, UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section==0) {
        return 1;
    }
    NSInteger count = self.liveArr.count;
//    count == 0 ? [self.tableView showTopNoData] : [self.tableView hideNoData];
    return count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==0) {
//        if (indexPath.row==0) {
////            JCMatchGoalDistributionTrendCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCMatchGoalDistributionTrendCell"];
////            cell.matchBall = self.matchBall;
////            cell.incidentArray = self.incidentArray;
////            cell.dataArray = self.trandArray;
//
////            return cell;
//        }
        if (self.liveStatsModel) {
            JCMatchGoalDistributionInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCMatchGoalDistributionInfoCell"];
            cell.liveStatsModel = self.liveStatsModel;
            cell.matchBall = self.matchBall;
            return cell;
        }

        
    }
    if (indexPath.section==1) {
        if (indexPath.row == self.liveArr.count-1) {
            JNMatchDetailZBTopCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JNMatchDetailZBTopCell"];
            JNMatchLiveBall *liveBall = self.liveArr[indexPath.row];
            cell.liveBall = liveBall;
            return cell;
        }
        JCMatchDetailZBCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCMatchDetailZBCell"];
        cell.liveBall = self.liveArr[indexPath.row];
        return cell;
    }
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    return cell;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==0) {

        if (indexPath.row==0) {
            if (self.liveStatsModel) {
                return AUTO(200);
            }else{
                return 0;
            }
            
        }
        
    }
    return UITableViewAutomaticDimension;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if([indexPath row] == ((NSIndexPath *)[[tableView indexPathsForVisibleRows] lastObject]).row) {
        WeakSelf;
        dispatch_async(dispatch_get_main_queue(), ^{
            weakSelf.tableH = weakSelf.tableView.contentSize.height;
            if (weakSelf.needReturnHeightBlock) {
                weakSelf.needReturnHeightBlock([weakSelf contentH]);
            }
        });
    }
}

#pragma mark - OVERRIDE
- (CGFloat)contentH {
    return self.tableH;
}

#pragma mark - Loading
- (void)loadDataWithMatchNum:(NSString *)matchNum {
    if (matchNum.length==0) {
        return;
    }

    if (!self.isLoad&&self.matchBall) {
        [self.view showLoadingTop];
    }
    WeakSelf;
    JCMatchService_New * service = [JCMatchService_New service];
    [service getMatchLiveWithMatchnum:self.matchBall.id success:^(id  _Nullable object) {
        self.isLoad = YES;
        [self.view endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
        if (![object[@"data"] isKindOfClass:[NSDictionary class]]) {
                return;
            }
            NSMutableArray *incidentArray = [NSMutableArray array];
            NSArray * dataArr = [JCWJsonTool arrayWithJson:object[@"data"][@"tlive"] class:[JNMatchLiveBall class]];
            if (dataArr.count>0) {
                
                NSMutableArray *m_array = [NSMutableArray array];

                [dataArr enumerateObjectsUsingBlock:^(JNMatchLiveBall *obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    if (obj.type>0) {
                        [m_array addObject:obj];
                    }
                    if (obj.type>0&&[obj.position integerValue]>0&&obj.time.length>0) {
                        JCZBIncidentModel *incidentModel = [JCZBIncidentModel new];
                        incidentModel.type = [NSString stringWithFormat:@"%ld",obj.type];
                        incidentModel.position = obj.position;
                        NSString *time = [obj.time stringByReplacingOccurrencesOfString:@"'" withString:@""];
                         
                        if (time.length>0) {
                           
                            if ([time containsString:@"+"]) {
                                
                                NSArray *timeArray = [time componentsSeparatedByString:@"+"];
                                if (timeArray.count==2) {
                                    NSString *firstTime = timeArray.firstObject;
                                    NSString *lastTime = timeArray.lastObject;
                                   NSInteger time_integer = [firstTime integerValue]+[lastTime intValue];
                                    incidentModel.time = [NSString stringWithFormat:@"%ld",time_integer];
                                }else{
                                    incidentModel.time = timeArray.firstObject;
                                }
                                
                            }else{
                                incidentModel.time = time;
                            }
                            
                           
                        }
                        [incidentArray addObject:incidentModel];
                    }
                }];
                JNMatchLiveBall *liveBall = [JNMatchLiveBall new];
                liveBall.data = @"大家好，欢迎收看本场比赛直播，球员们正在热身，比赛即将开始";
                [m_array addObject:liveBall];
                weakSelf.liveArr = [NSArray arrayWithArray:m_array];
            }
//            weakSelf.liveArr = dataArr;
//            [[dataArr reverseObjectEnumerator] allObjects];
//            weakSelf.liveArr = dataArr;
            weakSelf.incidentArray = [JCWJsonTool arrayWithJson:object[@"data"][@"incidents"] class:[JCZBIncidentModel class]];
            weakSelf.trandArray = object[@"data"][@"match_trend"];
            if (weakSelf.trandArray.count>0) {
                self.trendHeadView.matchBall = self.matchBall;
//                self.trendHeadView.incidentArray = self.incidentArray;
                self.trendHeadView.incidentArray = incidentArray;
                self.trendHeadView.dataArray = self.trandArray;
                self.tableView.tableHeaderView = self.trendHeadView;
            }
            
            
            self.liveStatsModel = (JCLiveDistributionModel *)[JCWJsonTool entityWithJson:object[@"data"][@"stats"] class:[JCLiveDistributionModel class]];
            [weakSelf.tableView reloadData];
            
            if (weakSelf.liveArr.count==0&&weakSelf.trandArray.count==0&&!weakSelf.liveStatsModel) {
                [weakSelf.tableView showNoZhiBoData];
            }else{
                [weakSelf.tableView hideNoData];
            }
        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }
    } failure:^(NSError * _Nonnull error) {
        [self.view endLoading];
    }];

}





- (void)destoryTimer {
    [self.countDown destoryTimer];
}

- (JCMatchGoalDistributionTrendHeadView *)trendHeadView {
    if (!_trendHeadView) {
        _trendHeadView = [JCMatchGoalDistributionTrendHeadView new];
        _trendHeadView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 130);
    }
    return _trendHeadView;
}
@end
