//
//  JCTransactionDataContrastModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/19.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCTransactionDataContrastModel : JCWBaseBall

@property (nonatomic,strong) NSString *title;

@property (nonatomic,strong) NSString *matches;//场数

@property (nonatomic,strong) NSString *home_value;//主队值

@property (nonatomic,strong) NSString *away_value;//客队值

@property (nonatomic,strong) NSString *home_average_value;//主队平均值

@property (nonatomic,strong) NSString *away_average_value;//客队平均值

@end

NS_ASSUME_NONNULL_END
