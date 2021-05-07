//
//  JCYuceSettingModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/29.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCYuceSettingModel : JCWBaseBall

@property (nonatomic,copy) NSString * num;//用户每天可预测次数

@property (nonatomic,copy) NSString * bonus;//每期默认奖金

@property (nonatomic,copy) NSString * radio_min;//单选赔率最小值

@property (nonatomic,copy) NSString * select_min;//双选赔率最小值

@property (nonatomic,copy) NSString * select_sum;//双选赔率之和最小

@property (nonatomic,copy) NSString * future_rule;//单场规则

@property (nonatomic,copy) NSString * talent_rule;//达人签约规则

@property (nonatomic,copy) NSString * sign_red;//签约最小连红次数

@end

NS_ASSUME_NONNULL_END
