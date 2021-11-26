//
//  JCKellyDataDetailModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/16.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"
#import "JCMatchTeamBall.h"
#import "JCKellyDataModelOddsModel.h"
#import "JCHistoryPayDataModel.h"
#import "JCHistoryPayMatchDataModel.h"
#import "JCTransactionDataOddsChangeModel.h"
#import "JCHistoryPayDataModel.h"
#import "JCTransactionDataContrastModel.h"
#import "JCTransactionDataOddsDetailModel.h"
#import "JCDiscreteTrackRateModel.h"
#import "JCKellyDataDetailSampleModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCKellyDataDetailModel : JCWBaseBall

@property (nonatomic,copy) NSString *id;

@property (nonatomic,copy) NSString *type;

@property (nonatomic,copy) NSString *title;

@property (nonatomic,copy) NSString *get_match_time;//比赛时间

@property (nonatomic,assign) NSInteger home_all_score;//主队比分

@property (nonatomic,assign) NSInteger away_all_score;//客队比分

@property (nonatomic,copy) NSString *first_half_time;//上半场开始时间

@property (nonatomic,copy) NSString *second_half_time;//下半场开始时间

@property (nonatomic,strong) JCMatchTeamBall *home_team;

@property (nonatomic,strong) JCMatchTeamBall *away_team;

@property (nonatomic,copy) NSString *status_cn;

@property (nonatomic,assign) NSInteger status_id;//0:比赛异常1:未开赛2:上半场3:中场4:下半场5:加时赛6:加时赛(弃用)7:点球决战8:完场9:推迟10:中断11:腰斩12:取消13:待定

@property (nonatomic,assign) NSInteger competition_type;//赛事类型,1联赛,2杯赛

@property (nonatomic,copy) NSString *competition_name;//赛事名称

@property (nonatomic,assign) NSInteger home_team_position;//主队排名,competition_type=1才有

@property (nonatomic,assign) NSInteger away_team_position;//客队排名,competition_type=1才有

@property (nonatomic,strong) JCKellyDataModelOddsModel *odds_index;//指数详情

@property (nonatomic,assign) NSInteger company_num;//完成机构分歧计算的公司数

@property (nonatomic,copy) NSString *more_introduce;

#pragma mark 泊松分布
@property (nonatomic, strong) NSArray<NSString *> *goals_avg;//场均进球：[主队,客队]

@property (nonatomic, strong) NSArray<NSString *> *goals_against_avg;//场均失球：[主队,客队]

@property (nonatomic, strong) NSArray<NSString *> *attacking;//进攻能力：[主队,客队]

@property (nonatomic, strong) NSArray<NSString *> *defending;//防守能力：[主队,客队]

@property (nonatomic, strong) NSArray<NSString *> *score_guess;//比分预测[[0-1,30],[1-2,20]]解释：【比分0-1，概率30】


//@property (nonatomic, strong) NSArray<NSString *> *goals_num_guess;//总进球数预测[[1,30],[3,20]] 解释：【进球数1个，概率30】

@property (nonatomic, strong) NSArray<NSString *> *jin_qiu_shu;

@property (nonatomic, strong) NSArray<NSString *> *bi_fen;

#pragma mark 历史同赔

@property (nonatomic, strong) JCHistoryPayDataModel *similar;

@property (nonatomic, strong) JCHistoryPayMatchDataModel *similar_match;

@property (nonatomic, assign) NSInteger wl;// 红黑 1红 2黑 0未开奖

@property (nonatomic, strong) NSString *spf_result;//比赛结果 0未结束 1主胜 2平 3主负

#pragma mark 指数异动

@property (nonatomic, strong) NSArray *compare_odds;//异动数据的compare_odds[0]初指和compare_odds[1]即指

@property (nonatomic, strong) NSArray *odds_change_list;//异动数据列表

@property (nonatomic, strong) NSArray *same_initial_compensation;//初指相同的比赛

@property (nonatomic, strong) NSArray *data_contrast;//数据对比

@property (nonatomic, strong) NSArray *odds_list;//指数详情

#pragma mark 指数分歧
@property (nonatomic,strong) NSArray *begin_odds;

@property (nonatomic,strong) NSArray *last_odds;

@property (nonatomic,strong) NSArray *begin_discrete_value;//初指分歧值

@property (nonatomic,strong) NSArray *last_discrete_value;//即指分歧值

@property (nonatomic,strong) NSString *total_discrete_sample;//赔率数据总条数

@property (nonatomic,strong) NSArray *last_odds_rate;//即指赔率

@property (nonatomic,strong) NSArray *discrete_sample_list;//

@property (nonatomic,strong) NSArray *sample_data;//样本数据



@end

NS_ASSUME_NONNULL_END
