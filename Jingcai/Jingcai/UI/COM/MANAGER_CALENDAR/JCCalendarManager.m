//
//  JCCalendarManager.m
//  Jingcai
//
//  Created by Administrator on 2019/4/17.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCCalendarManager.h"
#import <EventKit/EventKit.h>

@implementation JCCalendarManager
- (void)saveEventToCalendar {
    NSString * eventTitle = @"事件标题";
    NSString * eventLocation = @"事件位置";
    EKEventStore * eventStore = [[EKEventStore alloc] init];
    if ([eventStore respondsToSelector:@selector(requestAccessToEntityType:completion:)]){
        [eventStore requestAccessToEntityType:EKEntityTypeEvent completion:^(BOOL granted, NSError *error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (error) {
                    //错误信息
                    NSLog(@"访问日历出错。");
                }
                else if (!granted) {
                    //被用户拒绝，不允许访问日历
                    NSLog(@"没有访问日历的权限");
                } else {
                    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
                    [dateFormatter setDateFormat:@"dd.MM.yyyy HH:mm"];
                    NSDate *date = [NSDate date];
                    // 先判断是否添加了事件
                    NSDate *startDate =[date dateByAddingTimeInterval:60 * 3];
                    NSDate *endDate =[date dateByAddingTimeInterval:60 * 5];
                    
                    NSPredicate *predicate = [eventStore predicateForEventsWithStartDate:startDate
                                                                                 endDate:endDate calendars:@[[eventStore defaultCalendarForNewEvents]]];                    NSArray *events = [eventStore eventsMatchingPredicate:predicate];
                    
                    for (EKEvent *event in events) {
                        if([event.title isEqualToString:[NSString stringWithFormat:@"%@%@",@"name",eventTitle]] &&
                           [event.location isEqualToString:eventLocation]){
                            // 说明提醒事件存在
                            NSLog(@"事件已存在");
                            return ;
                            
                        }
                    }
                    //事件保存到日历
                    EKEvent *event  = [EKEvent eventWithEventStore:eventStore];
                    event.title = [NSString stringWithFormat:@"%@",eventTitle];
                    event.location = eventLocation;
                    event.startDate = startDate;
                    event.endDate   = endDate;
//                    //添加提醒
//                    [event addAlarm:[EKAlarm alarmWithRelativeOffset:-(60.0f * 1.0f)]];
//                    [event addAlarm:[EKAlarm alarmWithRelativeOffset:-(60.0f * 2.0f)]];
//                    [event setCalendar:[eventStore defaultCalendarForNewEvents]];
//                    NSError *err;
//                    [eventStore saveEvent:event span:EKSpanThisEvent error:&err];
//                    UIAlertView *alert = [[UIAlertView alloc]
//                                          initWithTitle:@"提醒成功"
//                                          message:@"系统将会在***开始2分钟前提醒您"
//                                          delegate:nil
//                                          cancelButtonTitle:@"确定"
//                                          otherButtonTitles:nil];
//                    [alert show];
                }
            });
        }];
    }
    
}
@end
