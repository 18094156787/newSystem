//
//  JNMatchBattleItemCell.h
//  Jingcai
//
//  Created by Administrator on 2019/6/19.
//  Copyright © 2019 jingcai. All rights reserved.
//

#import "JCBaseTableViewCell.h"
#import "JNMatchLineupBall.h"

NS_ASSUME_NONNULL_BEGIN
@interface JNMatchBattleItemCell : JCBaseTableViewCell
@property (nonatomic, strong) JNMatchLineupBall * lineupBall;
@property (nonatomic, assign) BOOL isHomeTeam;
@end
NS_ASSUME_NONNULL_END
