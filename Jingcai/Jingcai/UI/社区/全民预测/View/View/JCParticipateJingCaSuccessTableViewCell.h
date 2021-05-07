//
//  JCParticipateJingCaSuccessTableViewCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2019/10/16.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCParticipateJingCaSuccessCell.h"
#import "JCJingCaiResultMatchModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCParticipateJingCaSuccessTableViewCell : JCBaseTableViewCell_New<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic,strong) UILabel *infoLab;

@property (nonatomic,strong) JCJingCaiResultMatchModel *model;

@end

NS_ASSUME_NONNULL_END
