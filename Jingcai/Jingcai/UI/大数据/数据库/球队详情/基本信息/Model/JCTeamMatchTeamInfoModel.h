//
//  JCTeamMatchTeamInfoModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/21.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCTeamMatchTeamInfoModel : JCWBaseBall

@property (nonatomic,strong) NSString *team_id;

@property (nonatomic,strong) NSString *logo;

@property (nonatomic,strong) NSString *name_zh;//球队名称

@property (nonatomic,strong) NSString *name_en;

@property (nonatomic,strong) NSString *short_name_zh;//球队简称

@property (nonatomic,strong) NSString *foundation_time;//成立时间

@property (nonatomic,strong) NSString *manager_id;//教练ID

@property (nonatomic,strong) NSString *venue_id;//球馆ID

@property (nonatomic,strong) NSString *manager_name;//教练名称

@property (nonatomic,strong) NSString *manager_name_en;

@property (nonatomic,strong) NSString *manager_logo;//教练头像

@property (nonatomic,strong) NSString *venue_name;//球场名称

@property (nonatomic,strong) NSString *venue_name_en;//球场英文名称

@property (nonatomic,strong) NSString *capacity;//球场容量

@end

NS_ASSUME_NONNULL_END
