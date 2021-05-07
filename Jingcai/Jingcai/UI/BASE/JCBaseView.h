//
//  JCBaseView.h
//  Jingcai
//
//  Created by Rain on 2018/10/8.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^JCViewNeedReturnHeightBlock)(CGFloat contentH);

NS_ASSUME_NONNULL_BEGIN
@interface JCBaseView : UIView
@property (nonatomic, copy) JCViewNeedReturnHeightBlock needReturnHeightBlock;
+ (instancetype)viewFromXib;
- (void)initViews;
- (void)data;
- (CGFloat)contentH;
- (void)presentLogin;

@end
NS_ASSUME_NONNULL_END
