//
//  JCColumnDetailWMViewController.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/10/18.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "WMStickyPageController.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCColumnDetailWMViewController : WMStickyPageController

@property (nonatomic, assign) CGFloat viewTop;

@property (nonatomic,copy) NSString *column_id;

@end

NS_ASSUME_NONNULL_END
