//
//  JCActivityPrizeShowView.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/3/24.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseView.h"
#import "JCActivityDetailModel.h"
#import "JCActivityGoodsTitleModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCActivityPrizeShowView : JCBaseView<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic,strong) UIView *bgView;

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UIButton *sureBtn;

@property (nonatomic,strong) JCActivityDetailModel *detailModel;

@property (nonatomic,strong) NSArray *dataArray;

@property (nonatomic,strong) NSMutableArray *dataSource;

@property (nonatomic,strong) JCActivityGoodsTitleModel *titleModel;

@end

NS_ASSUME_NONNULL_END
