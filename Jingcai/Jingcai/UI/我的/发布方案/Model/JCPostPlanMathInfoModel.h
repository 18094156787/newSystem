//
//  JCPostPlanMathInfoModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2019/12/31.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"
#import "JCPostButton.h"
#import "JCWMatchBall.h"
#import "JCPostPlanMathInfoSPFModel.h"
NS_ASSUME_NONNULL_BEGIN
@class JCPostPlanMathInfoYllModel,JCPostPlanMathInfoRqYllModel,JCPostPlanMathInfoOtherModel;
    @interface JCPostPlanMathInfoModel : JCWBaseBall

//@property (nonatomic,copy) NSString *match_num;

@property (nonatomic,copy) NSString *matchTime;

@property (nonatomic,copy) NSString *title;

@property (nonatomic,copy) NSString *titleInfo;

@property (nonatomic,copy) NSString *leagueName;

@property (nonatomic,copy) NSString *matchName;

@property (nonatomic,copy) NSString *homeName;

@property (nonatomic,copy) NSString *awayName;

@property (nonatomic,strong) NSArray <JCWMatchBall *>*match;

@property (strong, nonatomic) NSString  * awayLogo;

@property (strong, nonatomic) NSString  * homeLogo;

@property (nonatomic,copy) NSString *yp_win;

@property (nonatomic,copy) NSString *yp_rq;

@property (nonatomic,copy) NSString *yp_id;

@property (nonatomic,copy) NSString *yp;

@property (nonatomic,copy) NSString *yp_lose;

@property (nonatomic,copy) NSString *norq;

@property (nonatomic,copy) NSString *spf_new;

@property (nonatomic,copy) NSString *spf_new2;

@property (nonatomic,copy) NSString *is_rq;

//@property (nonatomic,copy) NSString *spf;

@property (nonatomic,copy) NSString *rq;


//亚盘数据

@property (nonatomic,copy) NSString *win;

@property (nonatomic,copy) NSString *pk;

@property (nonatomic,copy) NSString *lose;

@property (nonatomic,strong)JCPostPlanMathInfoYllModel *yll;

@property (nonatomic,strong)JCPostPlanMathInfoRqYllModel *rqyll;

@property (nonatomic,strong)JCPostPlanMathInfoYllModel *old_pl;

@property (nonatomic,strong)JCPostPlanMathInfoRqYllModel *rold_pl;

@property (nonatomic,strong) NSMutableArray *btnArray;

@property (nonatomic,strong,nullable) JCPostButton *selectBtn;


#pragma mark//新版本接口

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

@property (nonatomic,strong) NSString *match_time_three;

@property (nonatomic,strong) NSString *home_scores;

@property (nonatomic,strong) NSString *away_scores;

@property (nonatomic,strong) NSString *round_num;

@property (nonatomic,strong) NSString *get_match_time;

@property (nonatomic,strong) NSString *match_long_time;

@property (nonatomic,strong) NSString *competition_name;

@property (nonatomic,strong) NSString *competition_logo;

@property (nonatomic,strong) NSString *home_team_name;

@property (nonatomic,strong) NSString *away_team_name;

@property (nonatomic,strong) NSString *home_team_logo;

@property (nonatomic,strong) NSString *away_team_logo;

@property (nonatomic,strong) NSString *issue_num;

//

@property (nonatomic,strong) NSString *odds_spf;

@property (nonatomic,strong) NSString *odds_rq;

@property (nonatomic,strong) NSString *odds_yp;

@property (nonatomic,strong) NSString *odds_dxq;

@property (nonatomic,strong) JCPostPlanMathInfoSPFModel *odds_spf_model;

@property (nonatomic,strong) JCPostPlanMathInfoSPFModel *odds_rq_model;

@property (nonatomic,strong) JCPostPlanMathInfoSPFModel *odds_yp_model;

@property (nonatomic,strong) JCPostPlanMathInfoSPFModel *odds_dxq_model;





@end

@interface JCPostPlanMathInfoYllModel : JCWBaseBall

@property (nonatomic,copy) NSString *id;

@property (nonatomic,copy) NSString *type;

@property (nonatomic,copy) NSString *match_num;

@property (nonatomic,copy) NSString *company_name;

@property (nonatomic,copy) NSString *equal;

@property (nonatomic,copy) NSString *win;

@property (nonatomic,copy) NSString *lose;

@property (nonatomic,copy) NSString *rq;

@end

@interface JCPostPlanMathInfoRqYllModel : JCWBaseBall

@property (nonatomic,copy) NSString *id;

@property (nonatomic,copy) NSString *type;

@property (nonatomic,copy) NSString *match_num;

@property (nonatomic,copy) NSString *company_name;

@property (nonatomic,copy) NSString *equal;

@property (nonatomic,copy) NSString *win;

@property (nonatomic,copy) NSString *lose;

@property (nonatomic,copy) NSString *rq;

@end

@interface JCPostPlanMathInfoOtherModel : JCWBaseBall

@property (nonatomic,copy) NSString *id;

@property (nonatomic,copy) NSString *style;

@property (nonatomic,copy) NSString *match_id;

@property (nonatomic,copy) NSString *company_id;

@property (nonatomic,copy) NSString *equal;

@property (nonatomic,copy) NSString *win;

@property (nonatomic,copy) NSString *lose;

@property (nonatomic,copy) NSString *rq;

@property (nonatomic,copy) NSString *minute;

@property (nonatomic,copy) NSString *score;

@property (nonatomic,copy) NSString *match_num;

@end

NS_ASSUME_NONNULL_END
