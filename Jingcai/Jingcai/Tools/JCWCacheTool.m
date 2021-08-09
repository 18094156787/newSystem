//
//  JCWCacheTool.m
//  CoinWay
//
//  Created by Rain on 2018/9/13.
//  Copyright © 2018年 rain. All rights reserved.
//

#import "JCWCacheTool.h"
#import "JCWConst.h"
#import <CoreSpotlight/CoreSpotlight.h>
#import <CoreServices/CoreServices.h>

@implementation JCWCacheTool
+ (void)cacheObject:(id)object forKey:(NSString *)key {
    NSData * data = [NSKeyedArchiver archivedDataWithRootObject:object];
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:key];
}
+ (id)objectForKey:(NSString *)key {
    NSData * data = [[NSUserDefaults standardUserDefaults] valueForKey:key];
    return [NSKeyedUnarchiver unarchiveObjectWithData:data];
}
+ (void)removeObjectForKey:(NSString *)key {
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
}
+ (void)clearCacheIfNeed {
    NSDictionary * infoDictionary = [[NSBundle mainBundle] infoDictionary];
    
    CGFloat oldVersion = [[self objectForKey:@"version"] floatValue];
    CGFloat oldBuild = [[self objectForKey:@"build"] floatValue];
    CGFloat currentVersion = [[infoDictionary objectForKey:@"CFBundleShortVersionString"] floatValue];
    CGFloat currentBuild = [[infoDictionary objectForKey:@"CFBundleVersion"] floatValue];
    
    NSLog(@"version 版本号对比：current == %lf, old == %lf", currentVersion, oldVersion);
    NSLog(@"build 版本号对比：current == %lf, old == %lf", currentBuild, oldBuild);
    
    // 版本号有变, 那么清理缓存
//    if ((currentVersion != oldVersion) || (currentBuild != oldBuild)) {
//        NSLog(@"本地版本号有变动");
//        [JCWCacheTool removeObjectForKey:CacheKeyMySubscribe];
//        [JCWCacheTool removeObjectForKey:CacheKeyNews];
//        NSLog(@"本地缓存已清理");
//
//        // 记录下此时版本号
//        [JCWCacheTool cacheObject:[NSString stringWithFormat:@"%lf", currentVersion] forKey:@"version"];
//        [JCWCacheTool cacheObject:[NSString stringWithFormat:@"%lf", currentBuild] forKey:@"build"];
//    }
}


