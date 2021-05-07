//
//  JCMyBuyOrderTjDetailMatchInfoCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/27.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCHongbangOrderDetailModel.h"
#import "JCBigDataOrderDetailModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCMyBuyOrderTjDetailMatchInfoCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UILabel *matchTitleLab;

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UILabel *tagLab;

@property (nonatomic,strong) UIImageView *homeImgView;

@property (nonatomic,strong) UIImageView *awayImgView;

@property (nonatomic,strong) UILabel *homeNameLab;

@property (nonatomic,strong) UILabel *awayNameLab;

@property (nonatomic,strong) UILabel *scoreLab;

@property (nonatomic,strong) UIImageView *vsImgView;

@property (nonatomic,strong) UILabel *statusLab;

@property (nonatomic, strong) UIImageView * resImageView;//开奖结果

@property (nonatomic,copy) void(^JCDetailBlock)(void);

@property (nonatomic,strong) JCDianPingMatchBall*model;

@property (nonatomic,strong) JCHongbangOrderDetailModel *detailModel;

@property (nonatomic,strong) JCBigDataOrderDetailModel *bigDataModel;
@end

NS_ASSUME_NONNULL_END
