//
//  JCEventScorePlayerModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/10.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCEventScorePlayerModel : JCWBaseBall


@property (nonatomic,strong) NSString *team_name;

//@property (nonatomic,strong) NSString *team_id;

@property (nonatomic,strong) NSString *count;

@property (nonatomic,strong) NSString *player_name;

@property (nonatomic,strong) NSString *player_logo;

#pragma mark //新版本接口

@property (nonatomic,strong) NSString *id;

@property (nonatomic,strong) NSString *team_id;

@property (nonatomic,strong) NSString *name_zh;

@property (nonatomic,strong) NSString *team_name_zh;

@property (nonatomic,strong) NSString *team_logo;

@property (nonatomic,strong) NSString *logo;

@property (nonatomic,strong) NSString *num;

@end

NS_ASSUME_NONNULL_END
