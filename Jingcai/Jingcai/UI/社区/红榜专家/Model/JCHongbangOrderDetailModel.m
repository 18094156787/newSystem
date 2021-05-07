//
//  JCHongbangOrderDetailModel.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/30.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCHongbangOrderDetailModel.h"

@implementation JCHongbangOrderDetailModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    // value使用[YYEatModel class]或YYEatModel.class或@"YYEatModel"没有区别
    return @{@"match_data" : [JCDianPingMatchBall class]};
}

- (NSString *)pay_type_str {
    NSString *str = @"红币";
    //支付方式 1支付宝支付 2微信支付 3红币支付 4苹果支付
    if ([self.pay_type intValue]==1) {
        str = @"支付宝";
    }
    if ([self.pay_type intValue]==2) {
        str = @"微信";
    }
    if ([self.pay_type intValue]==3) {
        str = @"红币";
    }
    if ([self.pay_type intValue]==4 ) {
        str = @"苹果";
    }
    if ([self.pay_type intValue]==5 ) {
        str = @"红包";
        if ([self.coupon_id integerValue]!=0) {
            str = @"免单";
        }
    }
    return str;
}

@end
