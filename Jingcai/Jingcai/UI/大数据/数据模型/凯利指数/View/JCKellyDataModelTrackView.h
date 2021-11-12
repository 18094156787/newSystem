//
//  JCKellyDataModelTrackView.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/12.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCKellyDataModelTrackView : JCBaseView<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic,strong) UIView *bgView;

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *dataArray;

- (void)show;

- (void)hide;

@end

NS_ASSUME_NONNULL_END
