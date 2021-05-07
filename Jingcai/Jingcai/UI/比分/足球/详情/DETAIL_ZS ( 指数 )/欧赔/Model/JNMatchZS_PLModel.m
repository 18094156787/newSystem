//
//  JNMatchZS_PLModel.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/14.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JNMatchZS_PLModel.h"

@implementation JNMatchZS_PLModel

// 声明自定义类参数类型
+ (NSDictionary *)modelContainerPropertyGenericClass {
    // value使用[YYEatModel class]或YYEatModel.class或@"YYEatModel"没有区别
    return @{@"info" : [JNMatchZS_PLInfoModel class],@"detail":[JNMatchZS_PLInfoModel class]};
}

@end
