//
//  RBApplePayManager.h
//  Jingcai
//
//  Created by Administrator on 2018/12/29.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^JCApplePaySuccessBlock)(void);
typedef void (^JCApplePayFailureBlock)(void);
typedef void (^JCApplePayCancelBlock)(void);

NS_ASSUME_NONNULL_BEGIN
@interface RBApplePayManager : NSObject
+ (instancetype)shareManager;
@property (copy, nonatomic) JCApplePaySuccessBlock jcApplePaySuccessBlock;
@property (copy, nonatomic) JCApplePayFailureBlock jcApplePayFailureBlock;
@property (copy, nonatomic) JCApplePayCancelBlock jcApplePayCancelBlock;
// 开始支付
- (void)payWithTN:(NSString *)tn merchantId:(NSString *)merchantId;
@end
NS_ASSUME_NONNULL_END
