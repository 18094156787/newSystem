//
//  JCWInterfaceTool_New.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/12/24.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCWInterfaceTool_New.h"
#import <CommonCrypto/CommonDigest.h>
@implementation JCWInterfaceTool_New

+ (NSString *)imageUrl {
    return JCApiUrl;
}
+ (NSString *)serviceUrl {
    return [NSString stringWithFormat:@"%@",[self appEnvironmentUrl]];
}

+ (NSString *)serviceUrlWithRoute:(NSString *)route {
//    return [NSString stringWithFormat:@"%@%@?sv=%@&dev=1&app_name=zszq&channel_dev=0", [self serviceUrl], route,[JCWInterfaceTool appVersion]];
    return [NSString stringWithFormat:@"%@%@", [self serviceUrl], route];
}

+ (NSString *)serviceUrlWithRoute:(NSString *)route paramDic:(NSDictionary *)param ignoreArray:(NSArray *)ignoreArray {
    NSLog(@"route=%@",route);
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:param];
    NSString *token = @"";
    if ([JCWUserBall currentUser].token.length>0) {
        token = [JCWUserBall currentUser].token;
    }
    [dic setObject:token forKey:@"token"];
    NSMutableArray *remoArray = [NSMutableArray array];
    [dic enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
//        if ([obj isKindOfClass:[NSNumber class]]) {
//            [remoArray addObject:key];
//        }
        if ([obj isKindOfClass:[NSString class]]&&[obj isEqualToString:@"sign"]) {
            [remoArray addObject:key];
        }
        if ([obj isKindOfClass:[NSString class]]&&[obj hasPrefix:@"@"]) {
            [remoArray addObject:key];
        }
        if ([obj isKindOfClass:[NSArray class]]) {
            [remoArray addObject:key];
        }
    }];
    
    for (NSString *key in ignoreArray) {
        [dic removeObjectForKey:key];
    }
    for (NSString *key in remoArray) {
        if([dic.allKeys containsObject:key]){
            [dic removeObjectForKey:key];
        }
        
        
    }
    
    NSString *finialValue = [JCWInterfaceTool_New sortArrWithDictionary:dic];
    
    NSString *base = @"/";
    if (route.length>0) {
        base = route;
    }
//    if ([JCWUserBall currentUser].token.length>0) {
//        base = [NSString stringWithFormat:@"%@%@",base,[JCWUserBall currentUser].token];
//    }
    base = [NSString stringWithFormat:@"%@%@",base,finialValue];
    NSString *md5_Sign = [JCWInterfaceTool_New md5WithStr:base];
    //时间戳
    NSDate *datenow = [NSDate date];//现在时间,你可以输出来看下是什么格式

    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[datenow timeIntervalSince1970]];
    
    NSString *url = [NSString stringWithFormat:@"%@%@?sign=%@&timestamp=%@", [self serviceUrl], route,md5_Sign,timeSp];
    NSString *client_sign =@"";
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"app_sign"]) {
        client_sign = [[NSUserDefaults standardUserDefaults] objectForKey:@"app_sign"];
    }
    //cid 渠道号 rid审核标记
    url = [NSString stringWithFormat:@"%@%@?sign=%@&timestamp=%@&token=%@&dev=1&sv=%@&cid=0&rid=1&client_sign=%@", [self serviceUrl], route,md5_Sign,timeSp,token,[JCWInterfaceTool appVersion],client_sign];
    
//    [[NSUserDefaults standardUserDefaults] objectForKey:@"app_sign"];
//    if ([JCWUserBall currentUser].token.length>0) {
//
//    }

    return url;
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
        return JCTestApiUrl_New;
    }
    return JCTestApiUrl_New;
}

+ (NSString *)md5WithStr:(NSString *)str
{
    const char *cStr = [str UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
    return [NSString stringWithFormat:
            @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

+ (NSString *)sortArrWithDictionary:(NSDictionary *)dictionary {
    // 取出所有的key值
    NSArray *keys = [dictionary allKeys];
    //按字母顺序排序
    NSArray *sortedArray = [keys sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        return [obj1 compare:obj2 options:NSNumericSearch];
    }];
    // 将排好的序的key值重新赋值
    NSMutableArray *jsonArr = [NSMutableArray array];
    [sortedArray enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        // 取出每一个keyValue值
        NSString *str = [NSString stringWithFormat:@"%@%@", obj, dictionary[obj]];
        [jsonArr addObject:str];
    }];
    // 将做好排序的数组转出字符串
    NSString *result = [jsonArr componentsJoinedByString:@""];
    result = [NSString stringWithFormat:@"%@", result];
    return result;
}

@end
