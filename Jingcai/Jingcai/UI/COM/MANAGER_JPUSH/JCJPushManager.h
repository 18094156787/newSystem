//
//  JCJPushManager.h
//  Jingcai
//
//  Created by Administrator on 2019/2/21.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface JCJPushManager : NSObject
+ (instancetype)sharedManager;
- (void)setAliasShowHUD:(BOOL)show completion:(void(^)(BOOL succeed))completion;//设置别名
- (void)deleteAliasShowHUD:(BOOL)show completion:(void(^)(BOOL succeed))completion;//删除别名
@end
NS_ASSUME_NONNULL_END
