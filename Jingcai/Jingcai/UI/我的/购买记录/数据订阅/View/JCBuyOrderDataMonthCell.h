//
//  JCBuyOrderDataMonthCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/27.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCMyBuyOrderDataModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCBuyOrderDataMonthCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UILabel *titleInfoLab;

@property (nonatomic,strong) UILabel *timeLab;

@property (nonatomic,strong) UIView *bgView;

@property (nonatomic,strong) UIImageView *headImgView;

@property (nonatomic,strong) UILabel *contentLab;

@property (nonatomic,strong) UILabel *countLab;//购买人数

@property (nonatomic,strong) UILabel *priceLab;

@property (nonatomic,strong) UILabel *orderDetailLab;

@property (nonatomic,strong) JCMyBuyOrderDataModel *model;

@end

NS_ASSUME_NONNULL_END
