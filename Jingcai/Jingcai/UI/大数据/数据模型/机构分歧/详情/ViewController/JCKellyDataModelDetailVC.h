//
//  JCKellyDataModelDetailVC.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/12.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseTableViewController.h"
#import "JCDataModelTitleModel.h"
#import "JCDataModelTitleModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCKellyDataModelDetailVC : JCBaseTableViewController

@property (nonatomic,assign) BOOL hidetopMatch;

@property (nonatomic,assign) BOOL isMatch;//标记联赛详情进来的

@property (nonatomic,strong) NSString *match_id;//比赛id

@property (nonatomic, strong) NSString *model_id;//模型id

@property (nonatomic,strong) JCDataModelTitleModel *titleModel;

@end

NS_ASSUME_NONNULL_END
