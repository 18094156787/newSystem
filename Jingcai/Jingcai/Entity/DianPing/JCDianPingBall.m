//
//  JCDianPingBall.m
//  Jingcai
//
//  Created by Administrator on 2019/2/19.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCDianPingBall.h"
#import "JCWStringTool.h"

@implementation JCDianPingBall

// 声明自定义类参数类型
+ (NSDictionary *)modelContainerPropertyGenericClass {
    // value使用[YYEatModel class]或YYEatModel.class或@"YYEatModel"没有区别
    return @{@"image" : [JCPostImageModel class]};
}
- (BOOL)has_near {
    return ![JCWStringTool isEmptyStr:self.near];
}
- (BOOL)has_lianhong {
    return ![JCWStringTool isEmptyStr:self.lianhong];
}
- (BOOL)has_percent {
    return ![JCWStringTool isEmptyStr:self.percent];
}
- (BOOL)has_historyhong {
    return ![JCWStringTool isEmptyStr:self.history_hong];
}
- (BOOL)isShowPrice {
    return self.wl == 0;
}
- (BOOL)isShowHong {
    return self.wl == 1 ||self.wl == 3;
}
- (BOOL)isShowHei {
    return self.wl == 2 ||self.wl == 4;
}
- (BOOL)isShowZou {
    return self.wl == 5;
}
- (BOOL)isMatchEnd {
    return self.wl != 0;
}
- (BOOL)isFree {
    return self.sf == 0;
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
- (NSString *)deal_price {
    //浮点型
    if ([self isPureFloat:self.wl_desc]) {
//        double price = [self.wl_desc floatValue];
        NSNumber *number = @([self.wl_desc floatValue]);
        return [NSString stringWithFormat:@"%@红币",number];
    }
    if( [self isPureInt:self.wl_desc])
    {
        return [NSString stringWithFormat:@"%@红币",self.wl_desc];
    }
    
    if( ![self isPureInt:self.wl_desc] || ![self isPureFloat:self.wl_desc])
    {
        [NSString stringWithFormat:@"%@红币",self.wl_desc];
    }
    return self.wl_desc;
    
}

 
//判断是否为整形：
- (BOOL)isPureInt:(NSString*)string{

    NSScanner* scan = [NSScanner scannerWithString:string];

    int val;

    return[scan scanInt:&val] && [scan isAtEnd];

}
//判断是否为浮点形：

- (BOOL)isPureFloat:(NSString*)string{

    NSScanner* scan = [NSScanner scannerWithString:string];

    float val;

    return[scan scanFloat:&val] && [scan isAtEnd];

}
@end
