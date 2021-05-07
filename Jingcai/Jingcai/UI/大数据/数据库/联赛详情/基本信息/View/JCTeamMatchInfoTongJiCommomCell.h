//
//  JCTeamMatchInfoTongJiCommomCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/7.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCTeamMatchBaseInfoModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCTeamMatchInfoTongJiCommomCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UILabel *numberLab;

@property (nonatomic,strong) JCTeamMatchBaseInfoModel *model;

@end

NS_ASSUME_NONNULL_END
