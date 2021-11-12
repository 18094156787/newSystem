//
//  JCTransactionDataModelDetailZhiShuCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/12.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCTransactionDataModelDetailZhiShuItemCell.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCTransactionDataModelDetailZhiShuCell : JCBaseTableViewCell_New
<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *dataArray;

@end

NS_ASSUME_NONNULL_END
