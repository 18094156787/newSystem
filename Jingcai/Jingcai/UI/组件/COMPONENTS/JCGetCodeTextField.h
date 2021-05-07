//
//  JCGetCodeTextField.h
//  Jingcai
//
//  Created by Rain on 2018/10/15.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JKCountDownButton.h"
typedef NS_ENUM(NSInteger, GetCodeButtonStyle) {
    GetCodeButtonStyleBlue,
    GetCodeButtonStyleRed
};
typedef void (^GetCodeClickBlock)(void);

NS_ASSUME_NONNULL_BEGIN

@interface JCGetCodeTextField : UITextField
@property (strong, nonatomic) JKCountDownButton * getCodeButton;
@property (copy, nonatomic) GetCodeClickBlock getCodeClickBlock;
@property (assign, nonatomic) GetCodeButtonStyle buttonStyle;
@property (assign, nonatomic) BOOL disableEdit;//不可编辑
- (void)startCountDown; //开始倒计时
- (void)stopCountDown;
@end

NS_ASSUME_NONNULL_END
