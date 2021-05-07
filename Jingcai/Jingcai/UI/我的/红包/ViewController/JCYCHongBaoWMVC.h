//
//  JCYCHongBaoWMVC.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/3/30.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "WMPageController.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCYCHongBaoWMVC : WMPageController

@property (nonatomic,copy) void(^JCBlock)(void);

@end

NS_ASSUME_NONNULL_END
