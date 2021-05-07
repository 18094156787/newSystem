//
//  JCPlaneDetailNewMatchCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/12/18.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCGZHTuiJianModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCPlaneDetailNewMatchCell : JCBaseTableViewCell_New<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) JCGZHTuiJianModel *tjModel;

@end

NS_ASSUME_NONNULL_END
