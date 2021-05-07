//
//  JCWMatchOddsBall.h
//  Jingcai
//
//  Created by Rain on 2018/11/8.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCWMatchOddsBall : JCWBaseBall
@property (strong, nonatomic) NSString * win;
@property (strong, nonatomic) NSString * condition;
@property (strong, nonatomic) NSString * lose;
@property (strong, nonatomic) NSString * equal;
//{
//    win = "2.02",
//    condition = "半球",
//    lose = "1.82",
//},
@end

NS_ASSUME_NONNULL_END
