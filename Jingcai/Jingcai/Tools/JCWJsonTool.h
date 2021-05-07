//
//  JCWJsonTool.h
//  CoinWay
//
//  Created by Rain on 2018/7/11.
//  Copyright © 2018年 rain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JCWJsonTool : NSObject
+ (BOOL)isSuccessResponse:(id)json;
+ (BOOL)isSuccessSendSms:(id)json;
+ (BOOL)isNotLoginResponse:(id)json;
+ (BOOL)isNeedPay:(id)json;
+ (instancetype)entityWithJson:(id)json class:(Class)class;
+ (NSArray *)arrayWithJson:(id)json class:(Class)class;

@end
