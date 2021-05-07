//
//  JCFreeView.h
//  Jingcai
//
//  Created by Administrator on 2019/4/11.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCBaseAlertView.h"

typedef void(^JCFreeViewUseClickBlock)(void);
typedef void(^JCFreeViewCloseClickBlock)(void);

NS_ASSUME_NONNULL_BEGIN
@interface JCFreeView : JCBaseAlertView
@property (nonatomic, copy) JCFreeViewUseClickBlock useClickBlock;
@property (nonatomic, copy) JCFreeViewCloseClickBlock closeClickBlock;
@end
NS_ASSUME_NONNULL_END
