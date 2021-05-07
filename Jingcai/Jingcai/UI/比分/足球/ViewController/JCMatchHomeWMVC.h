//
//  JCMatchHomeWMVC.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/6/16.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "WMPageController.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCMatchHomeWMVC : WMPageController

- (void)filterItemClick;

@property (nonatomic,copy) void(^JCIndexBlock)(int idex);

@end

NS_ASSUME_NONNULL_END
