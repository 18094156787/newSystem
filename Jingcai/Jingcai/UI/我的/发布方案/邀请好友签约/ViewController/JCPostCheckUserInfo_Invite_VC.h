//
//  JCPostCheckUserInfo_Invite_VC.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/7/1.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseTableViewController.h"
#import "JCPostCheckArticle_Invite_VC.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCPostCheckUserInfo_Invite_VC : JCBaseTableViewController

@property (nonatomic,strong) JCPostCheckArticle_Invite_VC *checkVC;

@property (nonatomic,strong) NSString *applyID;//重新编辑申请的ID

@property (nonatomic,assign) BOOL isJingcai;//yes是有全民竞猜资格开放的,no是默认的需要2篇推荐贴

@end

NS_ASSUME_NONNULL_END
