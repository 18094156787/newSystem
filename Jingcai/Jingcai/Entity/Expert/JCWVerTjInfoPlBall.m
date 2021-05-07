//
//  JCWVerTjInfoPlBall.m
//  Jingcai
//
//  Created by Administrator on 2019/3/13.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCWVerTjInfoPlBall.h"

@implementation JCWVerTjInfoPlBall
- (NSString *)title_win {
    return [NSString stringWithFormat:@"主胜 %@", NonNil(self.win)];
}
- (NSString *)title_equal {
    return [NSString stringWithFormat:@"平 %@", NonNil(self.equal)];
}
- (NSString *)title_lose {
    return [NSString stringWithFormat:@"客胜 %@", NonNil(self.lose)];
}


//- (void)getInfoWithSpf:(NSString *)spf spf2:(NSString *)spf2 spfResult:(NSString *)spfResult spfResult2:(NSString *)spfResult2 isRq:(NSString *)isRq completion:(void(^)(JCWVerTjInfoPlResultType ycType, JCWVerTjInfoPlResultType ycRQType, JCWVerTjInfoPlResultType resRQType, JCWVerTjInfoPlResultType resType, NSString * desc, NSString * descRQ))resultBlock {
//
//    JCWVerTjInfoPlResultType ycType = JCWVerTjInfoPlResultTypeUnknown;
//    JCWVerTjInfoPlResultType ycRQType = JCWVerTjInfoPlResultTypeUnknown;
//    JCWVerTjInfoPlResultType resType = JCWVerTjInfoPlResultTypeUnknown;
//    JCWVerTjInfoPlResultType resRQType = JCWVerTjInfoPlResultTypeUnknown;
//    NSString * desc = @"";
//    NSString * descRQ = @"";
//
//    ycType = [self resTypeWithSpfItem:spf isRq:isRq];
//    ycRQType = [self resTypeWithSpfItem:spf2 isRq:isRq];
//    resType = [self resTypeWithSpfItem:spfResult isRq:isRq];
//    resRQType = [self resTypeWithSpfItem:spfResult2 isRq:isRq];
//    desc = [NSString stringWithFormat:@"%@ %@",[self descWithResType:ycType],[self plWithSpfItem:spf]];
//    descRQ = [NSString stringWithFormat:@"%@ %@",[self descWithResType:ycRQType],[self plWithSpfItem:spf2]];
//
////    NSArray * ycTypeArr = [self resTypeArrWithSpf:spf isRq:isRq];
////    NSArray * resTypeArr = [self resTypeArrWithSpf:spfResult isRq:isRq];
////    NSArray * ycPlArr = [self plArrWithSpf:spf];
////
////    if (ycTypeArr.count > 0) {
////        ycType = [ycTypeArr[0] integerValue];
////    }
////    if (resTypeArr.count > 0) {
////        resType = [resTypeArr[0] integerValue];
////    }
////    if (ycPlArr.count > 0) {
////        desc = [NSString stringWithFormat:@"%@ %@",[self descWithResType:ycType],ycPlArr[0]];
////    }
////    if (isRq.intValue == 4) {
////        if (ycTypeArr.count > 1) {
////            ycRQType = [ycTypeArr[1] integerValue];
////        }
////        if (resTypeArr.count > 1) {
////            resRQType = [resTypeArr[1] integerValue];
////        }
////        if (resTypeArr.count > 1) {
////            descRQ = [NSString stringWithFormat:@"%@ %@",[self descWithResType:ycRQType],ycPlArr[1]];
////        }
////    }
//    resultBlock(ycType, ycRQType, resRQType, resType, desc, descRQ);
//}
//- (void)getRqInfoWithSpf:(NSString *)spf spfResult:(NSString *)spfResult isRq:(NSString *)isRq completion:(void(^)(JCWVerTjInfoPlResultType resType, JCWVerTjInfoPlResultType ycType, NSString * desc))completion {
//    NSArray * ycTypeArr = [self resTypeArrWithSpf:spf isRq:isRq];
//    NSArray * resTypeArr = [self resTypeArrWithSpf:spfResult isRq:isRq];
//}

