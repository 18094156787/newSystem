//
//  JCColumnDetailModel.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/10/21.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCColumnDetailModel.h"

@implementation JCColumnDetailModel

// 声明自定义类参数类型
+ (NSDictionary *)modelContainerPropertyGenericClass {
    // value使用[YYEatModel class]或YYEatModel.class或@"YYEatModel"没有区别
    return @{@"last_hit_rate" : [JCColumnHitRateModel class]};
}
@end
