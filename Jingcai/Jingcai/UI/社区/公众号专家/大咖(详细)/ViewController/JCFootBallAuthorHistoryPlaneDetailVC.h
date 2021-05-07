//
//  JCFootBallAuthorHistoryPlaneDetailVC.h
//  Jingcai
//
//  Created by 陈继伟 on 2019/8/9.
//  Copyright © 2019年 blockstar. All rights reserved.
//

#import "JCBaseTableViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCFootBallAuthorHistoryPlaneDetailVC : JCBaseTableViewController

@property (nonatomic,copy) NSString *expertID;

@property (nonatomic,copy) NSString *type;//公众号方案类型 1表示最新的 2表示历史的 3表示免费的 4表示干货 


@end

NS_ASSUME_NONNULL_END
