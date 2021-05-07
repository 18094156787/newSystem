//
//  JCMatchTeamBall.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/19.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCMatchTeamBall : JCWBaseBall

@property (nonatomic,copy) NSString *id;

@property (nonatomic,copy) NSString *name_zh;

@property (nonatomic,copy) NSString *name_en;

@property (nonatomic,copy) NSString *short_name_zh;

@property (nonatomic,copy) NSString *logo;

@property (nonatomic,copy) NSString *team_id;

@end

NS_ASSUME_NONNULL_END
