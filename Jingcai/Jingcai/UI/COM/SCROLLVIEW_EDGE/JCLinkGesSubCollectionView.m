//
//  JCLinkGesSubCollectionView.m
//  Jingcai
//
//  Created by Administrator on 2019/3/15.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCLinkGesSubCollectionView.h"

@interface JCLinkGesSubCollectionView () <UIGestureRecognizerDelegate>
@property (nonatomic, assign) CGPoint beginDragOffset;
@property (nonatomic, assign) CGPoint parentOffsetWhenBeginDrag;
@end

@implementation JCLinkGesSubCollectionView
- (void)awakeFromNib {
    [super awakeFromNib];
    //添加监听
    [self addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
    [self.mainScrollView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
    //self.delegate = self;
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
    CGFloat parentContentH = self.mainScrollView.contentSize.height;
    CGFloat parentOffsetY = self.mainScrollView.contentOffset.y;
    CGFloat parentViewH = self.mainScrollView.bounds.size.height;
    CGFloat parentMaxOffsetY = parentContentH < parentViewH ? 0 : fabs(parentContentH-parentViewH);
    BOOL isParentTop = parentOffsetY <= 0;
    BOOL isParentBottom = parentOffsetY >= parentMaxOffsetY;
    
    CGFloat selfContentH = self.contentSize.height;
    CGFloat selfOffsetY = self.contentOffset.y;
    CGFloat selfViewH = self.bounds.size.height;
    
    if (object == self) {
        CGPoint point = [((NSValue *)[self valueForKey:@"contentOffset"]) CGPointValue];
        NSLog(@"监听的self.offsetY == %lf", point.y);
//        if (!isParentBottom) {
//            //
//        }
    }
    if (object == self.mainScrollView) {
        CGPoint point = [((NSValue *)[self.mainScrollView valueForKey:@"contentOffset"]) CGPointValue];
        NSLog(@"监听的super.offsetY == %lf", point.y);
        if (!isParentBottom) {
            [self setContentOffset:self.beginDragOffset animated:NO];
        }
    }
}
- (void)dealloc {
    [self removeObserver:self forKeyPath:@"contentOffset"];
    [self.mainScrollView removeObserver:self forKeyPath:@"contentOffset"];
}
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    return YES;
}
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

//#pragma mark -
//- (void)syncDidScroll {
//    CGPoint point = [self.panGestureRecognizer translationInView:self];
//    CGFloat parentContentH = self.mainScrollView.contentSize.height;
//    CGFloat parentOffsetY = self.mainScrollView.contentOffset.y;
//    CGFloat parentViewH = self.mainScrollView.bounds.size.height;
//    CGFloat selfContentH = self.contentSize.height;
//    CGFloat selfOffsetY = self.contentOffset.y;
//    CGFloat selfViewH = self.bounds.size.height;
//    BOOL isParentTop = parentOffsetY <= 0;
//    BOOL isParentBottom = parentContentH < parentViewH ? YES : (parentOffsetY >= parentContentH-parentViewH);
//    CGFloat parentMaxOffsetY = parentContentH < parentViewH ? 0 : fabs(parentContentH-parentViewH);
//    BOOL isSelfTop = selfOffsetY <= 0;
//    //上滑
//    if (point.y < 0 && !isParentBottom) {
//        [self setContentOffset:self.beginDragOffset animated:NO];
//    }
//    if (point.y < 0 && isParentBottom) {
//        [self.mainScrollView setContentOffset:CGPointMake(0, parentMaxOffsetY) animated:NO];
//    }
//    //下滑
//    if (point.y > 0 && !isParentTop && !isSelfTop) {
//        //[self setContentOffset:self.beginDragOffset animated:NO];
//        [self.mainScrollView setContentOffset:CGPointMake(0, parentMaxOffsetY) animated:NO];
////        [UIView animateWithDuration:0 animations:^{
////            [self.mainScrollView setContentOffset:CGPointMake(0, parentMaxOffsetY)];
////        } completion:^(BOOL finished) {
////            //
////        }];
//    }
//    if (point.y > 0 && isSelfTop) {
//        [self setContentOffset:CGPointZero animated:NO];
//    }
//}
////开始拖拽
//- (void)syncWillBeginDragging {
//    CGFloat parentContentH = self.mainScrollView.contentSize.height;
//    CGFloat parentOffsetY = self.mainScrollView.contentOffset.y;
//    CGFloat parentViewH = self.mainScrollView.bounds.size.height;
//    BOOL isParentBottom = parentContentH < parentViewH ? YES : (parentOffsetY >= parentContentH-parentViewH);
//    CGFloat parentMaxOffsetY = parentContentH < parentViewH ? 0 : fabs(parentContentH-parentViewH);
//    if (isParentBottom) {
//        [self.mainScrollView setContentOffset:CGPointMake(0, parentMaxOffsetY) animated:NO];
//    }
////    NSLog(@"开始拖拽了啊 === %lf",self.contentOffset.y);
//    self.beginDragOffset = self.contentOffset;
//}
@end
