//
//  JNMatchSJAgainstDataVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/17.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JNMatchSJAgainstDataVC.h"
#import "JNMatchSJAgainstTipView.h"
#import "JNMatchSJAgainstSectionTitleView.h"
#import "JNMatchSJAgainstBF_Cell.h"
#import "JNMatchSJAgainstSPF_Cell.h"
#import "JNMatchSJAgainstBall_Cell.h"
#import "JNMatchSJAgainstFootTipView.h"
#import "JNMatchSJAgainstHistortPay_SPFCell.h"
#import "JNMatchSJAgainstHistortPay_RQCell.h"
#import "JNMatchSJAgainstZhiShu_SPFChartCell.h"
#import "JNMatchSJAgainstZhiShu_RQChartCell.h"
#import "JNMatchSJAgainstZhiShu_JQSChartCell.h"
#import "JNMatchSJAgainstZhiShu_JQSChart_TitleCell.h"
#import "JNMatchSJAgainstTeam_ZhanjiCell.h"
#import "JNMatchSJAgainstTeam_HistoryBattleCell.h"
#import "JNMatchSJAgainstTeam_SeasonRankCell.h"
#import "JNMatchSJAgainstCountdown_Cell.h"
#import "CountDown.h"
#import "JCBigDataMonthProduceModel.h"
#import "JCJingCaiAIBigDataBuyVC.h"

#import "JCBigDataMingZhongModel.h"
#import "JCBigDataSimilarModel.h"
#import "JCBigDataAnalysisModel.h"
#import "JCBigDataVS_AnalysisModel.h"
#import "JNMatchSJAgainstBallFootView.h"
#import "JCBigDataZhishuModel.h"
#import "JCBigDataZhishuPanModel.h"
#import "JCBigDataZhishuLargeSmallModel.h"
#import "JCBigDataZhishuTrendModel.h"
#import "JCJingCaiAINoticeModel.h"
#import "JCPayShowView.h"
#import "JCChargeVC.h"
@interface JNMatchSJAgainstDataVC ()

@property (nonatomic,strong) JNMatchSJAgainstTipView *tipView;

@property (strong, nonatomic)  CountDown *countDown;

@property (nonatomic,assign) BOOL isLock;

@property (strong, nonatomic) JCBigDataMonthProduceModel *productModel;

@property (nonatomic,strong) NSArray *mzArray;//命中统计

@property (nonatomic,strong) JCBigDataSimilarModel *op_similarModel;//历史同赔胜平负

@property (nonatomic,strong) JCBigDataSimilarModel *yp_similarModel;//历史同赔让球

@property (nonatomic,strong) JCBigDataSimilarModel *dx_similarModel;////历史同赔进球数

@property (nonatomic,strong) JCBigDataAnalysisModel *home_analysisModel;//球队分析

@property (nonatomic,strong) JCBigDataAnalysisModel *away_analysisModel;//球队分析

@property (nonatomic,strong) JCBigDataVS_AnalysisModel *vs_analysisModel;//球队分析

@property (nonatomic,strong) NSArray *zhishu_spfArray;//指数_胜平负

@property (nonatomic,strong) NSArray *zhishu_rqArray;//指数_让球

@property (nonatomic,strong) NSArray *zhishu_jqsArray;//指数_进球数

@property (nonatomic,strong) NSArray *trend_spfArray;//指数_趋势_胜平负

@property (nonatomic,strong) NSArray *trend_rqArray;//指数_趋势_让球

@property (nonatomic,strong) NSArray *trend_jqsArray;//指数_趋势_进球数

@property (nonatomic,strong) JCBigDataZhishuPanModel *sfpPanModel;

@property (nonatomic,strong) JCBigDataZhishuPanModel *rqPanModel;

@property (nonatomic,strong) JCBigDataZhishuPanModel *jqsPanModel;

@property (nonatomic,strong) JCBigDataZhishuLargeSmallModel *sfpLargeModel;

@property (nonatomic,strong) JCBigDataZhishuLargeSmallModel *rqLargeModel;

@property (nonatomic,strong) JCBigDataZhishuLargeSmallModel *jqsLargeModel;

@property (nonatomic,assign) NSInteger is_buy;

@property (nonatomic,strong) NSString *singlePrice;

@property (nonatomic,strong) NSString *monthPrice;

@end

@implementation JNMatchSJAgainstDataVC

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self.countDown destoryTimer];
}

- (void)viewDidLoad {
    self.style = 1;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.isLock = YES;
    [self initSubViews];
    [self getBuyInfo];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(userHaveBuy) name:JingcaiAIProduceBuy object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getBuyInfo) name:NotificationUserLogin object:nil];

    [self.tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
        make.left.bottom.right.equalTo(self.view);
    }];
    
}

- (void)userHaveBuy {
    self.titleModel.is_subscrib = 1;
    [self getBuyInfo];
}

