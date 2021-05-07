//
//  JCJingCaiAIHomeVC.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/24.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCJingCaiAIHomeVC : JCBaseTableViewController

@property (nonatomic,strong) UIView *contentView;

//type  0在售 1历史
@property (nonatomic,strong) NSString *type;

//2 让球 3进球数 不传 展示 全部 默认全部
@property (nonatomic,strong) NSString *classfly;//

@end

NS_ASSUME_NONNULL_END
