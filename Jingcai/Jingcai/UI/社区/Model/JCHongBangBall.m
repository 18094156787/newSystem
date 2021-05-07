//
//  JCHongBangBall.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/19.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCHongBangBall.h"

@implementation JCHongBangBall

// 声明自定义类参数类型
+ (NSDictionary *)modelContainerPropertyGenericClass {
    // value使用[YYEatModel class]或YYEatModel.class或@"YYEatModel"没有区别
    return @{@"zucai_tuijian_match" : [JCHongBangMatchModel class]};
}

@end