- (void)getBuyInfo {
    if (self.titleModel&&self.titleModel.is_subscrib!=1) {
        // 从联赛详情展示的数据模型,并且没有订阅时,不请求数据,而是展示购买页面
        self.tableView.hidden = YES;
        [self showOrderMsgView];
        return;
    }else{
        self.tableView.hidden = NO;
        self.tipView.hidden = YES;
    }
    
    
//    [self.jcWindow showLoading];
    JCMatchService_New *service = [JCMatchService_New service];
//    self.matchBall.id = @"3491381";
    [service getMatchBigDataDetailWithMatchnum:self.matchBall.id success:^(id  _Nullable object) {
        [self.jcWindow endLoading];;
        if ([JCWJsonTool isSuccessResponse:object]) {
            self.productModel = (JCBigDataMonthProduceModel *)[JCWJsonTool entityWithJson:object[@"data"] class:[JCBigDataMonthProduceModel class]];
//            
            if (object[@"data"][@"type"]) {
                NSString *type = object[@"data"][@"type"];
                self.matchBall.type = [type integerValue];
            }
            self.tipView.hidden = YES;

            self.mzArray = [JCWJsonTool arrayWithJson:object[@"data"][@"win_mark"] class:[JCBigDataMingZhongModel class]];
            self.op_similarModel = (JCBigDataSimilarModel *)[JCWJsonTool entityWithJson:object[@"data"][@"similar"][@"op_similar"] class:[JCBigDataSimilarModel class]];
            self.yp_similarModel = (JCBigDataSimilarModel *)[JCWJsonTool entityWithJson:object[@"data"][@"similar"][@"yp_similar"] class:[JCBigDataSimilarModel class]];//让球
            self.yp_similarModel.rq = self.productModel.rq;
            self.dx_similarModel = (JCBigDataSimilarModel *)[JCWJsonTool entityWithJson:object[@"data"][@"similar"][@"dx_similar"] class:[JCBigDataSimilarModel class]];//进球数
            self.dx_similarModel.jqs = self.productModel.jqs;
            //球队分析
            self.home_analysisModel = (JCBigDataAnalysisModel *)[JCWJsonTool entityWithJson:object[@"data"][@"home_analysis"] class:[JCBigDataAnalysisModel class]];
            self.away_analysisModel = (JCBigDataAnalysisModel *)[JCWJsonTool entityWithJson:object[@"data"][@"away_analysis"] class:[JCBigDataAnalysisModel class]];
            self.vs_analysisModel = (JCBigDataVS_AnalysisModel *)[JCWJsonTool entityWithJson:object[@"data"][@"vs_analysis"] class:[JCBigDataVS_AnalysisModel class]];
            self.vs_analysisModel.home_name = self.productModel.home_team_name;
            self.vs_analysisModel.away_name = self.productModel.away_team_name;
            //指数
            self.zhishu_spfArray = [JCWJsonTool arrayWithJson:object[@"data"][@"zhishu"][@"op_zhishu"] class:[JCBigDataZhishuModel class]];
            self.zhishu_rqArray = [JCWJsonTool arrayWithJson:object[@"data"][@"zhishu"][@"yp_zhishu"] class:[JCBigDataZhishuModel class]];
            self.zhishu_jqsArray = [JCWJsonTool arrayWithJson:object[@"data"][@"zhishu"][@"dx_zhishu"] class:[JCBigDataZhishuModel class]];
            self.sfpPanModel = (JCBigDataZhishuPanModel *)[JCWJsonTool entityWithJson:object[@"data"][@"zhishu"][@"op_zhishu_now"] class:[JCBigDataZhishuPanModel class]];
            self.rqPanModel = (JCBigDataZhishuPanModel *)[JCWJsonTool entityWithJson:object[@"data"][@"zhishu"][@"yp_zhishu_now"] class:[JCBigDataZhishuPanModel class]];
            self.jqsPanModel = (JCBigDataZhishuPanModel *)[JCWJsonTool entityWithJson:object[@"data"][@"zhishu"][@"dx_zhishu_now"] class:[JCBigDataZhishuPanModel class]];
            
            self.sfpLargeModel = (JCBigDataZhishuLargeSmallModel *)[JCWJsonTool entityWithJson:object[@"data"][@"zhishu"][@"op_large_small"] class:[JCBigDataZhishuLargeSmallModel class]];
            self.rqLargeModel = (JCBigDataZhishuLargeSmallModel *)[JCWJsonTool entityWithJson:object[@"data"][@"zhishu"][@"yp_large_small"] class:[JCBigDataZhishuLargeSmallModel class]];
            self.jqsLargeModel = (JCBigDataZhishuLargeSmallModel *)[JCWJsonTool entityWithJson:object[@"data"][@"zhishu"][@"dx_large_small"] class:[JCBigDataZhishuLargeSmallModel class]];
            

            self.trend_spfArray = [JCWJsonTool arrayWithJson:object[@"data"][@"zhishu"][@"op_trend_data"] class:[JCBigDataZhishuTrendModel class]];
            self.trend_rqArray = [JCWJsonTool arrayWithJson:object[@"data"][@"zhishu"][@"yp_trend_data"] class:[JCBigDataZhishuTrendModel class]];
            self.trend_jqsArray = [JCWJsonTool arrayWithJson:object[@"data"][@"zhishu"][@"dx_trend_data"] class:[JCBigDataZhishuTrendModel class]];
              [self.tableView reloadData];
            

//            if (self.matchBall.type==4) {
//                self.tipView.hidden = YES;
//
//                self.mzArray = [JCWJsonTool arrayWithJson:object[@"data"][@"win_mark"] class:[JCBigDataMingZhongModel class]];
//                self.op_similarModel = (JCBigDataSimilarModel *)[JCWJsonTool entityWithJson:object[@"data"][@"similar"][@"op_similar"] class:[JCBigDataSimilarModel class]];
//                self.yp_similarModel = (JCBigDataSimilarModel *)[JCWJsonTool entityWithJson:object[@"data"][@"similar"][@"yp_similar"] class:[JCBigDataSimilarModel class]];//让球
//                self.yp_similarModel.rq = self.productModel.rq;
//                self.dx_similarModel = (JCBigDataSimilarModel *)[JCWJsonTool entityWithJson:object[@"data"][@"similar"][@"dx_similar"] class:[JCBigDataSimilarModel class]];//进球数
//                self.dx_similarModel.jqs = self.productModel.jqs;
//                //球队分析
//                self.home_analysisModel = (JCBigDataAnalysisModel *)[JCWJsonTool entityWithJson:object[@"data"][@"home_analysis"] class:[JCBigDataAnalysisModel class]];
//                self.away_analysisModel = (JCBigDataAnalysisModel *)[JCWJsonTool entityWithJson:object[@"data"][@"away_analysis"] class:[JCBigDataAnalysisModel class]];
//                self.vs_analysisModel = (JCBigDataVS_AnalysisModel *)[JCWJsonTool entityWithJson:object[@"data"][@"vs_analysis"] class:[JCBigDataVS_AnalysisModel class]];
//                self.vs_analysisModel.home_name = self.productModel.home_team_name;
//                self.vs_analysisModel.away_name = self.productModel.away_team_name;
//                //指数
//                self.zhishu_spfArray = [JCWJsonTool arrayWithJson:object[@"data"][@"zhishu"][@"op_zhishu"] class:[JCBigDataZhishuModel class]];
//                self.zhishu_rqArray = [JCWJsonTool arrayWithJson:object[@"data"][@"zhishu"][@"yp_zhishu"] class:[JCBigDataZhishuModel class]];
//                self.zhishu_jqsArray = [JCWJsonTool arrayWithJson:object[@"data"][@"zhishu"][@"dx_zhishu"] class:[JCBigDataZhishuModel class]];
//                self.sfpPanModel = (JCBigDataZhishuPanModel *)[JCWJsonTool entityWithJson:object[@"data"][@"zhishu"][@"op_zhishu_now"] class:[JCBigDataZhishuPanModel class]];
//                self.rqPanModel = (JCBigDataZhishuPanModel *)[JCWJsonTool entityWithJson:object[@"data"][@"zhishu"][@"yp_zhishu_now"] class:[JCBigDataZhishuPanModel class]];
//                self.jqsPanModel = (JCBigDataZhishuPanModel *)[JCWJsonTool entityWithJson:object[@"data"][@"zhishu"][@"dx_zhishu_now"] class:[JCBigDataZhishuPanModel class]];
//
//                self.sfpLargeModel = (JCBigDataZhishuLargeSmallModel *)[JCWJsonTool entityWithJson:object[@"data"][@"zhishu"][@"op_large_small"] class:[JCBigDataZhishuLargeSmallModel class]];
//                self.rqLargeModel = (JCBigDataZhishuLargeSmallModel *)[JCWJsonTool entityWithJson:object[@"data"][@"zhishu"][@"yp_large_small"] class:[JCBigDataZhishuLargeSmallModel class]];
//                self.jqsLargeModel = (JCBigDataZhishuLargeSmallModel *)[JCWJsonTool entityWithJson:object[@"data"][@"zhishu"][@"dx_large_small"] class:[JCBigDataZhishuLargeSmallModel class]];
//
//
//                self.trend_spfArray = [JCWJsonTool arrayWithJson:object[@"data"][@"zhishu"][@"op_trend_data"] class:[JCBigDataZhishuTrendModel class]];
//                self.trend_rqArray = [JCWJsonTool arrayWithJson:object[@"data"][@"zhishu"][@"yp_trend_data"] class:[JCBigDataZhishuTrendModel class]];
//                self.trend_jqsArray = [JCWJsonTool arrayWithJson:object[@"data"][@"zhishu"][@"dx_trend_data"] class:[JCBigDataZhishuTrendModel class]];
//                  [self.tableView reloadData];
//            }else if(self.matchBall.type==3){
//
//                //没有查看权限(没有购买)
//                self.tipView.hidden = NO;
//                self.singlePrice = object[@"data"][@"big_data_one_price"];
//                self.monthPrice = object[@"data"][@"big_data_price"];
//                [self showOrderMsgView];
//            }
//            else if(self.matchBall.type==2){
//                //取消
//                self.tipView.hidden = NO;
//                [self matchCancelMsgView];
//            }else if(self.matchBall.type==1){
//                //延迟
//                self.tipView.hidden = NO;
//                [self matchDelayMsgView];
//
//            }else if(self.matchBall.type==5||self.matchBall.type==6){
//                //比赛过期
//                self.tipView.hidden = NO;
//                [self matchOutTimeMsgView];
//
//            }
//            else{
//                self.tipView.hidden = YES;
//            }



        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        [self.jcWindow endLoading];
    }];
}

- (void)initSubViews {
    self.tableView.separatorStyle = 0;
    self.tableView.estimatedRowHeight = 400;

    [self.tableView registerClass:[JNMatchSJAgainstCountdown_Cell class] forCellReuseIdentifier:@"JNMatchSJAgainstCountdown_Cell"];
    [self.tableView registerClass:[JNMatchSJAgainstBF_Cell class] forCellReuseIdentifier:@"JNMatchSJAgainstBF_Cell"];
    [self.tableView registerClass:[JNMatchSJAgainstSPF_Cell class] forCellReuseIdentifier:@"JNMatchSJAgainstSPF_Cell"];
    [self.tableView registerClass:[JNMatchSJAgainstBall_Cell class] forCellReuseIdentifier:@"JNMatchSJAgainstBall_Cell"];
    //历史同赔
    [self.tableView registerClass:[JNMatchSJAgainstHistortPay_SPFCell class] forCellReuseIdentifier:@"JNMatchSJAgainstHistortPay_SPFCell"];
    [self.tableView registerClass:[JNMatchSJAgainstHistortPay_RQCell class] forCellReuseIdentifier:@"JNMatchSJAgainstHistortPay_RQCell"];
    //指数分析
    [self.tableView registerClass:[JNMatchSJAgainstZhiShu_SPFChartCell class] forCellReuseIdentifier:@"JNMatchSJAgainstZhiShu_SPFChartCell"];
    [self.tableView registerClass:[JNMatchSJAgainstZhiShu_RQChartCell class] forCellReuseIdentifier:@"JNMatchSJAgainstZhiShu_RQChartCell"];
    //球队分析
    
    [self.tableView registerClass:[JNMatchSJAgainstZhiShu_JQSChart_TitleCell class] forCellReuseIdentifier:@"JNMatchSJAgainstZhiShu_JQSChart_TitleCell"];
    [self.tableView registerClass:[JNMatchSJAgainstTeam_ZhanjiCell class] forCellReuseIdentifier:@"JNMatchSJAgainstTeam_ZhanjiCell"];
    [self.tableView registerClass:[JNMatchSJAgainstTeam_HistoryBattleCell class] forCellReuseIdentifier:@"JNMatchSJAgainstTeam_HistoryBattleCell"];
    [self.tableView registerClass:[JNMatchSJAgainstTeam_SeasonRankCell class] forCellReuseIdentifier:@"JNMatchSJAgainstTeam_SeasonRankCell"];

    
    WeakSelf;
    self.countDown = [[CountDown alloc] init];
    ///每秒回调一次
    [self.countDown countDownWithPER_SECBlock:^{
        NSLog(@"6");
        [weakSelf updateTimeInVisibleCells];
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (self.matchBall.type==4) {
        return 4;
    }
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section==0) {
        if (self.isLock) {
            return 1;
        }
        return 4;
    }
    if (section==1) {
//        return 3;
        return 0;
    }
    if (section==2) {
        return 3;
    }
    if (section==3) {
        if (self.vs_analysisModel.match.count>0) {
            return 6;
        }
        return 5;
    }
    return 1;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==0) {
        if (self.isLock) {
            JNMatchSJAgainstCountdown_Cell *cell = [tableView dequeueReusableCellWithIdentifier:@"JNMatchSJAgainstCountdown_Cell"];
            return cell;
        }
        if (indexPath.row==0) {
            JNMatchSJAgainstBF_Cell *cell = [tableView dequeueReusableCellWithIdentifier:@"JNMatchSJAgainstBF_Cell"];
            cell.model = self.productModel;
            return cell;
        }
        if (indexPath.row==1) {
            JNMatchSJAgainstSPF_Cell *cell = [tableView dequeueReusableCellWithIdentifier:@"JNMatchSJAgainstSPF_Cell"];
            cell.model = self.productModel;
            return cell;
        }
        if (indexPath.row==2) {
            JNMatchSJAgainstBall_Cell *cell = [tableView dequeueReusableCellWithIdentifier:@"JNMatchSJAgainstBall_Cell"];
            cell.is_rq = NO;
            cell.model = self.productModel;
            return cell;
        }
        if (indexPath.row==3) {
            JNMatchSJAgainstBall_Cell *cell = [tableView dequeueReusableCellWithIdentifier:@"JNMatchSJAgainstBall_Cell"];
            cell.is_rq = YES;
            cell.model = self.productModel;
            
            return cell;
        }
        
        
    }
    if (indexPath.section==1) {
        if (indexPath.row==0) {
            JNMatchSJAgainstHistortPay_SPFCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JNMatchSJAgainstHistortPay_SPFCell"];
            cell.type = indexPath.row;
            cell.model = self.op_similarModel;
            return cell;
        }else{
            JNMatchSJAgainstHistortPay_RQCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JNMatchSJAgainstHistortPay_RQCell"];
            cell.type = indexPath.row;
            if (indexPath.row==1) {
                cell.model = self.yp_similarModel;
            }
            if (indexPath.row==2) {
                cell.model = self.dx_similarModel;
            }
            return cell;
        }
    }
    if (indexPath.section==2) {
        if (indexPath.row==0&&self.trend_spfArray.count>0) {
            JNMatchSJAgainstZhiShu_SPFChartCell *cell = [[JNMatchSJAgainstZhiShu_SPFChartCell alloc] initWithStyle:0 reuseIdentifier:@"JNMatchSJAgainstZhiShu_SPFChartCell"];
            cell.dataArray = self.zhishu_spfArray;
            cell.panModel = self.sfpPanModel;
            cell.largeModel = self.sfpLargeModel;
            cell.trendArray = self.trend_spfArray;
            
            return cell;
        }
        if (indexPath.row==1&&self.trend_rqArray.count>0) {
            JNMatchSJAgainstZhiShu_RQChartCell *cell = [[JNMatchSJAgainstZhiShu_RQChartCell alloc] initWithStyle:0 reuseIdentifier:@"JNMatchSJAgainstZhiShu_RQChartCell"];
            cell.productModel = self.productModel;
            cell.dataArray = self.zhishu_rqArray;
            cell.panModel = self.rqPanModel;
             cell.largeModel = self.rqLargeModel;
            cell.trendArray = self.trend_rqArray;
            
            return cell;
        }
        if (indexPath.row==2&&self.trend_jqsArray.count>0) {
            JNMatchSJAgainstZhiShu_JQSChartCell *cell = [[JNMatchSJAgainstZhiShu_JQSChartCell alloc] initWithStyle:0 reuseIdentifier:@"JNMatchSJAgainstZhiShu_JQSChartCell"];
            cell.productModel = self.productModel;
            cell.dataArray = self.zhishu_jqsArray;
            cell.panModel = self.jqsPanModel;
             cell.largeModel = self.jqsLargeModel;
            cell.trendArray = self.trend_jqsArray;
                
            return cell;
        }


    }
    if (indexPath.section==3) {
        
        if (indexPath.row==0&&(self.home_analysisModel.trend.length>0||self.away_analysisModel.trend.length>0)) {
            JNMatchSJAgainstZhiShu_JQSChart_TitleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JNMatchSJAgainstZhiShu_JQSChart_TitleCell"];
            return cell;
        }
        if (indexPath.row==1||indexPath.row==2) {

            JNMatchSJAgainstTeam_ZhanjiCell *cell = [[JNMatchSJAgainstTeam_ZhanjiCell alloc] initWithStyle:0 reuseIdentifier:@"JNMatchSJAgainstTeam_ZhanjiCell"];
            if (indexPath.row==1) {
                cell.model = self.home_analysisModel;
                cell.teamNameLab.text = self.productModel.home_team_name;
                if (self.home_analysisModel.trend.length>0) {
                    return cell;
                }
            }
            if (indexPath.row==2) {
                cell.model = self.away_analysisModel;
                cell.teamNameLab.text = self.productModel.away_team_name;
                if (self.away_analysisModel.trend.length>0) {
                    return cell;
                }
            }
//            return cell;
        }
        if (indexPath.row==3||indexPath.row==4) {
            JNMatchSJAgainstBall_Cell *cell = [tableView dequeueReusableCellWithIdentifier:@"JNMatchSJAgainstBall_Cell"];
            if (indexPath.row==3) {
                cell.is_win = YES;
                cell.titleLab.text = @"近10场均入球";
                cell.homeInfoLab.text = [NSString stringWithFormat:@"%@%@",self.productModel.home_team_name,self.home_analysisModel.win_score];
                cell.awayInfoLab.text = [NSString stringWithFormat:@"%@%@",self.productModel.away_team_name,self.away_analysisModel.win_score];
                cell.home_analysisModel = self.home_analysisModel;
                cell.away_analysisModel = self.away_analysisModel;
                if (self.home_analysisModel.trend.length>0) {
                    return cell;
                }
                
            }
            if (indexPath.row==4) {
                cell.titleLab.text = @"近10场均失球";
                cell.homeInfoLab.text = [NSString stringWithFormat:@"%@%@",self.productModel.home_team_name,self.home_analysisModel.lose_score];
                cell.awayInfoLab.text = [NSString stringWithFormat:@"%@%@",self.productModel.away_team_name,self.away_analysisModel.lose_score];
                cell.home_analysisModel = self.home_analysisModel;
                cell.away_analysisModel = self.away_analysisModel;
                if (self.away_analysisModel.trend.length>0) {
                    return cell;
                }
            }


        }
        if (indexPath.row==5) {
            JNMatchSJAgainstTeam_HistoryBattleCell *cell = [[JNMatchSJAgainstTeam_HistoryBattleCell alloc] initWithStyle:0 reuseIdentifier:@"JNMatchSJAgainstTeam_HistoryBattleCell"];
            cell.model = self.vs_analysisModel;
            return cell;
        }
        if (indexPath.row==6) {
            JNMatchSJAgainstTeam_SeasonRankCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JNMatchSJAgainstTeam_SeasonRankCell"];
            return cell;
        }
        
        
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    return cell;
}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==0) {
        if (self.isLock) {
            return AUTO(140);
        }
        if (indexPath.row==0) {
            return AUTO(170);
        }
        if (indexPath.row==1) {
            return AUTO(110);
        }
        if (indexPath.row==2) {
            return AUTO(100);
        }
        if (indexPath.row==3) {
            return AUTO(60);
        }
    }
    if (indexPath.section==1) {
        if (indexPath.row==0) {
            return AUTO(105);
        }
        return AUTO(88);
    }
    if (indexPath.section==2) {
        if (indexPath.row==0&&self.trend_spfArray.count==0) {
            return 0;
        }
        if (indexPath.row==1&&self.trend_rqArray.count==0) {
            return 0;
        }
        if (indexPath.row==2&&self.trend_jqsArray.count==0) {
            return 0;
        }
        return UITableViewAutomaticDimension;
    }
    if (indexPath.section==3) {
        if (indexPath.row==0) {
            if (self.home_analysisModel.trend.length>0||self.away_analysisModel.trend.length>0) {
                return AUTO(40);
            }
            return 0.01;
        }
        if (indexPath.row==1) {
            if (self.home_analysisModel.trend.length>0) {
                return AUTO(130);
            }
            return 0.01f;
        }
        if (indexPath.row==2) {
            if (self.away_analysisModel.trend.length>0) {
                return AUTO(130);
            }
            return 0.01f;
        }
        
        if (indexPath.row==3) {
            if (self.home_analysisModel.trend.length>0) {
                return AUTO(100);
            }
            return 0.01f;
        }
        if (indexPath.row==4) {
            if (self.away_analysisModel.trend.length>0) {
                return AUTO(60);
            }
            return 0.01f;
        }
        
        if (indexPath.row==5) {
            return UITableViewAutomaticDimension;
        }
        if (indexPath.row==6) {
            return AUTO(200);
        }
    }
    return 44;
}



