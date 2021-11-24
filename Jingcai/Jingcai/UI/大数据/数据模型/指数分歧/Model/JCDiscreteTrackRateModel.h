//
//  JCDiscreteTrackRateModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/19.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCDiscreteTrackRateModel : JCWBaseBall

@property (nonatomic, strong) NSString *id;

@property (nonatomic, strong) NSString *time_name;

@property (nonatomic, strong) NSArray *odds_rate;

@property (nonatomic, strong) NSString * time_item;

@property (nonatomic, strong) NSString *type;

@end

NS_ASSUME_NONNULL_END
