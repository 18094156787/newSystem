//
//  JCKindCompleteUserCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/5/31.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCKindUserCompleteModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCKindCompleteUserCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UIImageView *headImgView;

@property (nonatomic,strong) UILabel *nameLab;

@property (nonatomic,strong) UILabel *statusLab;

@property (nonatomic,strong) JCKindUserCompleteModel *model;

@end

NS_ASSUME_NONNULL_END
