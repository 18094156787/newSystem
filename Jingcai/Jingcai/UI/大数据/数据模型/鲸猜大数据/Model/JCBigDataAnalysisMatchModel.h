//
//  JCBigDataAnalysisMatchModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/10/12.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCBigDataAnalysisMatchModel : JCWBaseBall

@property (nonatomic,copy) NSString *event_name;

@property (nonatomic,copy) NSString *match_time;

@property (nonatomic,copy) NSString *home_name;

@property (nonatomic,copy) NSString *away_name;

@property (nonatomic,copy) NSString *home_score;

@property (nonatomic,copy) NSString *away_score;

@property (nonatomic,copy) NSString *half_home_score;

@property (nonatomic,copy) NSString *half_away_score;

@end

NS_ASSUME_NONNULL_END
