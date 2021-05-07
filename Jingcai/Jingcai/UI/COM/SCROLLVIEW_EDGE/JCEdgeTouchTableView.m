//
//  JCEdgeTouchTableView.m
//  Jingcai
//
//  Created by Administrator on 2019/2/22.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCEdgeTouchTableView.h"
@interface JCEdgeTouchTableView () <UIGestureRecognizerDelegate>
@end

@implementation JCEdgeTouchTableView
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    CGPoint velocity = [(UIPanGestureRecognizer *)gestureRecognizer velocityInView:self];
    //当前处于顶部,并且向下滑动
    if (self.contentOffset.y <= 0 && velocity.y > 0) {
        if (self.edgeDownBlock) {
            self.edgeDownBlock();
        }
    }
    //向上滑动
    if (velocity.y < 0) {
        if (self.anyUpBlock) {
            self.anyUpBlock();
        }
    }
    return YES;
}
//识别多个手势
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}
@end
