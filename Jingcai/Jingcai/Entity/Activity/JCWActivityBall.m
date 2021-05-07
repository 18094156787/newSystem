//
//  JCWActivityBall.m
//  Jingcai
//
//  Created by Rain on 2018/11/12.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "JCWActivityBall.h"

@implementation JCWActivityBall
- (BOOL)isEnd {
    //1表示没截止，其他为截止
    return ![_type isEqualToString:@"1"];
}
@end
