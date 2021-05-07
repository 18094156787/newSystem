//
//  JCTeamDetailBaseInfoCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/13.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCTeamMatchBaseInfoModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCTeamDetailBaseInfoCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UILabel *contentLab;

@property (nonatomic,strong) JCTeamMatchBaseInfoModel *model;

@end

NS_ASSUME_NONNULL_END
