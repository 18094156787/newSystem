//
//  JCDatabaseAllMatchCollectionCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/9.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseCollectionViewCell.h"
#import "JCDataBaseAreaModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCDatabaseAllMatchCollectionCell : JCBaseCollectionViewCell

@property (nonatomic,strong) UIImageView *iconImgView;

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) JCDataBaseAreaModel *model;

@end

NS_ASSUME_NONNULL_END
