//
//  JCDebugButton.m
//  Jingcai
//
//  Created by Administrator on 2019/4/12.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCDebugButton.h"

@implementation JCDebugButton
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        //[self setClipsToBounds:NO];
        [self setBackgroundColor:[UIColor orangeColor]];
        [self setTitle:@"测试" forState:UIControlStateNormal];
        [self.titleLabel setFont:[UIFont fontWithName:@"PingFang-SC" size:10]];
        //[self setBackgroundImage:[UIImage imageNamed:@"ref_black_hole"] forState:UIControlStateNormal];
    }
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    self.layer.cornerRadius = self.bounds.size.height/2;
    self.layer.borderColor = [UIColor blueColor].CGColor;
    self.layer.borderWidth = 5;
    //添加阴影
    self.layer.shadowOffset = CGSizeZero;
    self.layer.shadowRadius = 3;
    self.layer.shadowColor = [UIColor darkGrayColor].CGColor;
    self.layer.shadowOpacity = 0.12;
}

#pragma mark - DragEvent
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"dragButton触摸开始");
}
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch * touch = [touches anyObject];
    CGPoint currentPoint = [touch locationInView:self];
    // 获取上一个点
    CGPoint prePoint = [touch previousLocationInView:self];
    CGFloat offsetX = currentPoint.x - prePoint.x;
    CGFloat offsetY = currentPoint.y - prePoint.y;
    self.transform = CGAffineTransformTranslate(self.transform, offsetX, offsetY);
}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"dragButton触摸结束");
    UITouch * touch = [touches anyObject];
    CGPoint currentPoint = [touch locationInView:self];
    CGPoint prePoint = [touch previousLocationInView:self];
    if (currentPoint.x == prePoint.x && currentPoint.y == prePoint.y) {
        NSLog(@"dragButton按钮并没有拖动。");
        if (self.clickBlock) {
            self.clickBlock(self);
        }
    }
}
@end
