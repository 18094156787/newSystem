//
//  JCWActivityMatchBall.m
//  Jingcai
//
//  Created by Rain on 2018/11/12.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "JCWActivityMatchBall.h"

@implementation JCWActivityMatchBall
- (NSInteger)winPercent {
    NSInteger total = _win_number + _draw_number + _lose_number;
    return (_win_number*100.f/total+0.5f);
}
- (NSInteger)drawPercent {
    NSInteger total = _win_number + _draw_number + _lose_number;
    return (_draw_number*100.f/total+0.5f);
}
- (NSInteger)losePercent {
    NSInteger total = _win_number + _draw_number + _lose_number;
    NSInteger winPercnt = _win_number*100.f/total+0.5f;
    NSInteger drawPercent = _draw_number*100.f/total+0.5f;
    return (100 - winPercnt - drawPercent);
}
@end
