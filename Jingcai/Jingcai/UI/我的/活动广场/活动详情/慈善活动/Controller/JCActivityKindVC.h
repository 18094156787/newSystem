//
//  JCActivityKindVC.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/5/28.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseTableViewController.h"
#import "JXCategoryListContainerView.h"
#import "JCActivityDetailModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCActivityKindVC : JCBaseTableViewController

@property (nonatomic,copy) void(^JCCancelBlock)(void);

@property (nonatomic,strong) NSString *actID;

@end

NS_ASSUME_NONNULL_END
