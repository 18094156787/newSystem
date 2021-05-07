//
//  JCPostPlanSelectView.h
//  Jingcai
//
//  Created by 陈继伟 on 2019/12/26.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCPostPlanSelectView : JCBaseView<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property(nonatomic,strong) NSArray *dataArray;

@property(nonatomic,strong) UIView *bgView;

@property(nonatomic,copy) void(^JCTitleBlock)(NSString *title,NSString *titleInfo,NSString *match_num);

- (void)show;

@end

NS_ASSUME_NONNULL_END
