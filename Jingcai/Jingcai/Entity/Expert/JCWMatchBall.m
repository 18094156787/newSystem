//
//  JCWMatchBall.m
//  Jingcai
//
//  Created by Rain on 2018/11/5.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "JCWMatchBall.h"
#import "JCWStringTool.h"
#import "JCWDateTool.h"

@implementation JCWMatchBall

- (NSString *)matchCountString {
    return self.matchCount > 0 ? [NSString stringWithFormat:@"%ld个方案 >", self.matchCount] : @"";
}
- (NSString *)listIntroString {
    NSString * timeStr = [JCWDateTool dateStringWithString:self.kickoffTime inputFormat:@"yyyy-MM-dd HH:mm" outputFormat:@"HH:mm"];
    return [NSString stringWithFormat:@"%@ %@ | %@", self.matchName, timeStr, self.leagueName];
}
- (NSString *)detailIntroString {
//    NSString * timeStr = [JCWDateTool dateStringWithString:self.kickoffTime inputFormat:@"yyyy-MM-dd HH:mm" outputFormat:@"HH:mm"];
//    return [NSString stringWithFormat:@"%@\n\n%@ %@", self.leagueName, self.matchName, timeStr];
    return [NSString stringWithFormat:@"%@ %@", self.matchName, self.kickoffTime];
}
- (BOOL)isTypeZQ {
    return self.matchType == 1;
}
- (BOOL)isTypeLQ {
    return self.matchType == 2;
}
- (NSString *)statusZQ {
    switch (self.matchStatus) {
        case 1: //未开始
            return @"未开始";
        case 2: //进行中
            return self.matchNowScore;
        case 3: //已结束
            return self.fullScore;
        default:
            return @"";
    }
}
- (NSString *)statusLQ {
    switch (self.matchStatus) {
        case -1: //已结束
            return self.fullScore;
        case 0: //未开始
            return @"未开始";
        default:
            return self.matchNowScore;
            break;
    }
}
- (BOOL)isInProgress {
    return self.matchStatus == 2;
}

- (NSString *)numberOfFangAn {
    return self.matchCount > 0 ? [NSString stringWithFormat:@"%ld个方案 >", self.matchCount] : @"";
}
- (NSString *)introOfList {
    NSString * timeStr = [JCWDateTool dateStringWithString:self.kickoffTime inputFormat:@"yyyy-MM-dd HH:mm" outputFormat:@"HH:mm"];
    return [NSString stringWithFormat:@"%@ %@ | %@", self.matchName, timeStr, self.leagueName];
    
    //瑞超  01:00    周一
}
- (NSString *)introOfDetail {
    return [NSString stringWithFormat:@"%@ %@", self.matchName, self.kickoffTime];
}
- (NSString *)introOfService {
    NSString * timeStr = [JCWDateTool dateStringWithString:self.kickoffTime inputFormat:@"yyyy-MM-dd HH:mm" outputFormat:@"HH:mm"];
    return [NSString stringWithFormat:@"%@  %@    %@", self.matchName, timeStr, self.leagueName];
}
@end
