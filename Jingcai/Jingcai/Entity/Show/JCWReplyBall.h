//
//  JCWReplyBall.h
//  Jingcai
//
//  Created by Rain on 2018/11/15.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCWReplyBall : JCWBaseBall
@property (strong, nonatomic) NSString * content;
@property (assign, nonatomic) NSInteger is_plus;
@property (strong, nonatomic) NSString * name;
@property (assign, nonatomic) NSInteger plus;

@property (assign, nonatomic) BOOL bool_is_plus;
@end

NS_ASSUME_NONNULL_END
