//
//  JCJingCaiAINoticeModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/28.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCJingCaiAINoticeModel : JCWBaseBall

@property (nonatomic,strong) NSString *event_name;

@property (nonatomic,strong) NSString *home_name;

@property (nonatomic,strong) NSString *away_name;

@property (nonatomic,strong) NSString *home_score;

@property (nonatomic,strong) NSString *away_score;

@property (nonatomic,strong) NSString *date;

@property (nonatomic,strong) NSString *time;

#pragma mark//新版本接口

@property (nonatomic,strong) NSString *id;

@property (nonatomic,strong) NSString *competition_id;

@property (nonatomic,strong) NSString *home_team_id;

@property (nonatomic,strong) NSString *away_team_id;

@property (nonatomic,strong) NSString *match_time;

@property (nonatomic,strong) NSString *home_scores;

@property (nonatomic,strong) NSString *away_scores;

@property (nonatomic,strong) NSString *round_num;

@property (nonatomic,strong) NSString *match_id;

@property (nonatomic,strong) NSString *get_match_time;

@property (nonatomic,strong) NSString *competition_name;

@property (nonatomic,strong) NSString *competition_logo;

@property (nonatomic,strong) NSString *home_team_name;

@property (nonatomic,strong) NSString *away_team_name;

@property (nonatomic,strong) NSString *home_team_logo;

@property (nonatomic,strong) NSString *away_team_logo;

@end

NS_ASSUME_NONNULL_END
