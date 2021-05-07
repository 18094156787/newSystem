//
//  JCDatabaseMatchCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/6.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCDataBaseMatchModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCDatabaseMatchCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UIImageView *iconImgView;

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) JCDataBaseMatchModel *model;
@end

NS_ASSUME_NONNULL_END
