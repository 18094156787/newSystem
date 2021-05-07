//
//  JCMatchSelectModel.m
//  FootBallScore
//
//  Created by 陈继伟 on 2020/3/6.
//  Copyright © 2020 --. All rights reserved.
//

#import "JCMatchSelectModel.h"

@implementation JCMatchSelectModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    // value使用[YYEatModel class]或YYEatModel.class或@"YYEatModel"没有区别
    return @{@"event" : [JCMatchFilterModel class],@"list" : [JCMatchFilterModel class]};
}
@end
