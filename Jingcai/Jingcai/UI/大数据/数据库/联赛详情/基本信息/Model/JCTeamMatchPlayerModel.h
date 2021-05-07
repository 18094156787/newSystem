//
//  JCTeamMatchPlayerModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/14.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCTeamMatchPlayerModel : JCWBaseBall

@property (nonatomic,strong) NSString *player_name;

@property (nonatomic,strong) NSString *player_logo;

@property (nonatomic,strong) NSString *team_logo;

@property (nonatomic,strong) NSString *rating;



#pragma mark//新版本接口

@property (nonatomic,strong) NSString *location_x;

@property (nonatomic,strong) NSString *location_y;

@property (nonatomic,strong) NSString *player_id;

@property (nonatomic,strong) NSString *position;

@property (nonatomic,strong) NSString *name_zh;

@property (nonatomic,strong) NSString *name_en;

@property (nonatomic,strong) NSString *short_name_zh;

@property (nonatomic,strong) NSString *logo;

@end

NS_ASSUME_NONNULL_END
