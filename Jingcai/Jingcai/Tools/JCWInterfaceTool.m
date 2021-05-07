//
//  JCWInterfaceTool.m
//  Jingcai
//
//  Created by Rain on 2018/11/2.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "JCWInterfaceTool.h"
#import "JCWConst.h"

@implementation JCWInterfaceTool
+ (NSString *)imageUrl {
    return JCApiUrl;
}
+ (NSString *)serviceUrl {
    return [NSString stringWithFormat:@"%@v1/zucai/",[self appEnvironmentUrl]];
}
+ (NSString *)serviceUrl_V2 {
    return [NSString stringWithFormat:@"%@v2/zucai/",[self appEnvironmentUrl]];
}
+ (NSString *)serviceUrls {
    return [NSString stringWithFormat:@"%@v1/zucai",[self appEnvironmentUrl]];
}

+ (NSString *)serviceJingCaiUrl {
    return [NSString stringWithFormat:@"%@v1/guess/",[self appEnvironmentUrl]];
}

+ (NSString *)serviceJingCaiNewUrl {
    return [NSString stringWithFormat:@"%@v1/jingcai/",[self appEnvironmentUrl]];
}

+ (NSString *)serviceJingCaiUrl_V2 {
    return [NSString stringWithFormat:@"%@v2/guess/",[self appEnvironmentUrl]];
}

+ (NSString *)serviceCommunity {
    return [NSString stringWithFormat:@"%@v1/community/",[self appEnvironmentUrl]];
}

+ (NSString *)serviceJingcaiCommunity {
    return [NSString stringWithFormat:@"%@v1/jingcai/community/",[self appEnvironmentUrl]];
}



+ (NSString *)serviceUrlWithRoute:(NSString *)route {
    return [NSString stringWithFormat:@"%@%@?sv=%@&dev=1&app_name=zszq&channel_dev=0", [self serviceUrl], route,[JCWInterfaceTool appVersion]];
}

+ (NSString *)serviceUrlWithRoute_V2:(NSString *)route {
    return [NSString stringWithFormat:@"%@%@?sv=%@&dev=1&app_name=zszq&channel_dev=0", [self serviceUrl_V2], route,[JCWInterfaceTool appVersion]];
}

+ (NSString *)serviceUrlWithRoutes:(NSString *)route {
    return [NSString stringWithFormat:@"%@%@?sv=%@&dev=1&app_name=zszq&channel_dev=0", [self serviceUrls], route,[JCWInterfaceTool appVersion]];
}

+ (NSString *)serviceUrlWithJingCaiRoute:(NSString *)route {
    return [NSString stringWithFormat:@"%@%@?sv=%@&dev=1&app_name=zszq&channel_dev=0", [self serviceJingCaiUrl], route,[JCWInterfaceTool appVersion]];
}

+ (NSString *)serviceUrlWithJingCaiNewRoute:(NSString *)route {
    return [NSString stringWithFormat:@"%@%@?sv=%@&dev=1&app_name=zszq&channel_dev=0", [self serviceJingCaiNewUrl], route,[JCWInterfaceTool appVersion]];
}

+ (NSString *)serviceUrlWithJingCaiRoute_V2:(NSString *)route {
    return [NSString stringWithFormat:@"%@%@?sv=%@&dev=1&app_name=zszq&channel_dev=0", [self serviceJingCaiUrl_V2], route,[JCWInterfaceTool appVersion]];
}

+ (NSString *)serviceUrlWithCommunityRoute:(NSString *)route {
    return [NSString stringWithFormat:@"%@%@?sv=%@&dev=1&app_name=zszq&channel_dev=0", [self serviceCommunity], route,[JCWInterfaceTool appVersion]];
}
+ (NSString *)serviceUrlWithJingcaiCommunityRoute:(NSString *)route {
    return [NSString stringWithFormat:@"%@%@?sv=%@&dev=1&app_name=zszq&channel_dev=0", [self serviceJingcaiCommunity], route,[JCWInterfaceTool appVersion]];
}

+ (NSString *)serviceUrlWithDataBaseRoute_V2:(NSString *)route {
    return [NSString stringWithFormat:@"%@%@?sv=%@&dev=1&app_name=zszq&channel_dev=0", [NSString stringWithFormat:@"%@v2/zucai/",JCApiUrlOneLine], route,[JCWInterfaceTool appVersion]];
}

+ (NSString *)appVersion {
    NSDictionary * infoDictionary = [[NSBundle mainBundle] infoDictionary];
    return [infoDictionary objectForKey:@"CFBundleShortVersionString"];
//    return [infoDictionary objectForKey:@"CFBundleVersion"];
}

+ (NSString *)appBuildVersion {
    NSDictionary * infoDictionary = [[NSBundle mainBundle] infoDictionary];
    return [infoDictionary objectForKey:@"CFBundleVersion"];
}

+ (NSString *)appName {
    NSDictionary * infoDictionary = [[NSBundle mainBundle] infoDictionary];
    return [infoDictionary objectForKey:@"CFBundleDisplayName"];
}

+ (NSString *)appEnvironmentUrl {
    if ([[[NSUserDefaults standardUserDefaults] objectForKey:JCEnvironmentUrl] isEqualToString:@"0"]) {
        return JCTestApiUrl;
    }
    return JCApiUrl;
}


@end
