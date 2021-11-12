//
//  JCDiscreteDataModelTrackView.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/11.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseView.h"
#import "JCDiscreteDataModelTrackViewCell.h"
#import "JCDiscreteDataModelTrackTitleView.h"
#import "JCDiscreteDataModelTrackRateCell.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCDiscreteDataModelTrackView : JCBaseView<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic,strong) UIView *bgView;

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *dataArray;

- (void)show;

- (void)hide;

@end

NS_ASSUME_NONNULL_END
