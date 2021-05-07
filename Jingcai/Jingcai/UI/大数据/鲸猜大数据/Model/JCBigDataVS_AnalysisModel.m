//
//  JCBigDataVS_AnalysisModel.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/10/12.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBigDataVS_AnalysisModel.h"

@implementation JCBigDataVS_AnalysisModel
// 声明自定义类参数类型
+ (NSDictionary *)modelContainerPropertyGenericClass {
    // value使用[YYEatModel class]或YYEatModel.class或@"YYEatModel"没有区别
    return @{@"match" : [JCBigDataAnalysisMatchModel class]};
}
@end
