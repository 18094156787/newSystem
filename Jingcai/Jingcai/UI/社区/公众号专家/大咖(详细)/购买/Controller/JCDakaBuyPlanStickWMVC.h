//
//  JCDakaBuyPlanStickWMVC.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/5/18.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "WMStickyPageController.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCDakaBuyPlanStickWMVC : WMStickyPageController

@property (nonatomic, assign) CGFloat viewTop;

@property (nonatomic,strong) JCWTjInfoBall *payInfoModel;

@property (nonatomic,strong) NSString *autherID;

@property (nonatomic,strong) NSArray *hongbaoArray;

@end

NS_ASSUME_NONNULL_END
