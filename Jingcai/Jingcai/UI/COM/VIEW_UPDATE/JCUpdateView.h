//
//  JCUpdateView.h
//  Jingcai
//
//  Created by Rain on 2018/10/11.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "JCBaseAlertView.h"
#import "JCUpdateBall.h"

typedef void (^UpdateClickBlock)(NSString * _Nullable link);

NS_ASSUME_NONNULL_BEGIN
@interface JCUpdateView : JCBaseAlertView
@property (nonatomic, strong) JCUpdateBall * updateBall;
@property (assign, nonatomic) UpdateClickBlock updateClickBlock;
@end
NS_ASSUME_NONNULL_END
