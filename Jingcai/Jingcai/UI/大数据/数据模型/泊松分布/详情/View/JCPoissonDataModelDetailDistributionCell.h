//
//  JCPoissonDataModelDetailDistributionCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/11.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCPoissonDataModelDetailDistributionCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UILabel *typeLab;

@property (nonatomic,strong) UILabel *oneLab;

@property (nonatomic,strong) UILabel *twoLab;

@property (nonatomic,strong) UILabel *threeLab;

@property (nonatomic,strong) UIView *lineView;

@property (nonatomic,strong) NSArray *bf_array;

@property (nonatomic,strong) NSArray *jqs_array;
@end

NS_ASSUME_NONNULL_END
