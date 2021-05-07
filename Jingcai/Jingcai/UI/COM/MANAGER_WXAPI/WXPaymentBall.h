//
//  WXPaymentBall.h
//  Jingcai
//
//  Created by Rain on 2018/12/20.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface WXPaymentBall : NSObject
@property (strong, nonatomic) NSString * appid;
@property (strong, nonatomic) NSString * noncestr;
@property (strong, nonatomic) NSString * package;
@property (strong, nonatomic) NSString * partnerid;
@property (strong, nonatomic) NSString * prepayid;
@property (strong, nonatomic) NSString * sign;
@property (strong, nonatomic) NSString * timestamp;
@end

NS_ASSUME_NONNULL_END
