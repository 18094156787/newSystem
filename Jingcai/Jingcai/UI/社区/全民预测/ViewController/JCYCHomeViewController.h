//
//  JCYCHomeViewController.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/3/27.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewController.h"
#import "JCYCCountHeadView.h"
#import "JCYuceSettingModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCYCHomeViewController : JCBaseTableViewController

@property (nonatomic,copy) void(^JCBlock)(NSArray *array);

@property (nonatomic,strong) JCYCCountHeadView *headView;

@property (nonatomic,strong)JCYuceSettingModel *settingModel;

@property (nonatomic,copy) void(^JCEndRefreshBlock)(void);

@property (nonatomic,assign) BOOL hideShowInfo;//是否有展示选中比赛




@end

NS_ASSUME_NONNULL_END
