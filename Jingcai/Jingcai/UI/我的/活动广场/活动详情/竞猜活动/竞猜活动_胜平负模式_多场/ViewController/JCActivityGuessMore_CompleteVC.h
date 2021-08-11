//
//  JCActivityGuessMore_CompleteVC.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/8/10.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseTableViewController.h"
#import "JCActivityOptionModel.h"
#import "JCActivityDetailModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCActivityGuessMore_CompleteVC : JCBaseTableViewController

@property (nonatomic,strong) NSString *actID;

@property (nonatomic,assign) BOOL is_spf;//胜平负类型的竞猜活动

@property (nonatomic,assign) BOOL is_more_spf;//多场胜平负类型的竞猜活动

@property (nonatomic,strong) JCActivityOptionModel *selectOptionModel;

@property (nonatomic,strong) NSArray *matchArray;

@end

NS_ASSUME_NONNULL_END
