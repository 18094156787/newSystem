//
//  JCColumnDetailYushowStatusCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/10/18.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCLastColumnModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCColumnDetailYushowStatusCell : JCBaseTableViewCell_New

@property (nonatomic,strong)UIView *bgView;

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UILabel *dateLab;

@property (nonatomic,strong) UILabel *introduceLab;

@property (nonatomic,strong) UIView *botomView;

@property (nonatomic,strong) UILabel *infoLab;

@property (nonatomic,strong) UILabel *rateLab;

@property (nonatomic,strong) UIScrollView *scrollowView;

@property (nonatomic,strong) UIView *yushowView;

@property (nonatomic,strong) CAGradientLayer *gradientLayelayer;

@property (nonatomic,copy) void(^JCBlock)(void);



@property (nonatomic,strong) JCLastColumnModel *model;

@end

NS_ASSUME_NONNULL_END
