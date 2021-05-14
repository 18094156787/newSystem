//
//  JCWInterfaceTool.h
//  Jingcai
//
//  Created by Rain on 2018/11/2.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JCWInterfaceTool : NSObject
+ (NSString *)imageUrl; //图片通用地址
+ (NSString *)serviceUrl; //数据接口通用地址
+ (NSString *)serviceUrlWithRoute:(NSString *)route; //指定数据接口地址
+ (NSString *)serviceUrlWithRoute_V2:(NSString *)route;
+ (NSString *)serviceUrlWithJingCaiRoute:(NSString *)route;//预测相关接口,第一版本
+ (NSString *)serviceUrlWithJingCaiRoute_V2:(NSString *)route;//预测相关接口,第二版本
+ (NSString *)serviceUrlWithCommunityRoute:(NSString *)route;//社区相关
+ (NSString *)serviceUrlWithJingcaiCommunityRoute:(NSString *)route;
+ (NSString *)serviceUrlWithRoutes:(NSString *)route;
+ (NSString *)serviceUrlWithJingCaiNewRoute:(NSString *)route;
+ (NSString *)appVersion;//获取当前APP版本号
+ (NSString *)appName;//获取当前APP名称
+ (NSString *)appBuildVersion;//获取当前的构建版本号
@end

NS_ASSUME_NONNULL_END
