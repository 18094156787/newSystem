//
//  JCKindScoreItemCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/5/31.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCKindGetScoreModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCKindScoreItemCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UILabel *contentLab;

@property (nonatomic,strong) JCKindGetScoreModel *model;

@end

NS_ASSUME_NONNULL_END
