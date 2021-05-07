//
//  JCMatchFilterVC.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/6/16.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCMatchFilterVC : JCBaseTableViewController

@property (nonatomic,assign) NSInteger type;//0赛程 1进行中 2完场 不传默认0

@property (nonatomic,assign) NSInteger selectIndex;

@property (nonatomic,strong) NSArray *dataSource;

@property(nonatomic,strong) NSMutableArray * dataArr;

@property (nonatomic,strong) NSString *time;//塞选日期

@property (nonatomic,copy) void(^JCSelectBlock)(NSInteger index);

- (void)selectAllWithStatus:(BOOL)select;

@property (nonatomic,assign) BOOL isSelectAll;//记录当前页面是否全选

- (void)resetData;

@end

NS_ASSUME_NONNULL_END
