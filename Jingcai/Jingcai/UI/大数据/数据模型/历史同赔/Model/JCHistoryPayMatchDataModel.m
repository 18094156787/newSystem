//
//  JCHistoryPayMatchDataModel.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/18.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCHistoryPayMatchDataModel.h"

@implementation JCHistoryPayMatchDataModel

// 声明自定义类参数类型
+ (NSDictionary *)modelContainerPropertyGenericClass {
    // value使用[YYEatModel class]或YYEatModel.class或@"YYEatModel"没有区别
    return @{@"begin_similar_match" : [JCTipMatchInfoModel class],@"last_similar_match" : [JCTipMatchInfoModel class]};
}

@end
