//
//  JCColumnDetailZhanjiChartCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/10/19.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCColumnDetailZhanjiChartCell : JCBaseTableViewCell_New

@property (nonatomic,strong) NSArray *dataArray;

@property (nonatomic,strong) UIView *bgView;

@property (nonatomic,strong) UIView *chartBgView;

@property (nonatomic,strong) UILabel *showLab;

@end

NS_ASSUME_NONNULL_END