-(void)updateTimeInVisibleCells{
    
    NSArray  *cells = self.tableView.visibleCells; //取出屏幕可见ceLl
    for (UITableViewCell *cell in cells) {
        if ([cell isKindOfClass:[JNMatchSJAgainstCountdown_Cell class]]) {
//            if (self.tjInfoDetailBall.str_time.length==0) {
//                return;
//            }
            NSDictionary *dic = [self getNowTimeWithString:@"1600707000"];
//             NSDictionary *dic = [self getNowTimeWithString:@"2020-05-24"];
            JNMatchSJAgainstCountdown_Cell *timeCell = (JNMatchSJAgainstCountdown_Cell *)cell;
            timeCell.hours = dic[@"hours"];
            timeCell.minutes = dic[@"minutes"];
            timeCell.seconds = dic[@"seconds"];
//
//            @{@"hours":hoursStr,@"minutes":hoursStr,@"seconds":secondsStr}
        }

    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return 10;
    }
    if (section==1) {
        return 0.001f;
    }
    if (section==3) {
        if ((self.vs_analysisModel.match.count>0||self.home_analysisModel.trend.length>0||self.away_analysisModel.trend.length>0)) {
            return AUTO(45);
        }else{
            return 0.01f;
        }
    }
    return AUTO(45);
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    JNMatchSJAgainstSectionTitleView *titleView = [JNMatchSJAgainstSectionTitleView new];
    if (section==0) {
        return [UIView new];
//        titleView.titleLab.text = @"大数据预测";
    }
    if (section==1) {
//        titleView.titleLab.text = @"历史同赔数据";
         titleView.titleLab.text = @"";
        return [UIView new];
    }
    if (section==2) {
        titleView.titleLab.text = @"指数分析";
    }
    if (section==3) {
        if (self.vs_analysisModel.match.count>0||self.home_analysisModel.trend.length>0||self.away_analysisModel.trend.length>0) {
            titleView.titleLab.text = @"球队分析";
        }else{
            return [UIView new];
        }
        
        
    }

    return titleView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section==0) {
        if (self.isLock) {
            return AUTO(8);
        }
        return AUTO(48);
    }
    if (section==2) {
        return AUTO(8);
    }
    return 0.0001;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    if (section==0&&!self.isLock) {
        JNMatchSJAgainstFootTipView *footView = [JNMatchSJAgainstFootTipView new];
        return footView;
    }
    UIView *backView= [UIView new];
    backView.backgroundColor = COLOR_F4F6F9;
    return backView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

