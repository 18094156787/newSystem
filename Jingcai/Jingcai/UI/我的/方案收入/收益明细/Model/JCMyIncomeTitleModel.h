//
//  JCMyIncomeTitleModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/7.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"
#import "JCMyIncomeModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCMyIncomeTitleModel : JCWBaseBall

@property (nonatomic,strong) NSString *time;

@property (nonatomic,strong) NSString *money;

@property (nonatomic,strong) NSArray <JCMyIncomeModel *>*the_detail;

@property (nonatomic,strong) NSString *the_time;

@property (nonatomic,strong) NSString *total_money;

@property (nonatomic,strong) NSString *get_pay_time;

@property (nonatomic,strong) NSMutableArray *array;


@end

NS_ASSUME_NONNULL_END
