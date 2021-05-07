//
//  JCMyBuyOrderDataModel.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/28.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCMyBuyOrderDataModel.h"

@implementation JCMyBuyOrderDataModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    // value使用[YYEatModel class]或YYEatModel.class或@"YYEatModel"没有区别
    return @{@"match_data" : [JCDianPingMatchBall class]};
}

@end
