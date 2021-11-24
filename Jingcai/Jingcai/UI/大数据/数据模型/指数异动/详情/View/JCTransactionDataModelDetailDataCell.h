//
//  JCTransactionDataModelDetailDataCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/12.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCTransactionDataModelDetailDataInfoCell.h"
#import "JCTransactionDataModelDetailDataInfoHeadView.h"
#import "JCKellyDataDetailModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCTransactionDataModelDetailDataCell : JCBaseTableViewCell_New<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) JCTransactionDataModelDetailDataInfoHeadView *headView;

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *dataArray;

@property (nonatomic,strong) NSString *type;//0全部 1胜平负、2让球、3进球数

@property (nonatomic,strong) JCKellyDataDetailModel *detailModel;

@end

NS_ASSUME_NONNULL_END
