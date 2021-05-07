//
//  JCPostPlanCommonCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2019/12/26.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCPostPlanItemModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCPostPlanCommonCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UILabel *priceLab;

@property (nonatomic,strong) UIButton *priceBtn;

@property (nonatomic,strong) UIButton *chooseBtn;

@property (nonatomic,strong) UISwitch *switchBtn;

@property (nonatomic,strong) UIImageView *imgView;

@property (nonatomic,strong) UIView *lineView;

@property (nonatomic,strong) JCPostPlanItemModel *model;

@property (nonatomic,strong) JCPostPlanItemModel *sfModel;//收费

@property (nonatomic,strong) NSArray *dataArray;

@end

NS_ASSUME_NONNULL_END
