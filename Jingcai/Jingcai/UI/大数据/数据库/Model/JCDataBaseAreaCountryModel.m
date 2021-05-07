//
//  JCDataBaseAreaCountryModel.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/9.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCDataBaseAreaCountryModel.h"

@implementation JCDataBaseAreaCountryModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    // value使用[YYEatModel class]或YYEatModel.class或@"YYEatModel"没有区别
    return @{@"event" : [JCDataBaseMatchModel class],@"competition_info":[JCDataBaseMatchModel class]};
}

@end
