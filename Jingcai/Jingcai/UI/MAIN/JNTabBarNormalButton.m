//
//  JNTabBarNormalButton.m
//  Jingcai
//
//  Created by Administrator on 2019/6/4.
//  Copyright © 2019 jingcai. All rights reserved.
//

#import "JNTabBarNormalButton.h"
//#import "JCWConvertTool.h"

@implementation JNTabBarNormalButton
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.adjustsImageWhenHighlighted = NO;
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont fontWithName:@"PingFang SC" size:10];
        //字体颜色#8E8E93
        [self setTitleColor:COLOR_1B1B1B forState:UIControlStateNormal];
        [self setTitleColor:COLOR_1B1B1B forState:UIControlStateSelected];
    }
    return self;
}
//- (void)setSelected:(BOOL)selected {
//    [super setSelected:selected];
//    if (selected) {
//        CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
//        animation.values = @[@1.0,@0.95,@0.90,@0.85,@0.90,@0.94,@0.97,@0.99,@1.0];
//        animation.duration = 0.2;
//        animation.calculationMode = kCAAnimationCubic;
//        [self.imageView.layer addAnimation:animation forKey:nil];
//    }
//}
- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    contentRect.origin.x = 0;
    contentRect.origin.y = 0;
    contentRect.size.width = self.bounds.size.width;
    contentRect.size.height = 25;
    return contentRect;
}
- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    contentRect.origin.x = 0;
    contentRect.origin.y = 25;
    contentRect.size.width = self.bounds.size.width;
    contentRect.size.height = self.bounds.size.height-25-4;
    return contentRect;
}

#pragma mark - setter
- (void)setTitle:(NSString *)title {
    _title = title;
    [self setTitle:title forState:UIControlStateNormal];
}
- (void)setNormalImage:(NSString *)normalImage {
    _normalImage = normalImage;
    [self setImage:JCIMAGE(normalImage) forState:UIControlStateNormal];
//    [self setImage:[JCWConvertTool renderImageWithImage:[UIImage imageNamed:normalImage] tintColor:UIColorFromRGB(0x8E8E93)] forState:UIControlStateNormal];
    
}
- (void)setSelectImage:(NSString *)selectImage {
    _selectImage = selectImage;
    [self setImage:JCIMAGE(selectImage) forState:UIControlStateSelected];
//    [self setImage:[JCWConvertTool renderImageWithImage:[UIImage imageNamed:selectImage] tintColor:UIColorFromRGB(0xFF0000)] forState:UIControlStateSelected];
}
@end
