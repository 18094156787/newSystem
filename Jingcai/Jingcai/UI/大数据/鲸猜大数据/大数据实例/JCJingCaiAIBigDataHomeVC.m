//
//  JCJingCaiAIBigDataHomeVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/27.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCJingCaiAIBigDataHomeVC.h"
#import "JNMatchSJAgainstSectionTitleView.h"
#import "JNMatchSJAgainstBF_Cell.h"
#import "JNMatchSJAgainstSPF_Cell.h"
#import "JNMatchSJAgainstBall_Cell.h"
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
#import "JNMatchSJAgainstMZ_Cell.h"
#import "JCJingCaiAIBigDataHeadView.h"
#import "JCJingCaiAIBigDataBuyVC.h"
#import "JCBigDataMonthProduceModel.h"
#import "JCJingCaiAIBigDataStyleHeadTitleView.h"

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
@interface JCJingCaiAIBigDataHomeVC ()

@property (nonatomic,strong) JCJingCaiAIBigDataHeadView *headView;

@property (nonatomic,strong) JCBigDataMonthProduceModel *productModel;

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

@property (nonatomic,assign) BOOL isLoad;

@end

@implementation JCJingCaiAIBigDataHomeVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
     self.navigationBarStyle = JCNavigationBarStyleDefault;
    [self hideNavShadow];
}


- (void)viewDidLoad {
    self.style = 1;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.isLock = YES;
    self.tableView.hidden= YES;
    [self initSubViews];
    [self refreshData];
//    [self getTopCycleData];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getTopInfoData) name:JingcaiAIProduceBuy object:nil];//包月购买
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getTopInfoData) name:NotificationUserLogin object:nil];
    
    
}

- (void)refreshData {
    [self getTopInfoData];
}

- (void)getTopInfoData {
//    [self.view showLoading];
    self.isLoad = NO;
    JCDataBaseService_New *service = [JCDataBaseService_New service];
    [service getBigDataTopInfoWithsuccess:^(id  _Nullable object) {
        self.tableView.hidden= NO;
        [self endRefresh];
        if ([JCWJsonTool isSuccessResponse:object]) {
            self.productModel = (JCBigDataMonthProduceModel *)[JCWJsonTool entityWithJson:object[@"data"] class:[JCBigDataMonthProduceModel class]];
            NSArray *noticeArray = [JCWJsonTool arrayWithJson:object[@"data"][@"now_match"] class:[JCJingCaiAINoticeModel class]];
            self.headView.productModel = self.productModel;
            self.headView.titleArray = noticeArray;
            if (noticeArray.count==0) {
                self.headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, AUTO(200));
            }else{
                self.headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, AUTO(240));
            }
            
            
//            self.mzArray = [JCWJsonTool arrayWithJson:object[@"data"][@"win_mark"] class:[JCBigDataMingZhongModel class]];
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
            self.isLoad = YES;
            [self.tableView reloadData];

        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        [self endRefresh];
        
        self.tableView.hidden= NO;
    }];


}

