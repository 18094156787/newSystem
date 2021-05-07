//
//  JCYCCheckTableViewCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/4/15.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCYCResultModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCYCCheckTableViewCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UILabel *teamLab;

@property (nonatomic,strong) UILabel *infoLabel;

@property (nonatomic,strong) UILabel *infoLab;

@property (nonatomic,strong) JCYCResultModel *model;

@end

NS_ASSUME_NONNULL_END
