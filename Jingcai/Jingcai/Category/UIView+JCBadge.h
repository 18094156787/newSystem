//
//  UIView+JCBadge.h
//  Jingcai
//
//  Created by Administrator on 2019/4/4.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface UIView (JCBadge)
@property (nonatomic, strong) NSString * badgeStr;
- (void)removeBadgeLabel;
@end
NS_ASSUME_NONNULL_END
