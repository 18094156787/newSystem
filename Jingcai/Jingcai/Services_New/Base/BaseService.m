//
//  BaseService.m
//  Jingcai
//
//  Created by Rain on 2018/11/2.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "BaseService.h"

@implementation BaseService
+ (instancetype)service {
    
    return [[[self class] alloc] init];
}
- (NSString *)sv {
    if (!_sv) {
        _sv = [JCWInterfaceTool appVersion];
    }
    return _sv;
}
- (NSString *)dev {
    if (!_dev) {
        _dev = @"1";
    }
    return _dev;
}
- (void)dealWithError:(NSError *)error {
//    NSLog(@"11=%@",error.domain);
    NSLog(@"2222=%@",error.userInfo);
    NSDictionary *erroInfo = error.userInfo;

                        NSData *data = [erroInfo valueForKey:@"com.alamofire.serialization.response.error.data"];

                        NSString *errorString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];

                        NSLog(@"%@", errorString);
    
//    NSDictionary * errorInfo = error.userInfo;
//     if ([[errorInfo allKeys] containsObject: @"com.alamofire.serialization.response.error.data"]){
//        NSData * errorData = errorInfo[@"com.alamofire.serialization.response.error.data"];
//         NSDictionary * errorDict =  [NSJSONSerialization JSONObjectWithData: errorData options:NSJSONReadingAllowFragments error:nil];
////        NSNumber * errorCodeNum = errorDict[@"err_code"];
////         NSLog(@"=====%@====", errorCodeNum);
//    }

    
    
    if(!error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey]){
        return;
    }
    NSData *errorData = error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey];
    NSDictionary *serializedData = [NSJSONSerialization JSONObjectWithData: errorData options:kNilOptions error:nil];
    NSLog(@"error--%@",serializedData);

    return;
    
    
    id errorResponse =    [NSJSONSerialization JSONObjectWithData:error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey] options:NSJSONReadingAllowFragments error:nil];
    if ([errorResponse isKindOfClass:[NSDictionary class]]) {
        if (![JCWJsonTool isSuccessResponse:errorResponse]) {
            [JCWToastTool showHint:errorResponse[@"msg"]];

        }
    }

//    NSLog(@"错误消息为:%@",errorResponse);
}

- (void)deathWithSuccessInfo:(id)object {
    if([JCWJsonTool isNotLoginResponse:object]){
        [[NSNotificationCenter defaultCenter] postNotificationName:NotificationNameUserNotLogin object:nil];

      
   }
}
@end
