//
//  JCActivityKindScoreShowView.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/6/3.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseView.h"
#import "JCKindScoreItemCell.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCActivityKindScoreShowView : JCBaseView<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property(nonatomic,strong) NSArray *dataArray;

@property(nonatomic,strong) UIView *bgView;

- (void)show;

@end

NS_ASSUME_NONNULL_END
