//
//  JCEdgeTouchScrollView.m
//  Jingcai
//
//  Created by Administrator on 2019/2/21.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCEdgeTouchScrollView.h"

@interface JCEdgeTouchScrollView () <UIGestureRecognizerDelegate>
@end

@implementation JCEdgeTouchScrollView
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    CGPoint velocity = [(UIPanGestureRecognizer *)gestureRecognizer velocityInView:self];
    //如果在最左边,并且向右滑动
    if (self.contentOffset.x <= 0 && velocity.x > 0) {
        NSLog(@"边缘右滑");
        return NO;
    }
    return YES;
}
@end
