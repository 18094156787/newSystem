//
//  JCWConvertTool.h
//  Jingcai
//
//  Created by Rain on 2018/11/4.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JCWConvertTool : NSObject
//UIColor转UIImage
+ (UIImage *)createImageWithColor:(UIColor *)color;
//UIImage大小缩放
+ (UIImage *)scaleImage:(UIImage *)image toSize:(CGSize)size;
//UIColor转UIImage
+ (UIImage *)imageWithColor:(UIColor *)color;
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;
+ (UIImage *)imageByApplyingAlpha:(CGFloat)alpha image:(UIImage*)image;
@end

NS_ASSUME_NONNULL_END
