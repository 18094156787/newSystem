//
//  JNMatchSJAgainstDataVC.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/17.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewController.h"
#import "JCWMatchBall.h"
#import "JCDataModelTitleModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JNMatchSJAgainstDataVC : JCBaseTableViewController

@property (nonatomic,strong) JCMatchBall *matchBall;

@property (nonatomic,strong) JCDataModelTitleModel *titleModel;


@end

NS_ASSUME_NONNULL_END
