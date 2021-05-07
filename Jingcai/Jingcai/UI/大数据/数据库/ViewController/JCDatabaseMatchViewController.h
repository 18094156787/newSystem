//
//  JCDatabaseMatchViewController.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/6.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewController.h"
#import "JCDataBaseAreaModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCDatabaseMatchViewController : JCBaseTableViewController

@property (nonatomic,strong) NSString *titleName;

@property (nonatomic,strong) NSString *imgName;

@property (nonatomic,strong) JCDataBaseAreaModel *model;

@end

NS_ASSUME_NONNULL_END
