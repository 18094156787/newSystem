//
//  JCWTjInfoOddsBall.h
//  Jingcai
//
//  Created by Rain on 2018/11/7.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCWTjInfoOddsBall : JCWBaseBall
@property (strong, nonatomic) NSString * company_name;
@property (strong, nonatomic) NSString * match_num;
@property (assign, nonatomic) NSInteger status;
@property (strong, nonatomic) NSString * id;
@property (strong, nonatomic) NSString * company_id;
@property (strong, nonatomic) NSString * equal;
@property (strong, nonatomic) NSString * win;
@property (strong, nonatomic) NSDate * created_at;
@property (strong, nonatomic) NSString * lose;
@property (strong, nonatomic) NSDate * updated_at;
@property (assign, nonatomic) NSString * rq;

#pragma mark - 扩展
@end

NS_ASSUME_NONNULL_END
