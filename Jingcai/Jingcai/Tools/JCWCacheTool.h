//
//  JCWCacheTool.h
//  CoinWay
//
//  Created by Rain on 2018/9/13.
//  Copyright © 2018年 rain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JCWTjUserBall.h"
#import "JCDianPingBall.h"

@interface JCWCacheTool : NSObject
+ (void)cacheObject:(id)object forKey:(NSString *)key; //根据key缓存
+ (id)objectForKey:(NSString *)key; //根据key读取
+ (void)removeObjectForKey:(NSString *)key;
+ (void)clearCacheIfNeed; // 版本升级等需要清理本地缓存

//添加spotlight item项
//+ (void)addSpotlightItemWithTitle:(NSString *)title desc:(NSString *)desc icon:(NSString *)icon;
+ (void)addSpotlightItemWithTjUserBall:(JCWTjUserBall *)tjUserBall;
//+ (void)addSpotlightItemWithDianPingBall:(JCDianPingBall *)dianPingBall;
+ (void)addSpotlightItemsWithTjDataArr:(NSArray *)tjDataArr;
@end
