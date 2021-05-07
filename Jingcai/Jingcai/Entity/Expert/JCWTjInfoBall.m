//
//  JCWTjInfoBall.m
//  Jingcai
//
//  Created by Rain on 2018/11/6.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "JCWTjInfoBall.h"

@implementation JCWTjInfoBall
//- (BOOL)canUserHB {
//    //hb字段：1 可以、2 不可以
//    return [_hb isEqualToString:@"1"];
//}
// 声明自定义类参数类型
+ (NSDictionary *)modelContainerPropertyGenericClass {
    // value使用[YYEatModel class]或YYEatModel.class或@"YYEatModel"没有区别
    return @{@"match" : [JCWVerTjInfoMatchBall  class],@"image":[JCPostImageModel class]};
}
- (BOOL)isShow_win {
    return self.ten_tj_win.intValue >= 7;
}
- (BOOL)isShow_zyll {
    return self.zyll.floatValue >= 3;
}
- (BOOL)isShow_lianhong {
    return self.lianhong.intValue >= 2;
}
- (NSString *)info_hong {
    return [NSString stringWithFormat:@"%@连红",NonNil(self.hong)];
}
- (NSString *)info_win {
    return [NSString stringWithFormat:@"%@中%@",NonNil(self.ten_tj_all),NonNil(self.ten_tj_win)];
}
- (NSString *)info_zyll {
    return [NSString stringWithFormat:@"%f%%",self.zyll.floatValue*100];
}
- (NSString *)info_lianhong {
    return [NSString stringWithFormat:@"%@连红",NonNil(self.lianhong)];
}
- (BOOL)isSubscribe {
    return [self.subscribe isEqualToString:@"关注"];
}
- (JCWPayInfoBall *)parseToPayInfoBall {
    JCWPayInfoBall * infoBall = [[JCWPayInfoBall alloc] init];
    infoBall.id = self.id;
    infoBall.user_id = self.user_id;
    infoBall.sf = self.sf;
    infoBall.wl_desc = self.wl_desc;
    infoBall.hb = self.hb;
    return infoBall;
}
- (BOOL)isFree {
    return self.sf == 0;
}
- (BOOL)isShowPrice {
    return self.wl == 0;
}
- (BOOL)isWin {
    return self.wl == 1;
}
- (BOOL)isLose {
    return self.wl == 2;
}
@end
