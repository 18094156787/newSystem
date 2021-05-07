//
//  JCWDateTool.h
//  Jingcai
//
//  Created by Rain on 2018/11/8.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface JCWDateTool : NSObject
//格式化日期字符串
+ (NSString *)dateStringWithDate:(NSDate *)date format:(NSString *)format;
//获取"周几"字符串
+ (NSString *)weekDayWithDate:(NSDate *)date;
//获取本周的day数组
+ (NSMutableArray *)getCurrentWeek;
//获取本月的day数组
+ (NSMutableArray *)daysOfCurrentMonth;
//字符串转nsdate,再输出指定格式字符串
+ (NSString *)dateStringWithString:(NSString *)dateString inputFormat:(NSString *)inputFormat outputFormat:(NSString *)outputFormat;
@end
NS_ASSUME_NONNULL_END
