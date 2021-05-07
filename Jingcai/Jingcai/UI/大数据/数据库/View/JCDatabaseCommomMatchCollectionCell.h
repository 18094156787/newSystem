//
//  JCDatabaseCommomMatchCollectionCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/3.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseCollectionViewCell_New.h"
#import "JCDataBaseMatchModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCDatabaseCommomMatchCollectionCell : JCBaseCollectionViewCell_New

@property (nonatomic,strong) UIImageView *iconImgView;

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) JCDataBaseMatchModel *model;

@end

NS_ASSUME_NONNULL_END
