//
//  JCJingCaiResultMatchModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2019/9/29.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"
#import "JCJingCaiMatchModel.h"
@class JCJingCaiResultInfoMatchModel;
NS_ASSUME_NONNULL_BEGIN

@interface JCJingCaiResultMatchModel : JCWBaseBall

@property (nonatomic,copy) NSString *hb;

@property (nonatomic,copy) NSString *type;

@property (nonatomic,copy) NSString *sf;

@property (nonatomic,copy) NSString *time;


@property (nonatomic,copy) NSString *id;

@property (nonatomic,copy) NSString *number;

@property (nonatomic,copy) NSString *user_id;

@property (nonatomic,assign) NSInteger is_buy;//

@property (nonatomic,copy) NSString * deal_status;//1 黑色（已退款） 2 红色（待退款） 3 绿色

@property (nonatomic,copy) NSString *deal_type;//

@property (nonatomic,copy) NSString *buy_count;

@property (nonatomic,copy) NSString *out_info;

@property (nonatomic,copy) NSString *content; //审核内容

@property (nonatomic,copy) NSString *content_status;// 0 审核中  1 通过 2 未通过 （不传则不需要审核）

@property (nonatomic,copy) NSString *reason;//审核不通过原因

@property (nonatomic,assign) BOOL showContent;

@property (nonatomic,strong) NSArray <JCJingCaiResultInfoMatchModel *>*match;

#pragma mark//新版本接口

@property (nonatomic,strong) JCJingCaiResultInfoMatchModel *match_info;

@property (nonatomic,strong) id spf;//选择的预测

@property (nonatomic,strong) id spf_result;//预测结果

@property (nonatomic,strong) NSArray *home_rate;//主赔率

@property (nonatomic,strong) NSArray *away_rate;//让球赔率

@property (nonatomic,assign) NSInteger wl;//wl   0未开始 1红 2黑 3赢半 4输半 5走水 6延迟 7取消

@property (nonatomic,copy) NSString *match_id;

@property (nonatomic,copy) NSString *odds_rq;

@property (nonatomic,copy) NSString *odds_spf;

@property (nonatomic,copy) NSString *match_future_time;

@property (nonatomic,copy) NSString *match_long_time;

@property (nonatomic,copy) NSString *get_match_time;

@property (nonatomic,copy) NSString *competition_name;

@property (nonatomic,copy) NSString *home_team_name;

@property (nonatomic,copy) NSString *home_team_logo;

@property (nonatomic,copy) NSString *away_team_name;

@property (nonatomic,copy) NSString *away_team_logo;

@property (nonatomic,copy) NSString *group_num;

@property (nonatomic,copy) NSString *round_num;

@property (nonatomic,copy) NSString *is_guess;

@property (nonatomic,copy) NSString *issue_num;

@property (nonatomic,copy) NSString *issue_week;

@property (nonatomic,copy) NSString *fullScore;

@property (nonatomic,assign) NSInteger is_reverse;//字段，表示比赛是否主客相反，0否，1是

@end

@interface JCJingCaiResultInfoMatchModel : JCWBaseBall

@property (nonatomic,copy) NSString *spf_type;

@property (nonatomic,copy) NSString *spf;

@property (nonatomic,copy) NSString *spfresult_type;

@property (nonatomic,copy) NSString *spf_result;

@property (nonatomic,strong) JCJingCaiMatchModel *match_info;

#pragma mark//新版本接口

@property (nonatomic,copy) NSString *match_id;

@property (nonatomic,copy) NSString *match_time;

@property (nonatomic,copy) NSString *match_future_time;

@property (nonatomic,copy) NSString *match_long_time;

@property (nonatomic,copy) NSString *get_match_time;

@property (nonatomic,copy) NSString *competition_name;

@property (nonatomic,copy) NSString *home_team_name;

@property (nonatomic,copy) NSString *home_team_logo;

@property (nonatomic,copy) NSString *away_team_name;

@property (nonatomic,copy) NSString *away_team_logo;

@property (nonatomic,copy) NSString *group_num;

@property (nonatomic,copy) NSString *round_num;

@property (nonatomic,copy) NSString *is_guess;

@property (nonatomic,copy) NSString *issue_num;

@property (nonatomic,copy) NSString *issue_week;

@property (nonatomic,strong) NSArray *home_scores;//主队得分,取第0个

@property (nonatomic,strong) NSArray *away_scores;//

//预设的字段
@property (nonatomic,copy) NSString *fullScore;

@property (nonatomic,assign) NSInteger is_reverse;//字段，表示比赛是否主客相反，0否，1是
@end

NS_ASSUME_NONNULL_END
