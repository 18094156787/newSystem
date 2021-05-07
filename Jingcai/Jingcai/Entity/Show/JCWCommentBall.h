//
//  JCWCommentBall.h
//  Jingcai
//
//  Created by Rain on 2018/11/12.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"
#import "JCWReplyBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCWCommentBall : JCWBaseBall
@property (strong, nonatomic) NSString * avatar;
@property (strong, nonatomic) NSString * content;
@property (strong, nonatomic) NSString * time;
@property (strong, nonatomic) NSString * id;
@property (strong, nonatomic) NSString * p_id;
@property (strong, nonatomic) NSString * is_plus;
@property (strong, nonatomic) JCWReplyBall * p_content;
@property (strong, nonatomic) NSString * user_id;
@property (assign, nonatomic) NSInteger plus;
@property (strong, nonatomic) NSString * name;

@property (assign, nonatomic) BOOL bool_is_plus;
@property (strong, nonatomic) NSString * check_avatar;
@end

NS_ASSUME_NONNULL_END
