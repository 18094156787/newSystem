//
//  JCMyBuyOrderTjDetailMatchCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/27.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCHongbangOrderDetailModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCMyBuyOrderTjDetailMatchCell : JCBaseTableViewCell_New<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) JCHongbangOrderDetailModel *detailModel;

@end

NS_ASSUME_NONNULL_END
