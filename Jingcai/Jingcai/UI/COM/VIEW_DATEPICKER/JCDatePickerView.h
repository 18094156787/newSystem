//
//  JCDatePickerView.h
//  Jingcai
//
//  Created by Administrator on 2019/1/25.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCBaseAlertView.h"

typedef void(^JCDatePickerCompletionBlock)(NSDate * _Nullable date);

NS_ASSUME_NONNULL_BEGIN
@interface JCDatePickerView : JCBaseAlertView
@property (nonatomic, copy) JCDatePickerCompletionBlock completionBlock;
@property (nonatomic, strong) NSDate * date;
@end
NS_ASSUME_NONNULL_END