+ (void)addSpotlightItemWithTjUserBall:(JCWTjUserBall *)tjUserBall {
    if (!tjUserBall) {
        return ;
    }
    NSString * itemId = [NSString stringWithFormat:@"tjuser_%@", NonNil(tjUserBall.id)];
    NSString * bundleId = @"com.jingcai.zc";
    
    //单个item
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        //先删除原来的item
        [[CSSearchableIndex defaultSearchableIndex] deleteSearchableItemsWithIdentifiers:@[itemId] completionHandler:^(NSError * _Nullable error) {
            //
        }];
        //1.创建条目的属性集合
        CSSearchableItemAttributeSet * attributeSet = [[CSSearchableItemAttributeSet alloc] initWithItemContentType:(NSString*) kUTTypeImage];
        
        //2.给属性集合添加属性
        attributeSet.title = NonNil(tjUserBall.user_name);
        attributeSet.contentDescription = NonNil(tjUserBall.desc);
        attributeSet.thumbnailURL = [NSURL URLWithString:tjUserBall.user_img];
        
        //3.属性集合与条目进行关联
        CSSearchableItem * searchableItem = [[CSSearchableItem alloc] initWithUniqueIdentifier:itemId domainIdentifier:bundleId attributeSet:attributeSet];
        
        //把该条目进行暂存
        [[CSSearchableIndex defaultSearchableIndex] indexSearchableItems:@[searchableItem] completionHandler:^(NSError * _Nullable error) {
            if (error) {
                NSLog(@"searchableItem缓存失败");
            }
        }];
    });
    
    //多个item
    //[searchableItems addObject:searchableItem];
    
    //        @try {
    //            NSArray * titleArr = @[NonNil(tjUserBall.user_name)];
    //            NSArray * descArr = @[NonNil(tjUserBall.desc)];
    //
    //            //创建SearchableItems的数组
    //            NSMutableArray * searchableItems = [NSMutableArray array];
    //
    //            for (int i = 0; i < titleArr.count; i ++) {
    //
    //                //1.创建条目的属性集合
    //                CSSearchableItemAttributeSet * attributeSet = [[CSSearchableItemAttributeSet alloc] initWithItemContentType:(NSString*) kUTTypeImage];
    //
    //                //2.给属性集合添加属性
    //                attributeSet.title = titleArr[i];
    //                attributeSet.contentDescription = descArr[i];
    //                attributeSet.thumbnailURL = [NSURL URLWithString:icon];
    //
    //                //3.属性集合与条目进行关联
    //                CSSearchableItem * searchableItem = [[CSSearchableItem alloc] initWithUniqueIdentifier:[NSString stringWithFormat:@"%d", i] domainIdentifier:@"com.jingcai.zc" attributeSet:attributeSet];
    //
    //                //把该条目进行暂存
    //                [searchableItems addObject:searchableItem];
    //            }
    //
    //            //4.吧条目数组与索引进行关联
    //            [[CSSearchableIndex defaultSearchableIndex] indexSearchableItems:searchableItems completionHandler:^(NSError * _Nullable error) {
    //                if (!error) {
    //                    NSLog(@"%s, %@", __FUNCTION__, [error localizedDescription]);
    //                }
    //            }];
    //        }
    //        @catch (NSException *exception) {
    //            NSLog(@"%s, %@", __FUNCTION__, exception);
    //        }
    //        @finally {
    //
    //        }
}
+ (void)addSpotlightItemWithDianPingBall:(JCDianPingBall *)dianPingBall {
    if (!dianPingBall) {
        return ;
    }
    NSString * itemId = [NSString stringWithFormat:@"tuijian_%@", NonNil(dianPingBall.id)];
    NSString * bundleId = @"com.jingcai.zc";
    
    //单个item
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        //先删除原来的item
        [[CSSearchableIndex defaultSearchableIndex] deleteSearchableItemsWithIdentifiers:@[itemId] completionHandler:^(NSError * _Nullable error) {
            //
        }];
        //1.创建条目的属性集合
        CSSearchableItemAttributeSet * attributeSet = [[CSSearchableItemAttributeSet alloc] initWithItemContentType:(NSString*) kUTTypeImage];
        
        //2.给属性集合添加属性
        attributeSet.title = NonNil(dianPingBall.user_name);
        attributeSet.contentDescription = NonNil(dianPingBall.title);
        attributeSet.thumbnailURL = [NSURL URLWithString:dianPingBall.user_img];
        attributeSet.contentURL = [NSURL URLWithString:@"https://www.baidu.com/"];
        
        //3.属性集合与条目进行关联
        CSSearchableItem * searchableItem = [[CSSearchableItem alloc] initWithUniqueIdentifier:itemId domainIdentifier:bundleId attributeSet:attributeSet];
        
        //把该条目进行暂存
        [[CSSearchableIndex defaultSearchableIndex] indexSearchableItems:@[searchableItem] completionHandler:^(NSError * _Nullable error) {
            if (error) {
                NSLog(@"searchableItem缓存失败");
            }
        }];
    });
}
+ (void)addSpotlightItemsWithTjDataArr:(NSArray *)tjDataArr {
    if (!tjDataArr || tjDataArr.count == 0) {
        return ;
    }
    NSString * bundleId = @"com.jingcai.zc";
    
    //单个item
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        
        NSMutableArray * searchableItems = [NSMutableArray array];
        for (JCDianPingBall * dianPingBall in tjDataArr) {
            NSString * itemId = [NSString stringWithFormat:@"tuijian_%@", NonNil(dianPingBall.id)];
            //先删除原来的item
            [[CSSearchableIndex defaultSearchableIndex] deleteSearchableItemsWithIdentifiers:@[itemId] completionHandler:^(NSError * _Nullable error) {
                //
            }];
            //1.创建条目的属性集合
            CSSearchableItemAttributeSet * attributeSet = [[CSSearchableItemAttributeSet alloc] initWithItemContentType:(NSString*) kUTTypeImage];
            
            //2.给属性集合添加属性
            attributeSet.title = NonNil(dianPingBall.user_name);
            attributeSet.contentDescription = NonNil(dianPingBall.title);
            attributeSet.thumbnailURL = [NSURL URLWithString:dianPingBall.user_img];
            
            //3.属性集合与条目进行关联
            CSSearchableItem * searchableItem = [[CSSearchableItem alloc] initWithUniqueIdentifier:itemId domainIdentifier:bundleId attributeSet:attributeSet];
            [searchableItems addObject:searchableItem];
        }
        
        //把该条目进行暂存
        [[CSSearchableIndex defaultSearchableIndex] indexSearchableItems:searchableItems completionHandler:^(NSError * _Nullable error) {
            if (error) {
                NSLog(@"searchableItems缓存失败");
            }
        }];
    });
    
}
@end
