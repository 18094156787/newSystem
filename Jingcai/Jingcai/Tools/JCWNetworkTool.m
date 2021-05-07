//
//  JCWNetworkTool.m
//  CoinWay
//
//  Created by Rain on 2018/7/17.
//  Copyright © 2018年 rain. All rights reserved.
//

#import "JCWNetworkTool.h"
#import "Reachability.h"

static JCWNetworkTool *instance;

@implementation JCWNetworkTool

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (instance == nil) {
            instance = [super allocWithZone:zone];
        }
    });
    return instance;
}

+ (instancetype)sharedInstance {
    return [[self alloc] init];
}

- (void)startMonitoring {
    [[Reachability reachabilityForInternetConnection] startNotifier];
}

- (void)stopMonitoring {
    [[Reachability reachabilityForInternetConnection] stopNotifier];
}

+ (BOOL)isNetworkAvailable {
    return [Reachability reachabilityForInternetConnection].currentReachabilityStatus != NotReachable;
}

@end
