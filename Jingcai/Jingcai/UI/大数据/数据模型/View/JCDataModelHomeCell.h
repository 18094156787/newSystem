//
//  JCDataModelHomeCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/9.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCDataModelModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCDataModelHomeCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UIImageView *imgView;

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UILabel *contentLab;

@property (nonatomic,strong) UILabel *countLab;

@property (nonatomic,strong) UILabel *priceLab;

@property (nonatomic,strong) UIButton *buyBtn;

@property (nonatomic,strong) JCDataModelModel *model;

@end

NS_ASSUME_NONNULL_END
