//
//  JCWActivityBall.h
//  Jingcai
//
//  Created by Rain on 2018/11/12.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"
#import "JCWActivityMatchBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCWActivityBall : JCWBaseBall
@property (strong, nonatomic) NSString * number;
@property (strong, nonatomic) NSString * count_down;
@property (strong, nonatomic) NSString * joinnum;
@property (strong, nonatomic) NSString * join;
@property (strong, nonatomic) NSString * title;
@property (strong, nonatomic) NSString * image;
@property (strong, nonatomic) NSArray <JCWActivityMatchBall *> * match;
@property (strong, nonatomic) NSString * user_id;
@property (strong, nonatomic) NSString * type;
@property (strong, nonatomic) NSString * isLogin;
@property (strong, nonatomic) NSArray * tuijian_user_id;

#pragma mark - 扩展
@property (assign, readonly, nonatomic) BOOL isEnd;
@end

NS_ASSUME_NONNULL_END
