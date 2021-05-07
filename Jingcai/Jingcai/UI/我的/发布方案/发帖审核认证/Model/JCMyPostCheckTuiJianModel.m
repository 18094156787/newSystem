//
//  JCMyPostCheckTuiJianModel.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/15.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCMyPostCheckTuiJianModel.h"

@implementation JCMyPostCheckTuiJianModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    // value使用[YYEatModel class]或YYEatModel.class或@"YYEatModel"没有区别
    return @{@"matchData" : [JCPostPlanMathInfoModel class],@"match_data":[JCPostPlanMathInfoModel class],@"zucai_examine_tuijian_match":[JCPostPlanMathInfoModel class],@"zucai_tuijian_match":[JCPostPlanMathInfoModel class],@"img_info":[JCPostImageModel class]};
}

@end
