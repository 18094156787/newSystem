//
//  JCWDateTool.m
//  Jingcai
//
//  Created by Rain on 2018/11/8.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "JCWDateTool.h"

@implementation JCWDateTool

+ (NSString *)dateStringWithDate:(NSDate *)date format:(NSString *)format {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = format;
    [formatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];//相差8小时的误差处理。
    return [formatter stringFromDate:date];
}

+ (NSString *)weekDayWithDate:(NSDate *)date {
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSCalendarUnitWeekday;
    comps = [calendar components:unitFlags fromDate:date];
    switch ([comps weekday]) {
        case 1:
            return @"周日";
        case 2:
            return @"周一";
        case 3:
            return @"周二";
        case 4:
            return @"周三";
        case 5:
            return @"周四";
        case 6:
            return @"周五";
        case 7:
            return @"周六";
        default:
            return @"";
    }
}

+ (NSMutableArray *)getCurrentWeek {
    NSMutableArray * dayArr = [NSMutableArray array];
    NSDate * date = [NSDate date];
    //weekDay
    NSInteger weekDay = [self weekDayOfDate:date];
    //NSLog(@"weekDay == %ld", weekDay);
    //定位至周一
    NSInteger diffDay = weekDay == 1 ? -6 : 2-weekDay;
    NSDate * firstDate = [self dateByAddDay:diffDay fromDate:date];
    //NSLog(@"firstDate == %@", firstDate);
    //累加7天
    for (NSInteger i = 0; i < 7; i++) {
        NSInteger nextDay = [self dayByAddDay:i fromDate:firstDate];
        [dayArr addObject:[NSString stringWithFormat:@"%ld", nextDay]];
    }
    //NSLog(@"dayArr == %@", dayArr);
    return dayArr;
}

+ (NSInteger)weekDayOfDate:(NSDate *)date {
    NSCalendar * calendar = [NSCalendar currentCalendar];
    return [calendar component:NSCalendarUnitWeekday fromDate:date];
}

+ (NSDate *)dateByAddDay:(NSInteger)day fromDate:(NSDate *)date {
    NSCalendar * calendar = [NSCalendar currentCalendar];
    NSDateComponents * comp = [calendar components:NSCalendarUnitDay fromDate:date];
    comp.day = day;
    NSDate * resDate = [calendar dateByAddingComponents:comp toDate:date options:NSCalendarMatchStrictly];
    return resDate;
}

+ (NSInteger)dayByAddDay:(NSInteger)day fromDate:(NSDate *)date {
    NSDate * resDate = [self dateByAddDay:day fromDate:date];
    NSCalendarUnit unit = NSCalendarUnitDay | NSCalendarUnitWeekday;
    NSDateComponents * resComp = [[NSCalendar currentCalendar] components:unit fromDate:resDate];
    return resComp.day;
}

//获取一周时间 数组
+ (NSMutableArray *)getCurrentWeeksWithFirstDiff:(NSInteger)first lastDiff:(NSInteger)last{
    NSMutableArray *eightArr = [[NSMutableArray alloc] init];
    for (NSInteger i = first; i < last + 1; i ++) {
        //从现在开始的24小时
        NSTimeInterval secondsPerDay = i * 24*60*60;
        NSDate *curDate = [NSDate dateWithTimeIntervalSinceNow:secondsPerDay];                NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];         [dateFormatter setDateFormat:@"M月d日"];
        NSString *dateStr = [dateFormatter stringFromDate:curDate];//几月几号
        //        NSString *dateStr = @"5月31日";
        NSDateFormatter *weekFormatter = [[NSDateFormatter alloc] init];
        [weekFormatter setDateFormat:@"EEEE"];//星期几 @"HH:mm 'on' EEEE MMMM d"];
        NSString *weekStr = [weekFormatter stringFromDate:curDate];
        //组合时间
        NSString *strTime = [NSString stringWithFormat:@"%@(%@)",dateStr,weekStr];          [eightArr addObject:strTime];
    }
    return eightArr;
}


+ (NSMutableArray *)daysOfCurrentMonth {
    //初始化
    NSMutableArray * dayArray = [[NSMutableArray alloc] init];
    NSCalendar * calendar = [NSCalendar currentCalendar];
    NSDateComponents *nowComps = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:[NSDate date]];
    NSInteger year = nowComps.year;
    NSInteger month = nowComps.month;
    NSInteger day = nowComps.day;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSDate * nowDate = [dateFormatter dateFromString:[NSString stringWithFormat:@"%ld-%ld-%ld",year,month,day]];
    //本月的天数范围
    NSRange dayRange = [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:nowDate];
    //上个月的天数范围
    NSRange lastdayRange = [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:[self lastMonthOfFistDayWithYear:year month:month]];
    //本月第一天的NSDate对象
    NSDate *nowMonthfirst = [dateFormatter dateFromString:[NSString stringWithFormat:@"%ld-%ld-%d",year,month,1]];
    //本月第一天是星期几
    NSDateComponents * components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitWeekday fromDate:nowMonthfirst];
    //本月最后一天的NSDate对象
    NSDate * nextDay = [dateFormatter dateFromString:[NSString stringWithFormat:@"%ld-%ld-%ld",year,month,dayRange.length]];
    NSDateComponents * lastDay = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitWeekday fromDate:nextDay];
    //上个月遗留的天数
    for (NSInteger i = lastdayRange.length - components.weekday + 2; i <= lastdayRange.length; i++) {
        NSString * string = [NSString stringWithFormat:@"%ld",i];
        [dayArray addObject:string];
    }
    //本月的总天数
    for (NSInteger i = 1; i <= dayRange.length ; i++) {
        NSString * string = [NSString stringWithFormat:@"%ld",i];
        [dayArray addObject:string];
    }
    //下个月空出的天数
    for (NSInteger i = 1; i <= (7 - lastDay.weekday); i++) {
        NSString * string = [NSString stringWithFormat:@"%ld",i];
        [dayArray addObject:string];
    }
//    self.index = components.weekday - 2 + self.day;
//    self.block(_year, _month);
    return dayArray;
}

//返回上个月第一天的NSDate对象
+ (NSDate *)lastMonthOfFistDayWithYear:(NSInteger)year month:(NSInteger)month {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSDate * date = nil;
    if (month != 1) {
        date = [dateFormatter dateFromString:[NSString stringWithFormat:@"%ld-%ld-%d", year, month-1, 01]];
    } else {
        date = [dateFormatter dateFromString:[NSString stringWithFormat:@"%ld-%d-%d", year-1, 12, 01]];
    }
    return date;
}
+ (NSString *)dateStringWithString:(NSString *)dateString inputFormat:(NSString *)inputFormat outputFormat:(NSString *)outputFormat {
    NSDateFormatter * inputFormatter = [[NSDateFormatter alloc] init];
    [inputFormatter setDateFormat:inputFormat];
    //[dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:8]];//解决8小时时间差问题
    NSDate * date = [inputFormatter dateFromString:dateString];
    
    NSDateFormatter * outputFormatter = [[NSDateFormatter alloc] init];
    [outputFormatter setDateFormat:outputFormat];
    return [outputFormatter stringFromDate:date];
}
@end
