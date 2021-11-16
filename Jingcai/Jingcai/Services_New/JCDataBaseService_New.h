//
//  JCDataBaseService_New.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/12/28.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "BaseService.h"
#import "JCWInterfaceTool_New.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCDataBaseService_New : BaseService
//资料库首页
- (void)getDataBaseHomeDataWithSuccess:(successBlock)successBlock failure:(failureBlock)failureBlock;
////资料库列表
- (void)getDataBaseAreaListWithSuccess:(successBlock)successBlock failure:(failureBlock)failureBlock;
//赛事详情顶部信息
//competition_id 赛事id
//类型 type为1时获取 赛事头部 为2时 球队头部
- (void)getDataBaseEventInfoWithCompetition_id:(NSString *)competition_id type:(NSString *)type success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//赛事详情-基本信息
- (void)getDataBaseEventBaseInfoWithCompetiton_id:(NSString *)competiton_id season_id:(NSString *)season_id best_lineup_id:(NSString *)best_lineup_id success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//刷新基本信息-阵容数据
/*
 competiton_id 赛事ID
 best_lineup_id 最佳阵容ID
 **/
- (void)getDataBaseEventBaseInfo_ZhenRongWithCompetiton_id:(NSString *)competiton_id best_lineup_id:(NSString *)best_lineup_id success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//赛事详情和球队详情-积分榜
/*
 id type为1时传递球队ID，为2时传递联赛ID
 type 类型, 1球队，2联赛
 season_id 赛季ID
 stage_id 赛事阶段id
 */
- (void)getDataBaseScoreRankWithType:(NSString *)type competiton_id:(NSString *)competiton_id Season_id:(NSString *)season_id stage_id:(NSString *)stage_id Success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//获取赛事阶段列表
//season_id  赛季ID
- (void)getDataBaseStage_listWithSeason_id:(NSString *)season_id Success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//赛事详情-比赛
- (void)getDataBaseMatchListWithCompetiton_id:(NSString *)competiton_id Season_id:(NSString *)season_id stage_id:(NSString *)stage_id Success:(successBlock)successBlock failure:(failureBlock)failureBlock;

//获取球队榜或球员榜的统计参数列表
//type 0 球队，1 球员 默认为0
- (void)getDataBaseEventPlayerOrTeamLeftInfoWithType:(NSString *)type success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//获取赛事球员榜统计信息
//competiton_id 赛事ID
//type 统计参数值(get_stats_params接口的field字段)
//season_id 赛季ID
- (void)getDataBaseEventPlayerListInfoWithCompetiton_id:(NSString *)competiton_id type:(NSString *)type season_id:(NSString *)season_id Page:(NSInteger)page success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//获取赛事球队榜统计信息
//competiton_id 赛事ID
//type 统计参数值(get_stats_params接口的field字段)
//season_id 赛季ID
- (void)getDataBaseEventTeamListInfoWithCompetiton_id:(NSString *)competiton_id type:(NSString *)type season_id:(NSString *)season_id success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//获取赛季信息
//id type为1时传递球队ID，为2时传递联赛ID
//type 类型, 1积分榜，2球员榜
- (void)getDataBaseSeasonListWithType:(NSString *)type teamID:(NSString *)teamID success:(successBlock)successBlock failure:(failureBlock)failureBlock;
#pragma mark//球队
//球队-基本信息
- (void)getDataBaseTeamInfoWithTeam_id:(NSString *)team_id Success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//球队-比赛列表
- (void)getDataBaseTeam_MatchListWithTeam_id:(NSString *)team_id page:(NSInteger)page Success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//获取(球队)球员榜数据
//team_id 赛事ID
//type 统计参数值(get_stats_params接口的field字段)
//season_id 赛季ID
- (void)getDataBaseTeamPlayerListInfoWithTeam_id:(NSString *)team_id type:(NSString *)type season_id:(NSString *)season_id Page:(NSInteger)page success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//转会记录
//type 1表示转入 2表示转出 默认为1
- (void)getDataBaseTeam_ZhuanHuiRecordWithTeam_id:(NSString *)team_id type:(NSString *)type page:(NSInteger)page Success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//球队阵容
- (void)getDataBaseTeam_ZhenRongWithTeam_id:(NSString *)team_id Success:(successBlock)successBlock failure:(failureBlock)failureBlock;

#pragma mark 鲸猜大数据
// 鲸猜大数据-首页
- (void)getBigDataTopInfoWithsuccess:(successBlock)successBlock failure:(failureBlock)failureBlock;
//大数据购买页信息,有传match_id是单场,没有传是包月
- (void)getBigDataBuyInfooWithMatch_id:(NSString *)match_id success:(successBlock)successBlock failure:(failureBlock)failureBlock;
#pragma mark 鲸猜AI
// 鲸猜AI-顶部信息(不包含轮播)
- (void)getJingCaiAiTopInfoDataWithsuccess:(successBlock)successBlock failure:(failureBlock)failureBlock;
// 鲸猜AI-顶部轮播
- (void)getJingCaiAiTopCycleDataWithsuccess:(successBlock)successBlock failure:(failureBlock)failureBlock;
// 鲸猜AI-方案列表
//1 在售方案 2 历史方案 默认2
//2 让球 3进球数 不传 展示 全部 默认全部
- (void)getJingCaiAiTuiJianListWithType:(NSString *)type classfly:(NSString *)classfly Page:(NSInteger)page success:(successBlock)successBlock failure:(failureBlock)failureBlock;

#pragma mark 数据模型
//数据模型首页
- (void)getHomeDataModelWithSuccess:(successBlock)successBlock failure:(failureBlock)failureBlock;
//凯利指数模型购买信息
- (void)getKellyDataModelPayInfoWithModel_id:(NSString *)model_id Success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//凯利指数模型免费体验
- (void)getKellyDataModeFreeExperienceWithModel_id:(NSString *)model_id Success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//凯利指数列表
-(void)getKellyDataModeListWithDate:(NSString *)date Page:(NSInteger)page success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//凯利指数详情
//match_id 比赛id
- (void)getKellyDataModeDetailWithMatch_id:(NSString *)match_id Success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//凯利指数样本数据
//match_id 比赛id
- (void)getKellyDataModeDetailSampleDataWithMatch_id:(NSString *)match_id Success:(successBlock)successBlock failure:(failureBlock)failureBlock;
@end

NS_ASSUME_NONNULL_END
