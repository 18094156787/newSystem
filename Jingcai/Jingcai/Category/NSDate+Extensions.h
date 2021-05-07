//
//  NSDate+Extensions.h
//  Jingcai
//
//  Created by 陈继伟 on 2019/8/27.
//  Copyright © 2019年 jingcai. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (Extensions)

/// 获取年
+ (NSInteger)year:(NSString *)dateStr;
/// 获取月
+ (NSInteger)month:(NSString *)dateStr;
/// 获取星期
+ (NSInteger)week:(NSString *)dateStr;
/// 获取星期 中文 日
+ (NSString *)getWeekFromDate:(NSDate *)date;
/// 获取星期 中文 周日
+ (NSString *)getChineseWeekFrom:(NSString *)dateStr;
/// 获取日
+ (NSInteger)day:(NSString *)dateStr;
/// 获取月共有多少天
+ (NSInteger)daysInMonth:(NSString *)dateStr;

/// 获取当前日期 2018-01-01
+ (NSString *)currentDay;
/// 获取当前小时 00:00
+ (NSString *)currentHour;
/// 获取下月最后一天
+ (NSString *)nextMonthLastDay;

/// 判断是否是今天
+ (BOOL)isToday:(NSString *)dateStr;
/// 判断是否是明天
+ (BOOL)isTomorrow:(NSString *)dateStr;
/// 判断是否是后天
+ (BOOL)isAfterTomorrow:(NSString *)dateStr;
/// 判断是否是过去的时间
+ (BOOL)isHistoryTime:(NSString *)dateStr;

/// 从时间戳获取具体时间 格式:6:00
+ (NSString *)hourStringWithInterval:(NSTimeInterval)timeInterval;
/// 从时间戳获取具体小时 格式:6
+ (NSString *)hourTagWithInterval:(NSTimeInterval)timeInterval;
/// 从毫秒级时间戳获取具体小时 格式:600
+ (NSString *)hourNumberWithInterval:(NSTimeInterval)timeInterval;
/// 从时间戳获取具体日期 格式:2018-03-05
+ (NSString *)timeStringWithInterval:(NSTimeInterval)timeInterval;
/// 从date获取具体日期 格式:2018-03-05
+ (NSString *)timeStringWithDate:(NSDate *)date;
/// 从时间戳获取具体日期 格式:03-05
+ (NSString *)timeStringWithIntervalWithFormatMMDD:(NSTimeInterval)timeInterval;
/// 从时间戳获取具体日期 格式:2018-03-05 12:12:12
+ (NSString *)wholeTimeStringWithInterval:(NSTimeInterval)timeInterval;
/// 从时间戳获取具体日期 格式:2018-03-05 12:12:
+ (NSString *)wholeTimeStringToMinuteWithInterval:(NSTimeInterval)timeInterval;
/// 从具体日期获取时间戳 毫秒
+ (NSTimeInterval)timeIntervalFromDateString:(NSString *)dateStr;

/// 获取当前天的后几天的星期
+ (NSString *)getWeekAfterDay:(NSInteger)day;
/// 获取当前天的后几天的日
+ (NSString *)getDayAfterDay:(NSInteger)day;
/// 获取当前月的后几月
+ (NSString *)getMonthAfterMonth:(NSInteger)Month;
/// 获取当前月的后几月都1号
+ (NSString *)getMonthAfterMonthOneDay:(NSInteger)Month;
///于某月相差n个月的 月份  （只显示月）
+ (NSString *)onlyShowMonthAfterMonth:(NSInteger)Month;

///于某月相差n个月的 月份 （只显示 年月01日）
+ (NSString *)onlyShowYearMonthAfterMonth:(NSInteger)Month;

//时间戳转换到具体的年月日
+ (NSString *)timeStringWithIntervalWithFormat:(NSString *)format time:(NSTimeInterval)timeInterval;
//时间戳转换到具体的年月日 星期几
+ (NSString *)timeStringWithIntervalWithWeekFormat:(NSString *)format time:(NSTimeInterval)timeInterval;
#pragma mark - 比较两个时间大小（可以指定比较级数，即按指定格式进行比较）
- (NSComparisonResult)br_compare:(NSDate *)targetDate format:(NSString *)format;
@end

NS_ASSUME_NONNULL_END
