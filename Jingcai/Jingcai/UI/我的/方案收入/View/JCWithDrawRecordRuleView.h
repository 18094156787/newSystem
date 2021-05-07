//
//  JCWithDrawRecordRuleView.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/24.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCWithDrawRecordRuleView : JCBaseView<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic,strong) UIButton *sureBtn;

@property (nonatomic,strong) NSArray *titleArray;

@property (nonatomic,strong) NSArray *contentArray;



@end

NS_ASSUME_NONNULL_END
