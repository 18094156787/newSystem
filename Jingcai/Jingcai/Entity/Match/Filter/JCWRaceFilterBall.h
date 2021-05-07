//
//  JCWRaceFilterBall.h
//  Jingcai
//
//  Created by Administrator on 2019/2/12.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN
@interface JCWRaceFilterBall : JCWBaseBall
@property (nonatomic, strong) NSString * leagueId;
@property (nonatomic, strong) NSString * league_name;
@property (nonatomic, assign) BOOL isSelected;
@end
NS_ASSUME_NONNULL_END
