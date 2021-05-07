//
//  JNTabBarMainButton.m
//  Jingcai
//
//  Created by Administrator on 2019/6/4.
//  Copyright © 2019 jingcai. All rights reserved.
//

#import "JNTabBarMainButton.h"
//#import "JCWConvertTool.h"

@interface JNTabBarMainButton ()
@property (nonatomic, strong) UIView * circleView;

@property (strong, nonatomic) NSArray * shakeArray;
@end

@implementation JNTabBarMainButton
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.adjustsImageWhenHighlighted = NO;
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:10];
        //字体颜色#8E8E93
        [self setTitleColor:UIColorFromRGB(0x8E8E93) forState:UIControlStateNormal];
        [self setTitleColor:UIColorFromRGB(0xFF0000) forState:UIControlStateSelected];
        
//        [self addSubview:self.circleView];
        [self addSubview:self.iconImageView];
        
//        self.iconImageView.image = [UIImage imageNamed:@"tabShake1"];
        self.iconImageView.image = [UIImage imageNamed:@"tabicon_sq"];
        
//        self.circleView.backgroundColor = [UIColor whiteColor];
//        self.circleView.layer.cornerRadius = 26;
        
//                self.circleView.layer.shadowOffset = CGSizeZero;
//                self.circleView.layer.shadowRadius = 5;
//                self.circleView.layer.shadowColor = [UIColor darkGrayColor].CGColor;
//                self.circleView.layer.shadowOpacity = 0.5;
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
//        [self.iconImageView.layer addAnimation:animation forKey:nil];
//    }
//}
- (void)layoutSubviews {
    [super layoutSubviews];
    [self layoutIfNeeded];
    CGFloat selfW = self.bounds.size.width;
    //圆形View大小 和 Button按钮
    CGFloat circleLen = 52;
    CGFloat imageLen = 48;
    self.circleView.frame = CGRectMake((selfW-circleLen)/2, 8, circleLen, circleLen);
    self.iconImageView.frame = CGRectMake((selfW-imageLen)/2, 15, imageLen, imageLen);
}
- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    contentRect.origin.x = (self.bounds.size.width-52)/2;
    contentRect.origin.y = -26;
    contentRect.size.width = 52;
    contentRect.size.height = 52;
    return contentRect;
}
- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    contentRect.origin.x = 0;
    contentRect.origin.y = 52+4;
    contentRect.size.width = self.bounds.size.width;
    contentRect.size.height = 20;
    return contentRect;
}

#pragma mark -
- (void)setTitle:(NSString *)title {
    _title = title;
    [self setTitle:title forState:UIControlStateNormal];
}
- (void)setNormalImage:(NSString *)normalImage {
    _normalImage = normalImage;
    self.iconImageView.image = [UIImage imageNamed:normalImage];
}
- (void)setSelectImage:(NSString *)selectImage {
    _selectImage = selectImage;
    self.iconImageView.image = [UIImage imageNamed:selectImage];
    //[JCWConvertTool scaleImage:[UIImage imageNamed:selectImage] toSize:CGSizeMake(25, 25)];
}
- (UIView *)circleView {
    if (!_circleView) {
        _circleView = [[UIView alloc] init];
    }
    return _circleView;
}
- (UIImageView *)iconImageView {
    if (!_iconImageView) {
        _iconImageView = [UIImageView new];
        _iconImageView.contentMode = UIViewContentModeScaleAspectFit;
        _iconImageView.animationRepeatCount = 2;
        _iconImageView.animationDuration = 1.5;
        
    }
    return _iconImageView;
}

@end
