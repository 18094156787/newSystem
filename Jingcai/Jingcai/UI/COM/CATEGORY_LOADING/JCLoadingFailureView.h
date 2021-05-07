//
//  JCLoadingFailureView.h
//  Jingcai
//
//  Created by Administrator on 2019/2/13.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCBaseView.h"
typedef void(^JCLoadingFailureViewRetryBlock)(void);

NS_ASSUME_NONNULL_BEGIN
@interface JCLoadingFailureView : JCBaseView
@property (nonatomic, copy) JCLoadingFailureViewRetryBlock failureViewRetryBlock;
@end
NS_ASSUME_NONNULL_END
