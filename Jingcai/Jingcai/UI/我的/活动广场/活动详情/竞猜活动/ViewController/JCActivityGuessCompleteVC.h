//
//  JCActivityGuessCompleteVC.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/5/26.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseTableViewController.h"
#import "JCActivityOptionModel.h"
#import "JCActivityDetailModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCActivityGuessCompleteVC : JCBaseTableViewController

@property (nonatomic,strong) NSString *actID;

@property (nonatomic,assign) BOOL is_spf;//胜平负类型的竞猜活动

@property (nonatomic,strong) JCActivityOptionModel *selectOptionModel;

@end

NS_ASSUME_NONNULL_END
