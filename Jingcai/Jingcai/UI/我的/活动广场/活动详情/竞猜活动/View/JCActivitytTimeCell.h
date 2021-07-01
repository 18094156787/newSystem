//
//  JCActivitytTimeCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/3/25.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCActivityDetailModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCActivitytTimeCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UIView *timeBgView;

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UILabel *timeLab;

@property (nonatomic,strong) UIImageView *timeBackView;

@property (nonatomic,strong) JCActivityDetailModel *detailModel;

@property (nonatomic,strong) UIImage *kindImageView;

@end

NS_ASSUME_NONNULL_END
