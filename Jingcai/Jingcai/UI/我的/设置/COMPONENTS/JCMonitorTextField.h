//
//  JCMonitorTextField.h
//  Jingcai
//
//  Created by Rain on 2018/11/14.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import <UIKit/UIKit.h>

//监听控件文本变化
typedef void (^MonitorTextBlock)(BOOL isEmpty);

NS_ASSUME_NONNULL_BEGIN

@interface JCMonitorTextField : UITextField
@property (copy, nonatomic) MonitorTextBlock monitorTextBlock;
@property (assign, nonatomic) IBInspectable CGFloat leftPadding;
@property (assign, nonatomic) IBInspectable CGFloat rightPadding;
@end

NS_ASSUME_NONNULL_END
