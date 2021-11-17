//
//  JCKellyDataModelVC.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/11.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseTableViewController.h"
#import "JCKellyDataModelOpenCell.h"
#import "JCKellyDataModelPayInfoModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCKellyDataModelVC : JCBaseTableViewController


@property (nonatomic,assign) BOOL isTop;

@property (nonatomic,strong) JCKellyDataModelPayInfoModel *buyInfoModel;

@property (nonatomic,strong) NSString *date;

@property (nonatomic,copy) void(^JCOpenBlock)(void);

@end

NS_ASSUME_NONNULL_END
