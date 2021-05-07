//
//  JNMatchSXPBall.h
//  Jingcai
//
//  Created by Administrator on 2019/7/4.
//  Copyright © 2019 jingcai. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN
@interface JNMatchSXPBall : JCWBaseBall
@property (nonatomic, strong) NSString * id;
@property (nonatomic, strong) NSString * match_num;
@property (nonatomic, strong) NSString * sd;
@property (nonatomic, strong) NSString * ss;
@property (nonatomic, strong) NSString * xd;
@property (nonatomic, strong) NSString * xs;
@property (nonatomic, assign) NSInteger type;
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, strong) NSString *created_at;
@property (nonatomic, strong) NSString *updated_at;

#pragma mark //新接口
@property (nonatomic, strong) NSString * sx11;//上单
@property (nonatomic, strong) NSString * sx10;//上双
@property (nonatomic, strong) NSString * sx01;//下单
@property (nonatomic, strong) NSString * sx00;//下双
@property (nonatomic, strong) NSString * created_desc;
@end
NS_ASSUME_NONNULL_END
