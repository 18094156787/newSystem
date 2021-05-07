//
//  JCMyIncomeModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/7.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCMyIncomeModel : JCWBaseBall

@property (nonatomic,strong) NSString *time;

@property (nonatomic,strong) NSString *total;//单笔金额

@property (nonatomic,strong) NSString *title;

@property (nonatomic,strong) NSString *money;//当天总金额

@property (nonatomic,strong) NSString *content;

#pragma mark//新版本接口

@property (nonatomic,strong) NSString *get_pay_time;

@property (nonatomic,strong) NSString *commission;

@property (nonatomic,strong) NSString *paid;//小于3才有订单详情

@property (nonatomic,strong) NSString *id;//订单id



@end

NS_ASSUME_NONNULL_END
