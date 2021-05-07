//
//  JCPostPlanMathInfoModel_New.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/27.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"
#import "JCPostPlanMathInfoSPFModel.h"
//#import "JCHongBangMatchModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCPostPlanMathInfoModel_New : JCWBaseBall

@property (nonatomic,strong) NSString *id;

@property (nonatomic,strong) NSString *user_id;

@property (nonatomic,strong) NSString *tuijian_id;

@property (nonatomic,strong) NSString *match_num;

@property (nonatomic,strong) NSString *match_id;

@property (nonatomic,strong) NSString *spf;

@property (nonatomic,strong) NSString *classfly;

@property (nonatomic,strong) NSString *week_number;

@property (nonatomic,strong) NSString *competition_id;

@property (nonatomic,strong) NSString *home_team_id;

@property (nonatomic,strong) NSString *away_team_id;

@property (nonatomic,strong) NSString *match_time;

@property (nonatomic,strong) NSString *home_scores;

@property (nonatomic,strong) NSString *away_scores;

@property (nonatomic,strong) NSString *round_num;

@property (nonatomic,strong) NSString *get_match_time;

@property (nonatomic,strong) NSString *competition_name;

@property (nonatomic,strong) NSString *competition_logo;

@property (nonatomic,strong) NSString *home_team_name;

@property (nonatomic,strong) NSString *away_team_name;

@property (nonatomic,strong) NSString *home_team_logo;

@property (nonatomic,strong) NSString *away_team_logo;
//

@property (nonatomic,strong) NSString *odds_spf;

@property (nonatomic,strong) NSString *odds_rq;

@property (nonatomic,strong) NSString *odds_yp;

@property (nonatomic,strong) NSString *odds_dxq;

@property (nonatomic,strong) JCPostPlanMathInfoSPFModel *odds_spf_model;

@property (nonatomic,strong) JCPostPlanMathInfoSPFModel *odds_rq_model;

@property (nonatomic,strong) JCPostPlanMathInfoSPFModel *odds_yp_model;

@property (nonatomic,strong) JCPostPlanMathInfoSPFModel *odds_dxq_model;


//@property (nonatomic,strong) JCHongBangMatchModel *match;
//
//@property (nonatomic,strong) JCPostPlanMathInfoSPFModel *odds_rq;
//
//@property (nonatomic,strong) JCPostPlanMathInfoSPFModel *odds_spf;

@end

NS_ASSUME_NONNULL_END
