//
//  JCAlertManager.h
//  Jingcai
//
//  Created by Administrator on 2019/2/14.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface JCAlertManager : NSObject
+ (instancetype)sharedManager;
//是否关注的弹窗
- (void)showSubscribeAlertWithAdd:(BOOL)add confirmBlock:(void (^)(void))confirmBlock;
@end
NS_ASSUME_NONNULL_END
