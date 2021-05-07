//
//  JCActivityDetailModel.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/4/20.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCActivityDetailModel.h"

@implementation JCActivityDetailModel


+ (NSDictionary *)modelContainerPropertyGenericClass {
    // value使用[YYEatModel class]或YYEatModel.class或@"YYEatModel"没有区别
    return @{@"goods_info" : [JCActivityGoodsModel class],@"activity_option" : [JCActivityOptionModel class]};
}

@end
