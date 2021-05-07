//
//  JCTeamDetailZhenRongModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/22.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCTeamDetailZhenRongModel : JCWBaseBall

@property (nonatomic,strong) NSString *avatar;

@property (nonatomic,strong) NSString *name;

@property (nonatomic,strong) NSString *number;

@property (nonatomic,strong) NSString *market_value;

#pragma mark//新版本接口

@property (nonatomic,strong) NSString *id;

@property (nonatomic,strong) NSString *player_id;

@property (nonatomic,strong) NSString *position;

@property (nonatomic,strong) NSString *shirt_number;

@property (nonatomic,strong) NSString *logo;

@property (nonatomic,strong) NSString *name_zh;

@property (nonatomic,strong) NSString *player_name_zh;

@property (nonatomic,strong) NSString *player_market_value;

@end

NS_ASSUME_NONNULL_END
