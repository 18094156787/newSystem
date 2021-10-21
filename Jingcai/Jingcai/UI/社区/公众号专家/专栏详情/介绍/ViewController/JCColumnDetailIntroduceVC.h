//
//  JCColumnDetailIntroduceVC.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/10/18.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseTableViewController.h"
#import "JCColumnDetailModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCColumnDetailIntroduceVC : JCBaseTableViewController

@property (nonatomic,copy) NSString *column_id;

@property (nonatomic,copy) void(^JCBlock)(JCColumnDetailModel *detailModel);

@end

NS_ASSUME_NONNULL_END
