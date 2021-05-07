//
//  JCMyPostCheckTuiJianDetailModel.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/15.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCMyPostCheckTuiJianDetailModel.h"

@implementation JCMyPostCheckTuiJianDetailModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    // value使用[YYEatModel class]或YYEatModel.class或@"YYEatModel"没有区别
    return @{@"image" : [JCPostImageModel class]};
}

@end
