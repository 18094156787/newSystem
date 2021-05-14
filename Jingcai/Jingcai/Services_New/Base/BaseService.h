//
//  BaseService.h
//  Jingcai
//
//  Created by Rain on 2018/11/2.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SVProgressHUD/SVProgressHUD.h>
#import "AFNetworking.h"
#import "JCWInterfaceTool.h"

#define PAGE_LIMIT 10
#define PAGE_LIMIT_TJUSER 24
typedef void (^successBlock) (id _Nullable object);
typedef void (^failureBlock) (NSError * _Nonnull error);

NS_ASSUME_NONNULL_BEGIN
@interface BaseService : NSObject
@property (strong, nonatomic) NSString * sv;
@property (strong, nonatomic) NSString * dev;
@property (nonatomic, copy) successBlock successBlock;
@property (nonatomic, copy) failureBlock failureBlock;
@property (nonatomic, assign) BOOL isLogout;
+ (instancetype)service;
- (void)dealWithError:(NSError *)error;
- (void)deathWithSuccessInfo:(id)object;
@end
NS_ASSUME_NONNULL_END
