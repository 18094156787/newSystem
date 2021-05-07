//
//  JCBackRefreshManager.h
//  Jingcai
//
//  Created by Administrator on 2019/4/18.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface JCBackRefreshManager : NSObject
+ (void)needRefreshSubscribeStateWithTjUserId:(NSString *)tjUserId gz:(NSString *)gz fensi:(NSInteger)fensi;
//+ (void)needRefreshSubscribeState;
@end

//分类
@interface UIViewController (JCRefreshState)
- (void)refreshSubscribeStateWithTjUserId:(NSString *)tjUserId gz:(NSString *)gz fensi:(NSInteger)fensi;
//- (void)refreshSubscribeState;
@end
NS_ASSUME_NONNULL_END
