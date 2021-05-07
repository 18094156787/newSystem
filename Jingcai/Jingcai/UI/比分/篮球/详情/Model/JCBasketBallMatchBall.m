//
//  JCBasketBallMatchBall.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/7.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBasketBallMatchBall.h"

@implementation JCBasketBallMatchBall

-(NSString *)kindType {
    NSString *type = @"";
    if (self.kind==0) {
        type = @"";
    }
    if (self.kind==1) {
        type = @"常规赛";
    }
    if (self.kind==2) {
        type = @"季后赛";
    }
    if (self.kind==3) {
        type = @"季前赛";
    }
    if (self.kind==4) {
        type = @"全明星";
    }
    if (self.kind==5) {
        type = @"杯赛";
    }
    return type;
    
}

@end
