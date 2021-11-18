//
//  JCTransactionDataModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/18.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"
#import "JCTransactionDataOddsModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCTransactionDataModel : JCWBaseBall

@property (nonatomic, copy) NSString *away_score;

@property (nonatomic, assign) NSInteger away_team_id;

@property (nonatomic, copy) NSString *away_team_logo;

@property (nonatomic, copy) NSString *away_team_name;

@property (nonatomic, assign) NSInteger change_position;

@property (nonatomic, assign) NSInteger change_type;

@property (nonatomic, copy) NSString *change_value;

@property (nonatomic, strong) NSArray<NSString *> *compare_odds;

@property (nonatomic, strong) JCTransactionDataOddsModel *compare_odds_change_data;
//
//@property (nonatomic, strong) RootClassDataListCompensation_data *compensation_data;

@property (nonatomic, copy) NSString *competition_color;

@property (nonatomic, copy) NSString *competition_name;

@property (nonatomic, assign) NSInteger first_half_time;

@property (nonatomic, copy) NSString * home_score;

@property (nonatomic, copy) NSString * home_team_id;

@property (nonatomic, copy) NSString *home_team_logo;

@property (nonatomic, copy) NSString *home_team_name;

@property (nonatomic, assign) NSInteger id;

@property (nonatomic, assign) NSInteger match_id;

@property (nonatomic, assign) NSInteger match_time;

@property (nonatomic, copy) NSString *match_time_str;

@property (nonatomic, copy) NSString *odds_change_name;

@property (nonatomic, assign) NSInteger second_half_time;
@property (nonatomic, copy) NSString *status_cn;

@property (nonatomic, assign) NSInteger status_id;

@property (nonatomic, assign) NSInteger type;

@property (nonatomic, copy) NSString *type_name;

@end

NS_ASSUME_NONNULL_END
