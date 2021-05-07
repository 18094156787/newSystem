//
//  UITextView+HintText.h
//  Jingcai
//
//  Created by Rain on 2018/11/22.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface UITextView (HintText) <UITextViewDelegate>
- (void)showHintText:(NSString *)hintText;
@end
NS_ASSUME_NONNULL_END
