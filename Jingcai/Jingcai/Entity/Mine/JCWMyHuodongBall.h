//
//  JCWMyHuodongBall.h
//  Jingcai
//
//  Created by Rain on 2018/11/13.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCWMyHuodongBall : JCWBaseBall <NSCoding>
@property (strong, nonatomic) NSString * result;
@property (strong, nonatomic) NSString * number;
@property (strong, nonatomic) NSString * wresult;
@property (strong, nonatomic) NSString * prize;
@end

NS_ASSUME_NONNULL_END