-(NSDictionary *)getNowTimeWithString:(NSString *)aTimeString{
    
    NSDateFormatter* formater = [[NSDateFormatter alloc] init];
    [formater setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
//    [formater setDateFormat:@"yyyy-MM-dd"];
//    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[aTimeString longValue]];
//    NSString *dateString = [formater stringFromDate:date];
    // 截止时间date格式
    NSString  *expireStr = [NSDate wholeTimeStringWithInterval:[aTimeString longValue]];
    NSDate  *expireDate = [formater dateFromString:expireStr];
//    NSDate *expireDate = [NSDate dateWithTimeIntervalSince1970:[aTimeString longValue]];
    NSDate  *nowDate = [NSDate date];
    // 当前时间字符串格式
    NSString *nowDateStr = [formater stringFromDate:nowDate];
    // 当前时间date格式
    nowDate = [formater dateFromString:nowDateStr];
  
    NSTimeInterval timeInterval =[expireDate timeIntervalSinceDate:nowDate];
//    NSTimeInterval timeInterval  = [aTimeString longLongValue];
    
    int days = (int)(timeInterval/(3600*24));
    int hours = (int)((timeInterval-days*24*3600)/3600);
    int minutes = (int)(timeInterval-days*24*3600-hours*3600)/60;
    int seconds = timeInterval-days*24*3600-hours*3600-minutes*60;
    
    NSString *dayStr;NSString *hoursStr;NSString *minutesStr;NSString *secondsStr;
    //天
    dayStr = [NSString stringWithFormat:@"%d",days];
    //小时
    if (hours<10) {
        hoursStr = [NSString stringWithFormat:@"%02d",hours+days*24];
    }else{
        hoursStr = [NSString stringWithFormat:@"%d",hours+days*24];
    }
   //分钟
    if(minutes<10)
        minutesStr = [NSString stringWithFormat:@"%02d",minutes];
    else
        minutesStr = [NSString stringWithFormat:@"%d",minutes];
    //秒
    if(seconds < 10)
        secondsStr = [NSString stringWithFormat:@"%02d", seconds];
    else
        secondsStr = [NSString stringWithFormat:@"%d",seconds];
    if (days<=0&hours<=0&&minutes<=0&&seconds<=0) {
        hoursStr = @"00";
        minutesStr = @"00";
        secondsStr = @"00";
//        self.match_end = YES;
//        if (self.JCMatchStatusBlock) {
//            self.JCMatchStatusBlock(self.match_end);
//        }
//        return @"活动已经结束！";
         [self.countDown destoryTimer];
    }
    if (days) {
        
    }
    return @{@"hours":hoursStr,@"minutes":minutesStr,@"seconds":secondsStr};
}


//消息订阅
- (void)showOrderMsgView {
    self.tipView.frame  = CGRectMake(0, 0, SCREEN_WIDTH, AUTO(430));
    self.tipView.tipImgView.image= JCIMAGE(@"nodata_fangan_small");
    self.tipView.titleLab.text = @"您还未订阅该数据模型...";
    self.tipView.contentLab.text = @"订阅后可获得比分、胜平负、让球、进球数概率预测等\n服务，以及更加全面的分析数据。";
    
    [self.tipView.buyOneBtn setTitle:[NSString stringWithFormat:@"购买本场数据 %@红币/场",@([self.titleModel.big_data_one_price floatValue]/100)] forState:0];
    [self.tipView.buyMonthBtn setTitle:[NSString stringWithFormat:@"订阅此数据模型 %@红币/月",@([self.titleModel.big_data_price floatValue]/100)] forState:0];
    [self.view addSubview:self.tipView];
    if (self.titleModel.is_subscrib==3) {
        self.tipView.is_free = YES;
        self.tipView.isOnlyMonth = YES;
        self.tipView.tipImgView.image= JCIMAGE(@"nodata_bigdata_yidong");
        self.tipView.titleLab.text = @"";
        [self.tipView.buyMonthBtn setTitle:[NSString stringWithFormat:@"免费体验%@天，点击开通",self.titleModel.free_day] forState:0];
    }
    WeakSelf;
    self.tipView.JCSingleMatchBlock = ^(NSInteger type) {
        if (![JCWUserBall currentUser]) {
//            [weakSelf presentLogin];
            [[weakSelf getViewController].navigationController pushViewController:[JCLoginWMStickVC new] animated:YES];
            return;
        }
        if (self.titleModel.is_subscrib==3) {
            //免费体验
            [weakSelf FreeExperienceCheck];
            return;
        }
        
       
        //type 1是单场 2是包月
//    ps:11.25去掉鲸猜大数据单场购买
        if (type==1) {
            JCJingCaiAIBigDataBuyVC *vc = [JCJingCaiAIBigDataBuyVC new];
            vc.is_dc = YES;
            vc.match_id = weakSelf.matchBall.id;
            [[weakSelf getViewController].navigationController pushViewController:vc animated:YES];
//            [[weakSelf getViewController].navigationController pushViewController:vc animated:YES];
        }
        if (type==2) {
            [weakSelf showPayView];
        }
       

    };
}

#pragma mark -- 购买
- (void)showPayView {
    WeakSelf;
    JCPayShowView *payView = [JCPayShowView new];
    payView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    payView.price = [NSString stringWithFormat:@"%@",@([self.titleModel.big_data_price longValue]/100)];
    [self.jcWindow addSubview:payView];
    payView.JCSureBlock = ^(NSString * _Nonnull hb_id) {
        [weakSelf sureBuy];
    };
    payView.JCProtocolBlock = ^{
        WebViewController *vc = [WebViewController new];
        vc.showBackItem = YES;
            vc.titleStr = @"鲸猜足球用户购买协议";
            NSString *urlStr = [NSString  stringWithFormat:@"%@?dev=1",[JCConfigModel currentConfigModel].get_purchase];
            vc.urlStr = NonNil(urlStr);
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
        [weakSelf presentViewController:nav animated:YES completion:nil];
    };
    [payView show];

}

- (void)FreeExperienceCheck {
    JCBaseTitleAlertView *alertView = [JCBaseTitleAlertView new];
    alertView.contentLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(16)];
    [alertView alertTitle:@"确认开通" TitleColor:COLOR_2F2F2F Mesasge:@"" MessageColor:COLOR_2F2F2F SureTitle:@"确认" SureColor:JCWhiteColor SureHandler:^{
        
        [alertView removeFromSuperview];
        [self FreeExperience];

    } CancleTitle:@"取消" CancleColor:JCBaseColor CancelHandler:^{
       [alertView removeFromSuperview];
    }];
//    NSString *day =  [NSString stringWithFormat:@"%@",self.buyInfoModel.free_day];
    NSString *title = [NSString stringWithFormat:@"是否开通[鲸猜大数据报告] %@天免费体验",self.titleModel.free_day];
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:title];
    NSRange count_range = [title rangeOfString:NonNil(self.titleModel.free_day)];
    if (count_range.location!=NSNotFound) {
        [attr addAttributes:@{NSForegroundColorAttributeName:JCBaseColor} range:count_range];
    }

    
    alertView.contentLab.attributedText = attr;
    alertView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    [[UIApplication sharedApplication].keyWindow addSubview:alertView];
}

