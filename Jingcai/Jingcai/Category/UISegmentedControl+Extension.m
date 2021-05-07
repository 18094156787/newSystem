//
//  UISegmentedControl+Extension.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/10/23.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "UISegmentedControl+Extension.h"

@implementation UISegmentedControl (Extension)
- (void)setTintColor:(UIColor*)tintColor normalColor:(UIColor*)normalColor{

        if(@available(iOS 13.0, *)) {

            UIImage*tintColorImage = [self imageWithColor:tintColor];

            // Must set the background image for normal to something (even clear) else the rest won't work

            [self setBackgroundImage:[self imageWithColor:self.backgroundColor ? self.backgroundColor : [UIColor clearColor]] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];

           [self setBackgroundImage:tintColorImage forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];

            [self setBackgroundImage:[self imageWithColor:[tintColor colorWithAlphaComponent:0.2]] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];

            [self setBackgroundImage:tintColorImage forState:UIControlStateSelected|UIControlStateSelected barMetrics:UIBarMetricsDefault];

            [self setTitleTextAttributes:@{NSForegroundColorAttributeName: normalColor} forState:UIControlStateNormal];

            [self setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateSelected];

            [self setDividerImage:tintColorImage forLeftSegmentState:UIControlStateNormal rightSegmentState:UIControlStateNormal barMetrics:UIBarMetricsDefault];

            self.layer.borderWidth=1;

            self.layer.borderColor= [tintColor CGColor];

        }else{

            self.tintColor= tintColor;

        }



}

- (UIImage*)imageWithColor: (UIColor*)color {

    CGRect rect =CGRectMake(0.0f,0.0f,1.0f,1.0f);

    UIGraphicsBeginImageContext(rect.size);

    CGContextRef context = UIGraphicsGetCurrentContext();

    CGContextSetFillColorWithColor(context, [color CGColor]);

    CGContextFillRect(context, rect);

    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();

    UIGraphicsEndImageContext();

    return theImage;

}

@end
