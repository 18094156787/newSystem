//
//  JCNavButton.h
//  Jingcai
//
//  Created by Administrator on 2019/2/15.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, JCNavButtonType) {
    JCNavButtonTypeNone,
    JCNavButtonTypeBack,
    JCNavButtonTypeWhite,
};

NS_ASSUME_NONNULL_BEGIN
@interface JCNavButton : UIButton
@property (nonatomic, assign) JCNavButtonType navButtonType;
@end
NS_ASSUME_NONNULL_END
