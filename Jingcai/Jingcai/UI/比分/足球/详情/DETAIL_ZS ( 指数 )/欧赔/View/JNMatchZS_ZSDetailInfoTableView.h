//
//  JNMatchZS_ZSDetailInfoTableView.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/12.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseView.h"
#import "JNMatchZS_PLInfoModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JNMatchZS_ZSDetailInfoTableView : JCBaseView<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong)  UIView *bgView;

@property (nonatomic, strong) UITableView *tableView;

@property(nonatomic,strong) NSArray *dataArray;

@property(nonatomic,strong) NSArray *dataSource;

@property(nonatomic,strong) JNMatchZS_PLInfoModel *currentModel;

@end

NS_ASSUME_NONNULL_END
