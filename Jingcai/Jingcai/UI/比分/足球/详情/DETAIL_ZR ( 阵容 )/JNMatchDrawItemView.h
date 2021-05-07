//
//  JNMatchDrawItemView.h
//  Jingcai
//
//  Created by Administrator on 2019/6/20.
//  Copyright © 2019 jingcai. All rights reserved.
//

#import "JCBaseView.h"
#import "JNMatchLineupBall.h"

NS_ASSUME_NONNULL_BEGIN
@interface JNMatchDrawItemView : JCBaseView
@property (strong, nonatomic) JNMatchLineupBall * lineupBall;
@property (assign, nonatomic) BOOL isHomeTeam;
@end
NS_ASSUME_NONNULL_END
