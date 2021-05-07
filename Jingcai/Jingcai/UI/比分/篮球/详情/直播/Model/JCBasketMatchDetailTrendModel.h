//
//  JCBasketMatchDetailTrendModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/7.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCBasketMatchDetailTrendModel : JCWBaseBall

@property (nonatomic,strong) NSString *trend_count;//节数

@property (nonatomic,strong) NSString *trend_per;//每节分钟数

@property (nonatomic,strong) NSArray *trend;

@end

NS_ASSUME_NONNULL_END
