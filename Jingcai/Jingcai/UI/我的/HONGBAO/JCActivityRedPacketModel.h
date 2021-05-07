//
//  JCActivityRedPacketModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2019/9/27.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCActivityRedPacketModel : JCWBaseBall

@property (nonatomic,copy) NSString *count;

@property (nonatomic,copy) NSString *name;

@property (nonatomic,copy) NSString *scope;

@property (nonatomic,copy) NSString *total;

@property (nonatomic,copy) NSString *start_time;

@property (nonatomic,copy) NSString *end_time;

@property (nonatomic,copy) NSString *time;
#pragma mark 扩展

@property (nonatomic,copy) NSString *number;

@end

NS_ASSUME_NONNULL_END
