//
//  JCWVerTjInfoMatchBall.m
//  Jingcai
//
//  Created by Administrator on 2019/3/13.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCWVerTjInfoMatchBall.h"
#import "JCWJsonTool.h"

@implementation JCWVerTjInfoMatchBall
- (JCWVerTjInfoPlBall *)old_plBall {
    JCWVerTjInfoPlBall * plBall = (JCWVerTjInfoPlBall *)[JCWJsonTool entityWithJson:self.old_pl class:[JCWVerTjInfoPlBall class]];
    return plBall == nil ? [JCWVerTjInfoPlBall new] : plBall;
}
- (JCWVerTjInfoPlBall *)rold_plBall {
    JCWVerTjInfoPlBall * plBall = (JCWVerTjInfoPlBall *)[JCWJsonTool entityWithJson:self.rold_pl class:[JCWVerTjInfoPlBall class]];
    return plBall == nil ? [JCWVerTjInfoPlBall new] : plBall;
}
- (JCWVerTjInfoMatchResult)res_yc {
    return [self resWithSpfItem:self.spf_new];
}
- (JCWVerTjInfoMatchResult)res_ycRQ {
    return [self resWithSpfItem:self.spf_new2];
}
- (JCWVerTjInfoMatchResult)res_end {
    return [self resWithSpfItem:self.spf_result];
}
- (JCWVerTjInfoMatchResult)res_endRQ {
    return [self resWithSpfItem:self.spf_result2];
}
- (JCWVerTjInfoMatchResult)resWithSpfItem:(NSString *)spfItem {
    NSInteger spfInteger = [spfItem integerValue];
    //is_rq == 2
    if (self.is_rq.integerValue == 2) {
        switch (spfInteger) {
            case 1:
            case 4:
                return JCWVerTjInfoMatchResultAwayWin;
            case 2:
            case 5:
                return JCWVerTjInfoMatchResultAwayEqual;
            case 3:
            case 6:
                return JCWVerTjInfoMatchResultAwayLose;
            default:
                return JCWVerTjInfoMatchResultUnknown;
        }
    }
    //is_rq != 2
    switch (spfInteger) {
        case 1:
            return JCWVerTjInfoMatchResultHomeWin;
        case 2:
            return JCWVerTjInfoMatchResultHomeEqual;
        case 3:
            return JCWVerTjInfoMatchResultHomeLose;
        case 4:
            return JCWVerTjInfoMatchResultAwayWin;
        case 5:
            return JCWVerTjInfoMatchResultAwayEqual;
        case 6:
            return JCWVerTjInfoMatchResultAwayLose;
        default:
            return JCWVerTjInfoMatchResultUnknown;
    }
}
- (BOOL)isResultWin {
    return self.wl == 1 ||self.wl == 3;
}
- (BOOL)isResultLose {
    return self.wl == 2 || self.wl == 4;
}
- (BOOL)isResultWater {
    return self.wl == 5;
}
- (BOOL)isYanqi {
    return self.wl == 6;
}
- (BOOL)isQuXiao {
    return self.wl == 7;
}
@end
