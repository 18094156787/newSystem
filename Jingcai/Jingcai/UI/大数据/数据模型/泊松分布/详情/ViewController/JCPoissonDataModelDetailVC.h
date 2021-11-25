//
//  JCPoissonDataModelDetailVC.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/10.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseTableViewController.h"
#import "JCDataModelTitleModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCPoissonDataModelDetailVC : JCBaseTableViewController

@property (nonatomic,assign) BOOL hidetopMatch;

@property (nonatomic,assign) BOOL isMatch;//标记联赛详情进来的

@property (nonatomic,strong) JCDataModelTitleModel *titleModel;

@property (nonatomic,strong) NSString *match_id;//比赛id

@property (nonatomic,strong) NSString *model_id;//

@end

NS_ASSUME_NONNULL_END
