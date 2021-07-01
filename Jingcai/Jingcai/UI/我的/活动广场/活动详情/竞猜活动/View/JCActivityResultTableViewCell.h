//
//  JCActivityResultTableViewCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/3/25.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCActivityOptionModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCActivityResultTableViewCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UIImageView *headImgView;

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UILabel *infoLab;

@property (nonatomic,strong) JCActivityOptionModel *model;


@end

NS_ASSUME_NONNULL_END
