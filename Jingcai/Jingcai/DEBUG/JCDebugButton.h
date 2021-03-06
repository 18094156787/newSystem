//
//  JCDebugButton.h
//  Jingcai
//
//  Created by Administrator on 2019/4/12.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface JCDebugButton : UIButton
typedef void (^JCDebugButtonClickBlock)(JCDebugButton * debugButton);
@property (copy, nonatomic) JCDebugButtonClickBlock clickBlock;
@end
NS_ASSUME_NONNULL_END
