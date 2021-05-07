//
//  JCWTjInfoDetailBall.m
//  Jingcai
//
//  Created by Rain on 2018/11/7.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "JCWTjInfoDetailBall.h"

@implementation JCWTjInfoDetailBall
+ (NSDictionary *)modelContainerPropertyGenericClass {
    // value使用[YYEatModel class]或YYEatModel.class或@"YYEatModel"没有区别
    return @{@"image" : [JCPostImageModel class],@"user" : [JCWExpertBall class]};
}
- (BOOL)isResultWin {
    return [self.all_wl intValue] == 1 ||[self.all_wl intValue] == 3;
}
- (BOOL)isResultLose {
    return [self.all_wl intValue] == 2 || [self.all_wl intValue] == 4;
}
- (BOOL)isResultWater {
    return [self.all_wl intValue] == 5;
}
- (BOOL)isYanqi {
    return [self.all_wl intValue] == 6;
}
- (BOOL)isQuXiao {
    return [self.all_wl intValue] == 7;
}


//- (BOOL)is_ai {
//    if (self.content.length==0) {
//        return YES;
//    }
//    return NO;
//}
//- (BOOL)isAI {
//    if ([self.user_id isEqualToString:@"271021"]) {
//        return YES;
//    }
////    return NO;
//        return YES;
//    
//}

@end
