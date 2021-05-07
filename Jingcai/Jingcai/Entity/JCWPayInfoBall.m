//
//  JCWPayInfoBall.m
//  Jingcai
//
//  Created by Administrator on 2019/3/1.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCWPayInfoBall.h"

@implementation JCWPayInfoBall
- (BOOL)canUserHB {
    //hb字段：1 可以、2 不可以
    return [self.hb isEqualToString:@"1"];
}
@end
