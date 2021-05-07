//
//  JCTeamDetailPlayerTableView.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/23.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCTeamDetailPlayerTableView : JCBaseView<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong)  UIView *bgView;

@property (nonatomic, strong) UITableView *tableView;

@property(nonatomic,strong) NSArray *dataArray;

@end

NS_ASSUME_NONNULL_END