#pragma mark - Base
//- (NSArray *)resTypeArrWithSpf:(NSString *)spf isRq:(NSString *)isRq {
//    NSMutableArray * resArr = [NSMutableArray array];
//    NSArray * spfArr = [spf componentsSeparatedByString:@","];
//    for (NSString * spfItem in spfArr) {
//        [resArr addObject:@([self resTypeWithSpfItem:spfItem isRq:isRq])];
//    }
//    return [resArr copy];
//}
//- (NSArray *)plArrWithSpf:(NSString *)spf {
//    NSMutableArray * plArr = [NSMutableArray array];
//    NSArray * spfArr = [spf componentsSeparatedByString:@","];
//    for (NSString * spfItem in spfArr) {
//        [plArr addObject:[self plWithSpfItem:spfItem]];
//    }
//    return [plArr copy];
//}
//- (NSString *)descWithResType:(JCWVerTjInfoPlResultType)resType {
//    if (resType == JCWVerTjInfoPlResultTypeWin) {
//        return @"主胜";
//    }
//    if (resType == JCWVerTjInfoPlResultTypeEqual) {
//        return @"平";
//    }
//    if (resType == JCWVerTjInfoPlResultTypeLose) {
//        return @"客胜";
//    }
//    return @"";
//}
//- (JCWVerTjInfoPlResultType)resTypeWithSpfItem:(NSString *)spfItem isRq:(NSString *)isRq {
//    NSInteger spfInteger = [spfItem integerValue];
//    switch (spfInteger) {
//        case 1:
//        case 4:
//            return JCWVerTjInfoPlResultTypeWin;
//        case 2:
//        case 5:
//            return JCWVerTjInfoPlResultTypeEqual;
//        case 3:
//        case 6:
//            return JCWVerTjInfoPlResultTypeLose;
//        default:
//            return JCWVerTjInfoPlResultTypeUnknown;
//    }
//    //4(混搭)的情况下使用1-6
//    if (isRq.intValue == 4) {
//        switch (spfInteger) {
//            case 1:
//                return JCWVerTjInfoPlResultTypeWin;
//            case 2:
//                return JCWVerTjInfoPlResultTypeEqual;
//            case 3:
//                return JCWVerTjInfoPlResultTypeLose;
//            case 4:
//                return JCWVerTjInfoPlResultTypeLose;
//            case 5:
//                return JCWVerTjInfoPlResultTypeEqual;
//            case 6:
//                return JCWVerTjInfoPlResultTypeWin;
//            default:
//                return JCWVerTjInfoPlResultTypeUnknown;
//        }
//    }
//    //其他的保留原样
//    switch (spfInteger) {
//        case 1:
//            return isRq.intValue == 1 ? JCWVerTjInfoPlResultTypeWin : JCWVerTjInfoPlResultTypeLose;
//        case 2:
//            //return isRq.intValue == 1 ? @"平" : @"让平";
//            return JCWVerTjInfoPlResultTypeEqual;
//        case 3:
//            return isRq.intValue == 1 ? JCWVerTjInfoPlResultTypeLose : JCWVerTjInfoPlResultTypeWin;
//            //is_rq == 2 时还有个4、5、6
//        case 4:
//            return JCWVerTjInfoPlResultTypeLose;
//        case 5:
//            return JCWVerTjInfoPlResultTypeEqual;
//        case 6:
//            return JCWVerTjInfoPlResultTypeWin;
//        default:
//            return JCWVerTjInfoPlResultTypeUnknown;
//    }
//}
//- (NSString *)plWithSpfItem:(NSString *)spfItem {
//    NSInteger spfInteger = [spfItem integerValue];
//    //取win,equal还是lose
//    switch (spfInteger) {
//        case 1:
//        case 4:
//            return self.win;
//        case 2:
//        case 5:
//            return self.equal;
//        case 3:
//        case 6:
//            return self.lose;
//        default:
//            return @"";
//    }
//}
@end
