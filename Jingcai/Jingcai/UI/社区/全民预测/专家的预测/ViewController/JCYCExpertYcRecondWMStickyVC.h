//
//  JCYCExpertYcRecondWMStickyVC.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/10/29.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "WMStickyPageController.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCYCExpertYcRecondWMStickyVC : WMStickyPageController

@property (nonatomic, assign) CGFloat viewTop;

@property (nonatomic, strong) NSString *type;//type=2是上周的预测历史

@property (nonatomic, strong) NSString *expertID;

@end

NS_ASSUME_NONNULL_END
