//
//  JCTeamDetailPlayerTimeModel.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/23.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCTeamDetailPlayerTimeModel.h"

@implementation JCTeamDetailPlayerTimeModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    // value使用[YYEatModel class]或YYEatModel.class或@"YYEatModel"没有区别
    return @{@"season" : [JCTeamDetailPlayerSeasonModel class],@"season_list":[JCTeamDetailPlayerSeasonModel class]};
}

@end
