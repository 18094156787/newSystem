//
//  UIImage+Corner.h
//  Jingcai
//
//  Created by Rain on 2018/11/4.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Corner)

- (UIImage *)imageWithCornerRadius:(CGFloat)radius;
- (UIImage *)addCornerRadius:(CGFloat)radius size:(CGSize)size;
//- (UIImage *)addCornerRadius:(CGFloat)radius;
@end

NS_ASSUME_NONNULL_END
