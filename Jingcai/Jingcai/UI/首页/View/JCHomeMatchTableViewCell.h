//
//  JCHomeMatchTableViewCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/4/29.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCHomeMatchCollectionCell.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCHomeMatchTableViewCell : JCBaseTableViewCell_New<SDCycleScrollViewDelegate>

@property (nonatomic,strong) SDCycleScrollView *cycleScrollView;//轮播

@property (nonatomic,strong) NSArray *bannerArray;

@property (nonatomic,strong) NSArray *titleArray;

@property (nonatomic,assign) NSInteger clickEnable;//可否点击 1可以点 2不能点


@end

NS_ASSUME_NONNULL_END
