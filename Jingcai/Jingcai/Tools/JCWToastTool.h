//
//  JCWToastTool.h
//  AutumnFinance
//
//  Created by Rain on 2018/6/29.
//  Copyright © 2018年 rain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JCWToastTool : NSObject
+ (void)showHint:(NSString *)hint;
+ (void)showSysAlertWithMsg:(NSString *)msg confirm:(void(^)(void))confirmBlock cancel:(void(^)(void))cancelBlock;
@end
