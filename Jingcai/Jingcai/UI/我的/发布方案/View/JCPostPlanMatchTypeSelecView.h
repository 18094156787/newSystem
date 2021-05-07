//
//  JCPostPlanMatchTypeSelecView.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/11/4.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseView.h"
#import "JCPostCheckArticleVC.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCPostPlanMatchTypeSelecView : JCBaseView

@property (nonatomic,strong) UILabel *fbCountLab;//剩余可发布次数

@property (nonatomic,assign) BOOL isAddArticle;//审核认证,添加原创帖

@property (nonatomic,copy) void(^JCPushVCBlick)(NSString *type);

@end

NS_ASSUME_NONNULL_END
