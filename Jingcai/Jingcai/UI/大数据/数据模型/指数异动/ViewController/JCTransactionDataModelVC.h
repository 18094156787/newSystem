//
//  JCTransactionDataModelVC.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/12.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseTableViewController.h"
#import "JCKellyDataModelPayInfoModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCTransactionDataModelVC : JCBaseTableViewController

@property (nonatomic,strong) NSString *type;//0全部 1胜平负、2让球、3进球数

@property (nonatomic,strong)JCKellyDataModelPayInfoModel *buyInfoModel;

@property (nonatomic,copy) void(^JCOpenBlock)(void);

@property (nonatomic,copy) void(^JCRefreshBlock)(void);
@end

NS_ASSUME_NONNULL_END
