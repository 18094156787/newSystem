//
//  JCKindSignReturnModel.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/6/2.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCKindSignReturnModel.h"

@implementation JCKindSignReturnModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    // value使用[YYEatModel class]或YYEatModel.class或@"YYEatModel"没有区别
    return @{@"stage_grade" : [JCActivityGoodsModel class]};
}
@end
