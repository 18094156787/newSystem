//
//  JCWInterfaceTool_New.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/12/24.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JCWInterfaceTool_New : NSObject

+ (NSString *)serviceUrlWithRoute:(NSString *)route;
+ (NSString *)serviceUrlWithRoute:(NSString *)route paramDic:(NSDictionary *)param ignoreArray:(NSArray *)ignoreArray;

@end

NS_ASSUME_NONNULL_END
