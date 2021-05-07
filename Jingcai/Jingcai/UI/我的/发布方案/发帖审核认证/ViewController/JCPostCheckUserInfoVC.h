//
//  JCPostCheckUserInfoVC.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/8/23.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewController.h"
#import "JCPostCheckArticleVC.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCPostCheckUserInfoVC : JCBaseTableViewController

@property (nonatomic,strong) JCPostCheckArticleVC *checkVC;

@property (nonatomic,strong) NSString *applyID;//重新编辑申请的ID

@property (nonatomic,assign) BOOL isJingcai;//yes是有全民竞猜资格开放的,no是默认的需要2篇推荐贴

@end

NS_ASSUME_NONNULL_END
