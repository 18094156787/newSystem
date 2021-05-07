//
//  JNMatchSPFBall.h
//  Jingcai
//
//  Created by Administrator on 2019/7/2.
//  Copyright © 2019 jingcai. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN
@interface JNMatchSPFBall : JCWBaseBall
@property (nonatomic, strong) NSString * rq;//让球数
@property (nonatomic, strong) NSString * win;
@property (nonatomic, strong) NSString * lose;
@property (nonatomic, strong) NSString * equal;
//@property (nonatomic, strong) NSString * created_at;

#pragma mark
@property (nonatomic, strong) NSString * goal;//让球
@property (nonatomic, strong) NSString * sf0;//客胜
@property (nonatomic, strong) NSString * sf1;//平局
@property (nonatomic, strong) NSString * sf3;//主胜
@property (nonatomic, strong) NSString * created_at;
@property (nonatomic, strong) NSString *created_desc;

@end
NS_ASSUME_NONNULL_END
