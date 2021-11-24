//
//  JCKellyDataDetailModel.m

//  Jingcai
//
//  Created by 陈继伟 on 2021/11/16.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCKellyDataDetailModel.h"

@implementation JCKellyDataDetailModel

// 声明自定义类参数类型
+ (NSDictionary *)modelContainerPropertyGenericClass {
    // value使用[YYEatModel class]或YYEatModel.class或@"YYEatModel"没有区别
    return @{@"odds_change_list" : [JCTransactionDataOddsChangeModel class],@"same_initial_compensation" : [JCHistoryPayDataModel class],@"data_contrast" : [JCTransactionDataContrastModel class],@"odds_list" : [JCTransactionDataOddsDetailModel class],@"discrete_sample_list" : [JCDiscreteTrackRateModel class],@"sample_data" : [JCKellyDataDetailSampleModel class]};
}

@end
