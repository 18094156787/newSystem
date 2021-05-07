//
//  JCNavButton.m
//  Jingcai
//
//  Created by Administrator on 2019/2/15.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCNavButton.h"
#import "JCWConvertTool.h"

@interface JCNavButton ()
@property (nonatomic, strong) UIImage * foreImage;
@end

@implementation JCNavButton
- (void)setNavButtonType:(JCNavButtonType)navButtonType {
    _navButtonType = navButtonType;
    UIImage * foreImage = self.foreImage;
    CGFloat maxLen = MAX(foreImage.size.width, foreImage.size.height);
    if (maxLen < 44) {
        foreImage = [JCWConvertTool scaleImage:foreImage toSize:CGSizeMake(44, 44)];
    }
    [self setImage:foreImage forState:UIControlStateNormal];
    [self setImage:foreImage forState:UIControlStateHighlighted];
//    if (navButtonType == JCNavButtonTypeNone) {
//        UIImage * foreImage = nil;
//        [self setImage:foreImage forState:UIControlStateNormal];
//    }
//    if (navButtonType == JCNavButtonTypeBack) {
//        UIImage * foreImage = [UIImage imageNamed:@"common_title_back"];
//        [self setImage:foreImage forState:UIControlStateNormal];
//    }
}
- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    CGFloat imageW = self.foreImage.size.width;
    CGFloat imageH = self.foreImage.size.height;
    CGFloat selfH = self.bounds.size.height;
    return CGRectMake(4, (selfH-imageH)/2, imageW, imageH);
}
- (UIImage *)foreImage {
    if (self.navButtonType == JCNavButtonTypeBack) {
        UIImage * backImage = [UIImage imageNamed:@"common_title_back_black_bold"];
        return backImage;
//        CGFloat maxLen = MAX(backImage.size.width, backImage.size.height);
//        if (maxLen < 44) {
//            return [JCWConvertTool scaleImage:backImage toSize:CGSizeMake(44, 44)];
//        }
//        return backImage;
    }
        if (self.navButtonType == JCNavButtonTypeWhite) {
            UIImage * backImage = [UIImage imageNamed:@"common_title_back_white_bold"];
            return backImage;
        }
    return nil;
}
@end
