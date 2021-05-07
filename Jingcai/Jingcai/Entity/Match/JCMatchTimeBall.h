//
//  JCMatchTimeBall.h
//  Jingcai
//
//  Created by Administrator on 2019/5/16.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN
@interface JCMatchTimeBall : JCWBaseBall
@property (nonatomic, strong) NSString * xq;
@property (nonatomic, strong) NSString * rq;
@property (nonatomic, assign) BOOL hot;
@property (nonatomic, strong) NSString * time;

@property (nonatomic, assign) BOOL selected;
@end
NS_ASSUME_NONNULL_END
