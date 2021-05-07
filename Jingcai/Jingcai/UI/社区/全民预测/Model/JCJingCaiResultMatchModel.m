//
//  JCJingCaiResultMatchModel.m
//  Jingcai
//
//  Created by 陈继伟 on 2019/9/29.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCJingCaiResultMatchModel.h"

@implementation JCJingCaiResultMatchModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    // value使用[YYEatModel class]或YYEatModel.class或@"YYEatModel"没有区别
    return @{@"match" : [JCJingCaiResultInfoMatchModel class]};
}
@end

@implementation JCJingCaiResultInfoMatchModel


@end




