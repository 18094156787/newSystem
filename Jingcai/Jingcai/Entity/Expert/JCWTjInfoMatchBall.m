//
//  JCWTjInfoMatchBall.m
//  Jingcai
//
//  Created by Rain on 2018/11/7.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "JCWTjInfoMatchBall.h"

@implementation JCWTjInfoMatchBall
////是否有结果
//- (BOOL)hasSpfResult {
//    return self.spf_result.length > 0 || self.spf_result2.length > 0;
//}
//预测
- (NSString *)spfStr {
    NSString * result = @"";
    NSArray * spfArr = [_spf componentsSeparatedByString:@","];
    for (NSString * ycItem in spfArr) {
        NSString * ycDesc = [self getDescWithSpf:ycItem];
        if ([[spfArr firstObject] isEqualToString:ycItem]) {
            result = [result stringByAppendingString:ycDesc];
        } else {
            result = [result stringByAppendingString:[NSString stringWithFormat:@" %@",ycDesc]];
        }
    }
    return result;
}
//推荐赔率
- (NSString *)tjPlStr {
    NSString * result = @"";
    NSArray * spfArr = [_spf componentsSeparatedByString:@","];
    if (_is_rq == 4) {
        if (spfArr.count > 0) {
            result = [NSString stringWithFormat:@"%@%@", [self getDescWithSpf:spfArr[0]], [self getPlWithSpf:spfArr[0] isTuijian:YES]];
        }
    }
    if (_is_rq == 1 || _is_rq == 2) {
        NSString * rqPrefix = @"";
        if (_is_rq == 2) {
            NSDictionary * oddsBall = nil;
            if (_old_pl.count > 0) {
                oddsBall = (NSDictionary *)[_old_pl firstObject];
            }
            if (oddsBall) {
                rqPrefix = [NSString stringWithFormat:@"(%@) ", [self rqStrWithRq:oddsBall[@"rq"]]];
            }
        }
        for (NSString * ycItem in spfArr) {
            NSString * ycDesc = [self getDescWithSpf:ycItem];
            NSString * ycPl = [self getPlWithSpf:ycItem isTuijian:YES];
            if ([spfArr indexOfObject:ycItem] == 0) {
                NSString * itemRes = [NSString stringWithFormat:@"%@%@", ycDesc, ycPl];
                result = [result stringByAppendingString:itemRes];
            } else {
                NSString * itemRes = [NSString stringWithFormat:@" %@%@", ycDesc, ycPl];
                result = [result stringByAppendingString:itemRes];
            }
        }
        result = [rqPrefix stringByAppendingString:result];
    }
    return result;
}
//让球推荐赔率
- (NSString *)rqtjPlStr {
    NSString * result = @"";
    NSArray * spfArr = [_spf componentsSeparatedByString:@","];
    if (_is_rq == 4) {
        if (spfArr.count > 1) {
            result = [NSString stringWithFormat:@"%@%@", [self getDescWithSpf:spfArr[1]], [self getPlWithSpf:spfArr[1] isTuijian:YES]];
        }
    }
    return result;
}
//即时赔率
- (NSString *)jsPlStr {
    NSString * result = @"";
    NSArray * spfArr = [_spf componentsSeparatedByString:@","];
    if (_is_rq == 4) {
        if (spfArr.count > 1) {
            return [NSString stringWithFormat:@"%@%@", [self getDescWithSpf:spfArr[0]], [self getPlWithSpf:spfArr[0] isTuijian:NO]];
        }
    }
    if (_is_rq == 1 || _is_rq == 2) {
        NSString * rqPrefix = @"";
        if (_is_rq == 2) {
            NSDictionary * oddsBall = nil;
            if (_now_pl.count > 0) {
                oddsBall = (NSDictionary *)[_now_pl firstObject];
            }
            if (oddsBall) {
                rqPrefix = [NSString stringWithFormat:@"(%@) ", [self rqStrWithRq:oddsBall[@"rq"]]];
            }
        }
        for (NSString * ycItem in spfArr) {
            NSString * ycDesc = [self getDescWithSpf:ycItem];
            NSString * ycPl = [self getPlWithSpf:ycItem isTuijian:NO];
            if ([spfArr indexOfObject:ycItem] == 0) {
                NSString * itemRes = [NSString stringWithFormat:@"%@%@", ycDesc, ycPl];
                result = [result stringByAppendingString:itemRes];
            } else {
                NSString * itemRes = [NSString stringWithFormat:@" %@%@", ycDesc, ycPl];
                result = [result stringByAppendingString:[NSString stringWithFormat:@" %@",itemRes]];
            }
        }
        result = [rqPrefix stringByAppendingString:result];
    }
    return result;
}
//让球即时赔率
- (NSString *)rqjsPlStr {
    NSString * result = @"";
    NSArray * spfArr = [_spf componentsSeparatedByString:@","];
    if (_is_rq == 4) {
        if (spfArr.count > 1) {
            result = [NSString stringWithFormat:@"%@%@", [self getDescWithSpf:spfArr[1]], [self getPlWithSpf:spfArr[1] isTuijian:NO]];
        }
    }
    return result;
}
//结果
- (NSString *)spfResultStr {
    NSString * result = @"";
    //比赛结果：123
    if (_spf_result.length > 0) {
        result = [result stringByAppendingString:[self getDescWithSpf:_spf_result]];
    }
    if (_spf_result2.length > 0) {
        result = [result stringByAppendingString:@" "];
        result = [result stringByAppendingString:[self getDescWithSpf:_spf_result2]];
    }
    return result;
}
- (BOOL)isMulti {
    return _is_rq == 4;
}
- (BOOL)isShowRq {
    return _is_rq == 2;
}
- (NSString *)rqStr {
    if ([_rq integerValue] > 0) {
        return [NSString stringWithFormat:@"+%@", _rq];
    }
    return _rq;
}

