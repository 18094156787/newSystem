//
//  JCTeamDetailPlayerSeasonModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/23.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCTeamDetailPlayerSeasonModel : JCWBaseBall

@property (nonatomic,strong) NSString *season_id;

@property (nonatomic,strong) NSString *season_name;

#pragma mark//新版本接口

@property (nonatomic,strong) NSString *id;

@property (nonatomic,strong) NSString *stage_name;

@property (nonatomic,strong) NSString *stage_id;

@property (nonatomic,strong) NSString *round_count;

@property (nonatomic,strong) NSString *group_count;

@property (nonatomic,strong) NSString *year;

@end

NS_ASSUME_NONNULL_END
