//
//  JCColumnDetailYushowHotCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/10/18.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCPresellColumnModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCColumnDetailYushowHotCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UILabel *dateLab;

@property (nonatomic,strong) UILabel *introduceLab;

@property (nonatomic,copy) void(^JCBlock)(void);

@property (nonatomic,strong) JCPresellColumnModel *presellColumnModel;

@end

NS_ASSUME_NONNULL_END
