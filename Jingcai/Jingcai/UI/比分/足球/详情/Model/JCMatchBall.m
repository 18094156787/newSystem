//
//  JCMatchBall.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/19.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCMatchBall.h"

@implementation JCMatchBall


//0:比赛异常1:未开赛2:上半场3:中场4:下半场5:加时赛6:加时赛(弃用)7:点球决战8:完场9:推迟10:中断11:腰斩12:取消13:待定
+ (NSString *)getMatchStatus:(NSInteger)status_id {
    NSString *str = @"";
    switch (status_id) {
        case 0:
        {
            str = @"比赛异常";
        }
            break;
        case 1:
        {
            str = @"未开赛";
        }
            break;
        case 2:
        {
            str = @"上半场";
        }
            break;
        case 3:
        {
            str = @"中场";
        }
            break;
        case 4:
        {
            str = @"下半场";
        }
            break;
        case 5:
        {
            str = @"加时赛";
        }
            break;
        case 6:
        {
            str = @"加时赛";
        }
            break;
        case 7:
        {
            str = @"点球决战";
        }
            break;
        case 8:
        {
            str = @"完场";
        }
            break;
        case 9:
        {
            str = @"推迟";
        }
            break;
        case 10:
        {
            str = @"中断";
        }
            break;
        case 11:
        {
            str = @"腰斩";
        }
            break;
        case 12:
        {
            str = @"取消";
        }
            break;
        case 13:
        {
            str = @"待定";
        }
            break;
            
        default:
            break;
    }
    return str;
}
@end
