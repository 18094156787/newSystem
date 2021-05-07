//
//  JCHongbangInfoTopCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/5/19.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCWTjInfoDetailBall.h"
#import "JCHongbangOrderDetailModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCHongbangInfoTopCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UILabel *infoLab;

@property (nonatomic,strong) UIView *orderDetailView;

@property (nonatomic,strong) UILabel *orderDetailLab;

@property (nonatomic,strong) UIImageView *indicateImgView;

@property (nonatomic,strong) JCWTjInfoDetailBall *infoModel;

@property (nonatomic,strong) JCHongbangOrderDetailModel *detailModel;

@property (nonatomic,copy) void(^JCOrderDetailBlock)(void);

@end

NS_ASSUME_NONNULL_END
