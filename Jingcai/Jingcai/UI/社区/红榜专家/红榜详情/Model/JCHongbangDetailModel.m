//
//  JCHongbangDetailModel.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/2/2.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCHongbangDetailModel.h"

@implementation JCHongbangDetailModel

// 声明自定义类参数类型
+ (NSDictionary *)modelContainerPropertyGenericClass {
    // value使用[YYEatModel class]或YYEatModel.class或@"YYEatModel"没有区别
    return @{@"match_info" : [JCHongbangDetail_MatchModel class],@"tuijian_pay":[JCWExpertBall class]};
}

@end
