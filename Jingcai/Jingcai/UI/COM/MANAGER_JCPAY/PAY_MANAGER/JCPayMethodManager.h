//
//  JCPayMethodManager.h
//  Jingcai
//
//  Created by Administrator on 2018/12/26.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface JCPayMethodManager : NSObject
+ (BOOL)isApplePayAvailable;//支持ApplePay
+ (BOOL)isChinaUnionCardAdd;//是否添加了(中国)银联卡
@end
NS_ASSUME_NONNULL_END
