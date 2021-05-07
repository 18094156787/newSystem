//
//  JNMatchDetailZRCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/11/19.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCWMatchBall.h"
#import "JNMatchDetailZRTeamHeadView.h"
NS_ASSUME_NONNULL_BEGIN

@interface JNMatchDetailZRCell : JCBaseTableViewCell_New<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic,strong) UITableView *homeTableView;

@property (nonatomic,strong) UITableView *awayTableView;

@property (nonatomic,strong) JNMatchDetailZRTeamHeadView *homeHeadView;

@property (nonatomic,strong) JNMatchDetailZRTeamHeadView *awayHeadView;

@property (nonatomic, strong) NSArray * homeArr;

@property (nonatomic, strong) NSArray * awayArr;

@property (nonatomic, strong) JCMatchBall * matchBall;


@end

NS_ASSUME_NONNULL_END
