//
//  JCActivityKindUserVC.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/5/28.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseTableViewController.h"
#import "JXCategoryListContainerView.h"
#import "JCActivityDetailModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCActivityKindUserVC : JCBaseTableViewController

@property (nonatomic,strong) NSString *actID;

@property (nonatomic, copy) void(^JCHeightBlock)(float heihgt);

@property (nonatomic, assign) float contentHeight;

@property (nonatomic,strong) JCActivityDetailModel *detailModel;

@end

NS_ASSUME_NONNULL_END
