//
//  JCPostPlanMatchTypeSelectVC.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/4/8.
//  Copyright © 2020 jingcai. All rights reserved.
//

#import "JCBaseViewController.h"
#import "JCPostCheckArticleVC.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCPostPlanMatchTypeSelectVC : JCBaseViewController

@property (nonatomic,assign) BOOL isAddArticle;//审核认证,添加原创帖

@property (nonatomic,copy) void(^JCPushVCBlick)(NSString *type);

@end

NS_ASSUME_NONNULL_END
