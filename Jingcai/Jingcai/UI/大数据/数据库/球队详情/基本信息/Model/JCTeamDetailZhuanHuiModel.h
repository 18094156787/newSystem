//
//  JCTeamDetailZhuanHuiModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/23.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCTeamDetailZhuanHuiModel : JCWBaseBall

@property (nonatomic,strong) NSString *date;

@property (nonatomic,strong) NSString *type_desc;

@property (nonatomic,strong) NSString *team;

#pragma mark//新版本接口

@property (nonatomic,strong) NSString *player_name;

@property (nonatomic,strong) NSString *from_team_name;

@property (nonatomic,strong) NSString *player_logo;

@property (nonatomic,strong) NSString *transfer_time;

@property (nonatomic,strong) NSString *transfer_type;


@end

NS_ASSUME_NONNULL_END
