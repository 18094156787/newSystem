//
//  JCTransactionDataOddsChangeModel.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/19.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCTransactionDataOddsChangeModel.h"

@implementation JCTransactionDataOddsChangeModel

// 声明自定义类参数类型
+ (NSDictionary *)modelContainerPropertyGenericClass {
    // value使用[YYEatModel class]或YYEatModel.class或@"YYEatModel"没有区别
    return @{@"compare_odds_change_data" : [JCTransactionDataChangeFlagModel class]};
}

@end