- (void)initSubViews {
//    self.headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, AUTO(250));
//    WeakSelf;
//
//    self.tableView.tableHeaderView = self.headView;
//    [self.view addSubview:self.tableView];
//    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.offset(0);
//        make.left.right.equalTo(self.view);
//        make.bottom.offset(-34);
//    }];

    
    self.tableView.separatorStyle = 0;
    self.tableView.estimatedRowHeight = 400;

    [self.tableView registerClass:[JNMatchSJAgainstBF_Cell class] forCellReuseIdentifier:@"JNMatchSJAgainstBF_Cell"];
    [self.tableView registerClass:[JNMatchSJAgainstSPF_Cell class] forCellReuseIdentifier:@"JNMatchSJAgainstSPF_Cell"];
    [self.tableView registerClass:[JNMatchSJAgainstBall_Cell class] forCellReuseIdentifier:@"JNMatchSJAgainstBall_Cell"];
    //历史同赔
    [self.tableView registerClass:[JNMatchSJAgainstHistortPay_SPFCell class] forCellReuseIdentifier:@"JNMatchSJAgainstHistortPay_SPFCell"];
    [self.tableView registerClass:[JNMatchSJAgainstHistortPay_RQCell class] forCellReuseIdentifier:@"JNMatchSJAgainstHistortPay_RQCell"];
    //指数分析
    [self.tableView registerClass:[JNMatchSJAgainstZhiShu_SPFChartCell class] forCellReuseIdentifier:@"JNMatchSJAgainstZhiShu_SPFChartCell"];
    [self.tableView registerClass:[JNMatchSJAgainstZhiShu_RQChartCell class] forCellReuseIdentifier:@"JNMatchSJAgainstZhiShu_RQChartCell"];
    [self.tableView registerClass:[JNMatchSJAgainstZhiShu_JQSChartCell class] forCellReuseIdentifier:@"JNMatchSJAgainstZhiShu_JQSChartCell"];
    
    //球队分析
    
    [self.tableView registerClass:[JNMatchSJAgainstZhiShu_JQSChart_TitleCell class] forCellReuseIdentifier:@"JNMatchSJAgainstZhiShu_JQSChart_TitleCell"];
    [self.tableView registerClass:[JNMatchSJAgainstTeam_ZhanjiCell class] forCellReuseIdentifier:@"JNMatchSJAgainstTeam_ZhanjiCell"];
    [self.tableView registerClass:[JNMatchSJAgainstTeam_HistoryBattleCell class] forCellReuseIdentifier:@"JNMatchSJAgainstTeam_HistoryBattleCell"];
    [self.tableView registerClass:[JNMatchSJAgainstTeam_SeasonRankCell class] forCellReuseIdentifier:@"JNMatchSJAgainstTeam_SeasonRankCell"];
    [self.tableView registerClass:[JNMatchSJAgainstMZ_Cell class] forCellReuseIdentifier:@"JNMatchSJAgainstMZ_Cell"];
    
    
//    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 34)];
    
//    self.headView.titleArray = @[@"",@"",@"",@""];
}
    



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section==0) {
        
        return 0;//3.1新版去掉这个
    }
    
    if (section==1) {
        return self.productModel?4:0;
    }
    if (section==2) {
//        return 3;
        return 0;
    }
    if (section==3) {
        return 3;
    }
    if (section==4) {
        if (self.vs_analysisModel.match.count>0) {
            return 6;
        }
        return 5;
    }
    return 1;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==0) {
        JNMatchSJAgainstMZ_Cell *cell = [tableView dequeueReusableCellWithIdentifier:@"JNMatchSJAgainstMZ_Cell"];
        cell.dataArray = self.mzArray;
        return cell;
    }
    if (indexPath.section==1) {
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

    if (indexPath.section==2) {
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
    if (indexPath.section==3) {
        if (indexPath.row==0&&self.trend_spfArray.count>0) {
            JNMatchSJAgainstZhiShu_SPFChartCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JNMatchSJAgainstZhiShu_SPFChartCell"];
            cell.dataArray = self.zhishu_spfArray;
            cell.panModel = self.sfpPanModel;
            cell.largeModel = self.sfpLargeModel;
//            if (self.isLoad) {
                cell.trendArray = self.trend_spfArray;
//            }
            
            
            return cell;
        }
        if (indexPath.row==1&&self.trend_rqArray.count>0) {
            JNMatchSJAgainstZhiShu_RQChartCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JNMatchSJAgainstZhiShu_RQChartCell"];
            cell.productModel = self.productModel;
            cell.dataArray = self.zhishu_rqArray;
            cell.panModel = self.rqPanModel;
             cell.largeModel = self.rqLargeModel;
            cell.trendArray = self.trend_rqArray;
            return cell;
        }
        if (indexPath.row==2&&self.trend_jqsArray.count>0) {
            JNMatchSJAgainstZhiShu_JQSChartCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JNMatchSJAgainstZhiShu_JQSChartCell"];
            cell.productModel = self.productModel;
            cell.dataArray = self.zhishu_jqsArray;
            cell.panModel = self.jqsPanModel;
             cell.largeModel = self.jqsLargeModel;
            cell.trendArray = self.trend_jqsArray;
            return cell;
        }


    }
    if (indexPath.section==4) {
        
        if (indexPath.row==0) {
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
            JNMatchSJAgainstTeam_HistoryBattleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JNMatchSJAgainstTeam_HistoryBattleCell"];
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
        return UITableViewAutomaticDimension;
    }
    if (indexPath.section==1) {
//         return AUTO(140);

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
    if (indexPath.section==2) {
        if (indexPath.row==0) {
            return AUTO(105);
        }
        return AUTO(88);
    }
    if (indexPath.section==3) {
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
    if (indexPath.section==4) {
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

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    if (section==1) {
//        return AUTO(90);
//    }
    if (section==2) {
//        eturn AUTO(45);
        return 0.001f;
    }
    if (section==0) {
        return self.mzArray.count>0?AUTO(45):0.001f;
    }
    if (section==4) {
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
    }
    
    if (section==1) {
        titleView.titleLab.text = @"大数据预测";
        titleView.iconView.hidden = NO;
        return titleView;
    }

    if (section==3) {
        titleView.titleLab.text = @"指数分析";
        titleView.iconView.hidden = NO;
        return titleView;
    }
    if (section==4) {
        if (self.vs_analysisModel.match.count>0||self.home_analysisModel.trend.length>0||self.away_analysisModel.trend.length>0) {
            titleView.titleLab.text = @"球队分析";
            titleView.iconView.hidden = NO;
            return titleView;
        }else{
            return [UIView new];
        }

    }

    return [UIView new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section==1) {
        return AUTO(48);
    }
    if (section==3) {
        return AUTO(8);
    }
    return 0.0001;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    if (section==1) {
        JNMatchSJAgainstBallFootView *footView = [JNMatchSJAgainstBallFootView new];
        return footView;
    }
    UIView *backView= [UIView new];
    backView.backgroundColor = COLOR_F4F6F9;
    return backView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView reloadData];
}
- (JCJingCaiAIBigDataHeadView *)headView {
    if (!_headView) {
        _headView = [JCJingCaiAIBigDataHeadView new];
    }
    return _headView;
}

@end
