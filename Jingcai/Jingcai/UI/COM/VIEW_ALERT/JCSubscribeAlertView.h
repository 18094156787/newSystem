//
//  JCSubscribeAlertView.h
//  Jingcai
//
//  Created by Rain on 2018/10/10.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "JCBaseAlertView.h"

typedef void(^SubscribeConfirmBlock)(void); // 点击确定后的回调

NS_ASSUME_NONNULL_BEGIN
@interface JCSubscribeAlertView : JCBaseAlertView
@property (assign, nonatomic) BOOL isAdd;
@property (copy, nonatomic) SubscribeConfirmBlock confirmBlock;
@end
NS_ASSUME_NONNULL_END
