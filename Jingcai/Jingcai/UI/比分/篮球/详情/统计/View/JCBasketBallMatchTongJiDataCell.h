//
//  JCBasketBallMatchTongJiDataCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/5.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCBasketBallMatchTongJiDataModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCBasketBallMatchTongJiDataCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UIView *progressView;

@property (nonatomic,strong) UILabel *leftLab;

@property (nonatomic,strong) UILabel *rightLab;

@property (nonatomic,strong) UILabel *leftRateLab;

@property (nonatomic,strong) UILabel *rightRateLab;

@property (nonatomic,strong) JCBasketBallMatchTongJiDataModel *model;



@end

NS_ASSUME_NONNULL_END
