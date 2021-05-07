//
//  JCMyBuyOrderDataSingleHeadView.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/30.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseView.h"
#import "JCBigDataOrderDetailModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCMyBuyOrderDataSingleHeadView : JCBaseView

@property (nonatomic,strong) UILabel *titleInfoLab;

@property (nonatomic,strong) UIView *bgView;

@property (nonatomic,strong) UILabel *priceLab;

@property (nonatomic,strong) UILabel *orderDetailLab;

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UILabel *tagLab;

@property (nonatomic,strong) UIImageView *homeImgView;

@property (nonatomic,strong) UIImageView *awayImgView;

@property (nonatomic,strong) UILabel *homeNameLab;

@property (nonatomic,strong) UILabel *awayNameLab;

@property (nonatomic,strong) UILabel *scoreLab;

@property (nonatomic,strong) UIImageView *vsImgView;

@property (nonatomic,strong) UILabel *statusLab;

@property (nonatomic,strong) JCBigDataOrderDetailModel *model;

@property (nonatomic,copy) void(^JCDetailBlock)(void);

@end

NS_ASSUME_NONNULL_END
