//
//  JCWNetworkTool.h
//  CoinWay
//
//  Created by Rain on 2018/7/17.
//  Copyright © 2018年 rain. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, NetworkState) {
    NetworkStateNormal, //正常网络
    NetworkStateNoNetwork //无网络
};

typedef void(^NetworkChangeBlock)(NetworkState state);

@interface JCWNetworkTool : NSObject

@property (copy, nonatomic) NetworkChangeBlock networkChangeBlock;

+ (instancetype)sharedInstance;
+ (BOOL)isNetworkAvailable;
- (void)startMonitoring;
- (void)stopMonitoring;

@end
