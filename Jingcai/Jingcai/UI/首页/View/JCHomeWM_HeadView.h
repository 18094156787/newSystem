//
//  JCHomeWM_HeadView.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/24.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseView.h"
#import "JCHomeExpertTableViewCell.h"
#import "JCHomeMatchTableViewCell.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCHomeWM_HeadView : JCBaseView<SDCycleScrollViewDelegate,UITableViewDataSource, UITableViewDelegate>

@property (nonatomic,strong) SDCycleScrollView *cycleScrollView;//轮播

@property (nonatomic,strong) NSArray *bannerArray;

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic,strong) NSMutableArray *expertArray;//专家数据

@property (nonatomic,strong) NSMutableArray *matchArray;//比赛数据

@property (nonatomic,assign) NSInteger clickEnable;//可否点击 0 1可以点 2不能点

@property (nonatomic,strong) JCHomeExpertTableViewCell * expertCell;

@property (nonatomic,strong) JCHomeMatchTableViewCell * matchCell;


@end

NS_ASSUME_NONNULL_END
