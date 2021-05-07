//
//  JCTeamDetailInfoHonorModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/23.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCTeamDetailInfoHonorModel : JCWBaseBall

@property (nonatomic,strong) NSString *honor_title;

@property (nonatomic,strong) NSString *honor_logo;

@property (nonatomic,strong) NSString *honor_count;

@property (nonatomic,strong) NSArray *honor_desc;

#pragma mark //新版本接口

@property (nonatomic,strong) NSString *team_honor_id;

@property (nonatomic,strong) NSString *team_id;

@property (nonatomic,strong) NSString *season_id;

@property (nonatomic,strong) NSString *competition_id;

@property (nonatomic,strong) NSString *season;

@property (nonatomic,strong) NSString *honor_id;

@property (nonatomic,strong) NSString *title_zh;

@property (nonatomic,strong) NSString *logo;

@property (nonatomic,strong) NSString *num;

@property (nonatomic,strong) NSArray *times;

@end

NS_ASSUME_NONNULL_END
