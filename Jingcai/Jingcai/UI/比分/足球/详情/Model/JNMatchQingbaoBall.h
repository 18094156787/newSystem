//
//  JNMatchQingbaoBall.h
//  Jingcai
//
//  Created by Administrator on 2019/6/21.
//  Copyright © 2019 jingcai. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN
@interface JNMatchQingbaoBall : JCWBaseBall
@property (strong, nonatomic) NSString * id;
@property (strong, nonatomic) NSString * match_id;
@property (strong, nonatomic) NSString * good;
@property (strong, nonatomic) NSString * bad;
@property (assign, nonatomic) NSInteger type;
@property (assign, nonatomic) NSInteger status;
@property (strong, nonatomic) NSDate * created_at;
@property (strong, nonatomic) NSDate * updated_at;

#pragma mark //新
@property (strong, nonatomic) NSString *level;

@property (strong, nonatomic) NSString *info;

@end
NS_ASSUME_NONNULL_END
