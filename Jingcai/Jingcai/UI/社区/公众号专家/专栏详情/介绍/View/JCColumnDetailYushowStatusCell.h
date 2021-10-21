//
//  JCColumnDetailYushowStatusCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/10/18.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCColumnDetailYushowStatusCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UILabel *dateLab;

@property (nonatomic,strong) UILabel *introduceLab;

@property (nonatomic,strong) UILabel *infoLab;

@property (nonatomic,strong) UILabel *rateLab;

@property (nonatomic,strong) UIScrollView *scrollowView;

@property (nonatomic,copy) void(^JCBlock)(void);

@end

NS_ASSUME_NONNULL_END
