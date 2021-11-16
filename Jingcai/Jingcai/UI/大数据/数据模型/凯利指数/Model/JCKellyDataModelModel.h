//
//  JCKellyDataModelModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/15.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"
#import "JCKellyDataModelOddsModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCKellyDataModelModel : JCWBaseBall

@property (nonatomic, assign) NSInteger away_score;

@property (nonatomic, assign) NSInteger away_team_id;

@property (nonatomic, copy) NSString *away_team_logo;

@property (nonatomic, copy) NSString *away_team_name;

@property (nonatomic, assign) NSInteger company_num;

@property (nonatomic, copy) NSString *competition_color;

@property (nonatomic, assign) NSInteger competition_id;

@property (nonatomic, assign) long first_half_time;

@property (nonatomic, assign) NSInteger home_score;

@property (nonatomic, assign) NSInteger home_team_id;

@property (nonatomic, copy) NSString *home_team_logo;

@property (nonatomic, copy) NSString *home_team_name;

@property (nonatomic, assign) NSInteger id;

@property (nonatomic, copy) NSString *match_id;

@property (nonatomic, assign) NSInteger match_time;

@property (nonatomic, copy) NSString *match_time_str;

//@property (nonatomic, strong) RootClassDataListOdds_index *odds_index;

@property (nonatomic, assign) long second_half_time;

@property (nonatomic, copy) NSString *short_name_zh;

@property (nonatomic, copy) NSString *status_cn;

@property (nonatomic, assign) NSInteger status_id;

@property (nonatomic, strong) JCKellyDataModelOddsModel *odds_index;

@end

NS_ASSUME_NONNULL_END
