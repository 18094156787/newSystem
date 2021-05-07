//
//  JCPostPlanMathInfoModel.m
//  Jingcai
//
//  Created by 陈继伟 on 2019/12/31.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCPostPlanMathInfoModel.h"

@implementation JCPostPlanMathInfoModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    // value使用[YYEatModel class]或YYEatModel.class或@"YYEatModel"没有区别
    return @{@"match" : [JCWMatchBall class]};
}


@end


@implementation JCPostPlanMathInfoYllModel

@end


@implementation JCPostPlanMathInfoRqYllModel

@end

@implementation JCPostPlanMathInfoOtherModel

@end


