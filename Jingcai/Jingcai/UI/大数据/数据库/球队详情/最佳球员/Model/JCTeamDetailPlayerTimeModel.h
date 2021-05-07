//
//  JCTeamDetailPlayerTimeModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/23.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"
#import "JCTeamDetailPlayerSeasonModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCTeamDetailPlayerTimeModel : JCWBaseBall

@property (nonatomic,strong) NSString *event_id;

@property (nonatomic,strong) NSString *event_name;

@property (nonatomic,strong) NSArray <JCTeamDetailPlayerSeasonModel *>*season;

#pragma mark //新版本接口

@property (nonatomic,strong) NSString *competition_id;

@property (nonatomic,strong) NSString *comp_name;

@property (nonatomic,strong) NSArray <JCTeamDetailPlayerSeasonModel *>*season_list;

@end

NS_ASSUME_NONNULL_END
