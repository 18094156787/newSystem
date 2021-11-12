//
//  JCDataModelDateCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/9.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseCollectionViewCell_New.h"
#import "JCMatchTimeModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCDataModelDateCell : JCBaseCollectionViewCell_New

@property (nonatomic, strong) UIView *bgVew;

@property (nonatomic, strong) UILabel *dateLab;

@property (nonatomic, strong) UILabel *weekLab;

@property (nonatomic, strong) UILabel *todayLab;

@property (nonatomic, assign) BOOL clearBg;//未选中时是否为透明底

@property (nonatomic, strong) JCMatchTimeModel *model;

@end

NS_ASSUME_NONNULL_END
