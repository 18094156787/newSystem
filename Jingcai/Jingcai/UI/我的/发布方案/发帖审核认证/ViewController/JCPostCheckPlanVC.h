//
//  JCPostCheckPlanVC.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/8/25.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewController.h"
#import "JCMyPostPlanModel.h"
#import "JCPostCheckArticleVC.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCPostCheckPlanVC : JCBaseTableViewController

@property (nonatomic,strong) NSString *type;//类型0，1 竞足 2 让球 3进球数

@property (nonatomic,strong) NSString *lastType;//上一次选择的类型

@property (nonatomic,strong) JCMyPostCheckTuiJianModel *model;

@property (nonatomic,assign) BOOL isAddArticle;//审核认证,添加原创帖

@property (nonatomic,copy) void(^JCDataBlock)(JCMyPostCheckTuiJianModel *model);

@property (nonatomic,strong) JCPostCheckArticleVC *checkVC;

@property (nonatomic,strong) NSString  *tuijian_id;

@end

NS_ASSUME_NONNULL_END
