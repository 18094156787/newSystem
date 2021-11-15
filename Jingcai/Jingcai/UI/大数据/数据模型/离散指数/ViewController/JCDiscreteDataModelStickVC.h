//
//  JCDiscreteDataModelStickVC.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/11.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "WMStickyPageController.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCDiscreteDataModelStickVC : WMStickyPageController

@property (nonatomic, assign) CGFloat viewTop;

@property (nonatomic, strong) NSString *model_id;//模型id

@end

NS_ASSUME_NONNULL_END
