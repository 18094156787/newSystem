//
//  JCWPayInfoBall.h
//  Jingcai
//
//  Created by Administrator on 2019/3/1.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN
@interface JCWPayInfoBall : JCWBaseBall
//支付所需字段
@property (nonatomic, strong) NSString * id;
@property (nonatomic, strong) NSString * user_id;
@property (nonatomic, assign) NSInteger sf;
@property (nonatomic, strong) NSString * wl_desc;
@property (nonatomic, strong) NSString * hb;

#pragma mark - 扩展
@property (nonatomic, readonly, assign) BOOL canUserHB; //是否可以使用红包
@end
NS_ASSUME_NONNULL_END
