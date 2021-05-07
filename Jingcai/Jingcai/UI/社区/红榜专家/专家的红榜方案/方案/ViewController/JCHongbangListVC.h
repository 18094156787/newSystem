//
//  JCHongbangListVC.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/5/19.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCHongbangListVC : JCBaseTableViewController

@property (nonatomic,copy) NSString *autherID;

@property (nonatomic,assign) BOOL isMine;//yes表示个人的信息页面

@end

NS_ASSUME_NONNULL_END
