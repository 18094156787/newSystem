//
//  JCWActivityJoinBall.h
//  Jingcai
//
//  Created by Rain on 2018/11/18.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCWActivityJoinBall : JCWBaseBall
@property (strong, nonatomic) NSString * id;
@property (strong, nonatomic) NSString * user_id;
@property (strong, nonatomic) NSString * number;
@property (strong, nonatomic) NSString * result;
@property (strong, nonatomic) NSString * prize;
@property (strong, nonatomic) NSString * status;
@property (strong, nonatomic) NSString * type;
@property (strong, nonatomic) NSDate * created_at;
@property (strong, nonatomic) NSDate * updated_at;

#pragma mark - 扩展
@property (strong, readonly, nonatomic) NSArray * resultArr;
@end

NS_ASSUME_NONNULL_END
