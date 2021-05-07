//
//  JCYCExpertYcRecordCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/4/21.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCMyZhanJiModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCYCExpertYcRecordCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UILabel *timeLab;

@property (nonatomic,strong) UILabel *infoLab;

@property (nonatomic,strong) UILabel *priceLab;

@property (nonatomic,strong) UILabel *contentLab;

@property (nonatomic,strong) JCMyZhanJiModel *model;

@end

NS_ASSUME_NONNULL_END
