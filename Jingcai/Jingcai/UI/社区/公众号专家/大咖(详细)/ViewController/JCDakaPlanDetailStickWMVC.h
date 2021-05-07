//
//  JCDakaPlanDetailStickWMVC.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/5/18.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "WMStickyPageController.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCDakaPlanDetailStickWMVC : WMStickyPageController

@property (nonatomic, assign) CGFloat viewTop;

@property (nonatomic,strong) NSString *autherID;

@property (nonatomic,strong) JCWTjInfoBall *planDetailModel;//方案详情

@end

NS_ASSUME_NONNULL_END
