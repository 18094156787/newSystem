//
//  JCJingCaiMatchModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2019/9/25.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@class JCJingCaiMatchInfoModel,JCJingCaiMatchDanguanInfoModel,JCJingCaiMatchRequstInfoModel;
@interface JCJingCaiMatchModel : JCWBaseBall

@property (nonatomic,strong) JCJingCaiMatchInfoModel *noRq;

@property (nonatomic,strong) JCJingCaiMatchInfoModel *Rq;

@property (nonatomic,strong) JCJingCaiMatchDanguanInfoModel *single;

@property (nonatomic,copy) NSString *match_time;

@property (nonatomic,copy) NSString *ymd;

@property (nonatomic,copy) NSString *time;

@property (nonatomic,copy) NSString *event_name;

@property (nonatomic,copy) NSString *homoLogo;

@property (nonatomic,copy) NSString *awayLogo;

@property (nonatomic,copy) NSString *homeName;

@property (nonatomic,copy) NSString *awayName;

@property (nonatomic,copy) NSString *match_name;

@property (nonatomic,copy) NSString *match_id;

@property (nonatomic,copy) NSString *fullScore;

@property (nonatomic,assign) BOOL isSelect;

@property (nonatomic,strong) NSString *select_spf;;//当前选中的

@property (nonatomic,copy) NSString *select_match_id;//当前选中的

@property (nonatomic,copy) NSString *op_id;//(不让球的赔率id)

@property (nonatomic,copy) NSString *rop_id;//(让球赔率id)

@property (nonatomic,copy) NSString *spf;//胜平负 (123 胜平负  456 让球胜平负)

@property (nonatomic,copy) NSString *type;

@property (nonatomic,strong) JCJingCaiMatchRequstInfoModel *requestModel;

@property (nonatomic,strong,nullable) JCJingCaiBtn*currentBtn;

@property (nonatomic,copy) NSString *full_home_score;//比分

@property (nonatomic,copy) NSString *full_away_score;//比分

@property (nonatomic,assign) NSInteger is_guess;

/*扩展*/

@property (nonatomic,strong) NSString *spf_type;

#pragma mark//新版本接口

@property (nonatomic,strong) NSArray*home_rate;

@property (nonatomic,strong) NSArray*away_rate;

@property (nonatomic,strong) NSString *issue_num;//周几00几

@property (nonatomic,strong) NSString *competition_name;//赛事名称

@property (nonatomic,strong) NSString *competition_id;//赛事id

@property (nonatomic,assign) NSInteger is_future;//0 未预测 1 已预测

@property (nonatomic,strong) NSString *home_team_name;

@property (nonatomic,strong) NSString *away_team_name;

@property (strong, nonatomic) NSString *home_team_logo;

@property (strong, nonatomic) NSString *away_team_logo;

@property (strong, nonatomic) NSString *select_index;//用户的预测

@end

@interface JCJingCaiMatchInfoModel : JCWBaseBall

@property (nonatomic,copy) NSString *id;

@property (nonatomic,copy) NSString *rq;

@property (nonatomic,copy) NSString *win;

@property (nonatomic,copy) NSString *lose;

@property (nonatomic,copy) NSString *equal;

@property (nonatomic,copy) NSString *created_at;

@end

@interface JCJingCaiMatchDanguanInfoModel : JCWBaseBall

@property (nonatomic,assign) NSInteger is_rq;//1是单关，0是非单关

@property (nonatomic,assign) NSInteger is_norq;

@end

@interface JCJingCaiMatchRequstInfoModel : JCWBaseBall

@property (nonatomic,copy) NSString *match_id;

@property (nonatomic,copy) NSString *op_id;//(不让球的赔率id)

@property (nonatomic,copy) NSString *rop_id;//(让球赔率id)

@property (nonatomic,copy) NSString *spf;//胜平负 (123 胜平负  456 让球胜平负)

@property (nonatomic,assign) NSInteger type;//1是单关 2是多串

@property (nonatomic,copy) NSString *value;//赔率

@property (nonatomic,copy) NSString *match_time;

@property (nonatomic,strong) NSMutableArray *btnArray;

@end



NS_ASSUME_NONNULL_END
