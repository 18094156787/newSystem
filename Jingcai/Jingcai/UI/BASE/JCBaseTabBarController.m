//
//  JCBaseTabBarController.m
//  Jingcai
//
//  Created by Rain on 2018/10/8.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "JCBaseTabBarController.h"

@interface JCBaseTabBarController ()

@end

@implementation JCBaseTabBarController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tabBar setBarTintColor:[UIColor whiteColor]];
    [self.tabBar setTintColor:UIColorFromRGB(0xFF0000)];
    [self.tabBar setTranslucent:NO];
    UIImage *colorImage = [self imageWithColor:UIColorFromRGB(0xF3F3F3) size:CGSizeMake(self.view.frame.size.width, 1)];
    [self.tabBar setBackgroundImage:[UIImage new]];
    [self.tabBar setShadowImage:colorImage];
}

#pragma mark -
- (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    if (!color || size.width <=0 || size.height <=0) return nil;
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size,NO, 0);
    CGContextRef context =UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image =UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
@end
