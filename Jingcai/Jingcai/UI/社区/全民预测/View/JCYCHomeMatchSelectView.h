//
//  JCYCHomeMatchSelectView.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/4/15.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseView.h"
#import "JCEventInfoModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCYCHomeMatchSelectView : JCBaseView<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property(nonatomic,strong) NSArray *dataArray;

@property(nonatomic,strong) UIView *bgView;

@property(nonatomic,copy) void(^JCTitleBlock)(JCEventInfoModel *model);

- (void)show;

@end

NS_ASSUME_NONNULL_END
