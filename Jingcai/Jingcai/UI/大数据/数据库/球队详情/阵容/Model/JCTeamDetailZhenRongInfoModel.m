//
//  JCTeamDetailZhenRongInfoModel.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/22.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCTeamDetailZhenRongInfoModel.h"

@implementation JCTeamDetailZhenRongInfoModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    // value使用[YYEatModel class]或YYEatModel.class或@"YYEatModel"没有区别
    return @{@"list" : [JCTeamDetailZhenRongModel class]};
}

@end
