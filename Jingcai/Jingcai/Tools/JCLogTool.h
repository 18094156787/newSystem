//
//  JCLogTool.h
//  Jingcai
//
//  Created by Administrator on 2018/12/29.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface JCLogTool : NSObject
+ (void)logMsg:(NSString *)msg;
+ (void)logRect:(CGRect)rect;
@end
NS_ASSUME_NONNULL_END
