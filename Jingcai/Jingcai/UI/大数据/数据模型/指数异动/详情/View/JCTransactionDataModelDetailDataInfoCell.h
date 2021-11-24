//
//  JCTransactionDataModelDetailDataInfoCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/12.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCTransactionDataOddsChangeModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCTransactionDataModelDetailDataInfoCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic, strong) UILabel *windRateLab;

@property (nonatomic, strong) UILabel *equalRateLab;

@property (nonatomic, strong) UILabel *loseRateLab;

@property (nonatomic, strong) UIImageView *upImgView;

@property (nonatomic, strong) UIImageView *equalImgView;

@property (nonatomic, strong) UIImageView *downImgView;

@property (nonatomic, strong) UILabel *infoLab;

@property (nonatomic, strong) UIView *rateChangeView;

@property (nonatomic, strong) NSString *type;

@property (nonatomic, strong) JCTransactionDataOddsChangeModel *model;

@end

NS_ASSUME_NONNULL_END