//免费体验
- (void)FreeExperience {
    
    [self.view showLoading];
    JCDataBaseService_New *service = [JCDataBaseService_New service];
    [service getKellyDataModeFreeExperienceWithModel_id:self.titleModel.id Success:^(id  _Nullable object) {
        [self.view endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
            self.titleModel.is_subscrib = 1;
            [self getBuyInfo];
        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

        
    } failure:^(NSError * _Nonnull error) {
        [self.view endLoading];
    }];



}

//确认购买
- (void)sureBuy {
    if ([self.titleModel.big_data_price integerValue]>0&&[[JCWUserBall currentUser].prize floatValue]<[self.titleModel.big_data_price integerValue]/100) {
        [JCWToastTool showHint:@"红币余额不足,请及时充值"];
        [[self getViewController].navigationController pushViewController:[JCChargeVC new] animated:YES];
        return;
    }
    
    NSString *scene = @"3";
    //1.鲸猜大数据 2指数异动 3历史同赔 4泊松分布 5机构分歧 6.指数分歧
    [self.view showLoading];
    JCHomeService_New *service = [JCHomeService_New new];
    [service getConfirmOrderWithUnique:@"0" scene:scene source:@"1" price:@"" Success:^(id  _Nullable object) {
        [self.view endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
            NSString *order_key = object[@"data"][@"order_key"];
            [self finalPayWithOrder_key:order_key coupon_id:@"" hongbao_id:@""];

        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        [self.view endLoading];
    }];
    
}
//下单并支付
- (void)finalPayWithOrder_key:(NSString *)order_key coupon_id:(NSString *)coupon_id hongbao_id:(NSString *)hongbao_id {
    [self.jcWindow showLoading];
    JCHomeService_New *service = [JCHomeService_New new];
    [service getPayOrderWithOrder_key:order_key pay_type:@"3" hongbao_id:hongbao_id coupon_id:coupon_id Success:^(id  _Nullable object) {
        [self.jcWindow endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
            NSString *is_pay = object[@"data"][@"is_pay"];
            if ([is_pay intValue]==1) {
                self.titleModel.is_subscrib = 1;
                [self getMyUserInfo];
                [self getBuyInfo];
            }
//            [self.tableView reloadData];

        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }
        
    } failure:^(NSError * _Nonnull error) {
        [self.jcWindow endLoading];
    }];
}



//比赛取消
- (void)matchCancelMsgView {
    self.tipView.frame  = CGRectMake(0, 0, SCREEN_WIDTH, AUTO(250));
    self.tipView.titleLab.text = @"本场比赛取消…";
    self.tipView.tipImgView.image= JCIMAGE(@"nodata_fangan_small");

    self.tipView.buyBgView.hidden = YES;
    [self.view addSubview:self.tipView];
}

//比赛延迟
- (void)matchDelayMsgView {
    self.tipView.frame  = CGRectMake(0, 0, SCREEN_WIDTH, AUTO(250));
    self.tipView.titleLab.text = @"本场比赛延迟…";
    self.tipView.tipImgView.image= JCIMAGE(@"nodata_fangan_small");

    self.tipView.buyBgView.hidden = YES;
    [self.view addSubview:self.tipView];
}

//比赛超时,无法购买
- (void)matchOutTimeMsgView {
    self.tipView.frame  = CGRectMake(0, 0, SCREEN_WIDTH, AUTO(250));
    self.tipView.titleLab.text = @"预测已截止，停止售卖。";
    self.tipView.tipImgView.image= JCIMAGE(@"nodata_fangan_small");

    self.tipView.buyBgView.hidden = YES;
    [self.view addSubview:self.tipView];
}

- (JNMatchSJAgainstTipView *)tipView {
    if (!_tipView) {
        _tipView = [JNMatchSJAgainstTipView new];
        _tipView.isOnlyMonth = YES;
    }
    return _tipView;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