#pragma mark - Base
- (NSString *)getDescWithSpf:(NSString *)spfItem {
    NSInteger spfInteger = [spfItem integerValue];
    //4(混搭)的情况下使用1-6
    if (_is_rq == 4) {
        switch (spfInteger) {
            case 1:
                return @"主胜";
            case 2:
                return @"平";
            case 3:
                return @"客胜";
            case 4:
                return @"让胜";
            case 5:
                return @"让平";
            case 6:
                return @"让负";
            default:
                return @"";
                break;
        }
    }
    //其他的保留原样
    switch (spfInteger) {
        case 1:
            return _is_rq == 1 ? @"主胜" : @"让胜";
        case 2:
            return _is_rq == 1 ? @"平" : @"让平";
        case 3:
            return _is_rq == 1 ? @"客胜" : @"让负";
        //is_rq == 2 时还有个4、5、6
        case 4:
            return @"让胜";
        case 5:
            return @"让平";
        case 6:
            return @"让负";
        default:
            return @"";
            break;
    }
}
- (NSString *)getPlWithSpf:(NSString *)spfItem isTuijian:(BOOL)isTuijian {
    NSInteger spfInteger = [spfItem integerValue];
    //推荐还是即时
    NSArray * plArray = isTuijian ? _old_pl : _now_pl;
    JCWTjInfoOddsBall * oddsBall = nil;
    if ([@[@(1),@(2),@(3)] containsObject:@(spfInteger)]) {
//        if (plArray.count > 0) {
//            oddsBall = plArray[0];
//        }
        oddsBall = [plArray firstObject];
    }
    if ([@[@(4),@(5),@(6)] containsObject:@(spfInteger)]) {
//        if (plArray.count > 1) {
//            oddsBall = plArray[1];
//        }
        oddsBall = [plArray lastObject];
    }
    if (!oddsBall) {
        return @"";
    }
    //取win,equal还是lose
    NSDictionary * oddsDic = (NSDictionary *)oddsBall;
    switch (spfInteger) {
        case 1:
        case 4:
            return oddsDic[@"win"];
        case 2:
        case 5:
            return oddsDic[@"equal"];
        case 3:
        case 6:
            return oddsDic[@"lose"];
        default:
            return @"";
    }
}
- (NSString *)rqStrWithRq:(NSString *)rq {
    if ([rq integerValue] > 0) {
        return [NSString stringWithFormat:@"+%@", rq];
    }
    return rq;
}
@end
