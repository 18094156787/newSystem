//
//  JCTipMatchInfoModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/10/14.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCTipMatchInfoModel : JCWBaseBall

@property (nonatomic,copy) NSString *match_id;

@property (nonatomic,copy) NSString *time;

@property (nonatomic,copy) NSString *home_score;

@property (nonatomic,copy) NSString *away_score;

@property (nonatomic,copy) NSString *home_team_name;

@property (nonatomic,copy) NSString *away_team_name;

@property (nonatomic,copy) NSString *competition_name;//联赛名称

@property (nonatomic,copy) NSString *type;//类型 1进球 （其他的以后在说）

@property (nonatomic,copy) NSString *position;// 1 主队 2客队

@property (nonatomic,copy) NSString *goal_time;//进球时间（68'）

@property (nonatomic,copy) NSString *match_time;

@property (nonatomic,copy) NSString *wl;


@end

NS_ASSUME_NONNULL_END
