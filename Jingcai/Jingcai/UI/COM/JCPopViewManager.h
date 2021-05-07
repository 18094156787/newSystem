//
//  JCPopViewManager.h
//  Jingcai
//
//  Created by Administrator on 2019/4/11.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface JCPopViewManager : NSObject
+ (instancetype)shareManager;
- (void)autoCheckUpdate;
- (void)manualCheckUpdate;
@end
NS_ASSUME_NONNULL_END
