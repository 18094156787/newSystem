//
//  JCHongbangDetailOtherCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/27.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCWVerTjInfoMatchBall.h"
#import "JCWTjInfoDetailBall.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCHongbangDetailOtherCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UILabel *tagLab;

@property (nonatomic,strong) UIImageView *homeImgView;

@property (nonatomic,strong) UIImageView *awayImgView;

@property (nonatomic,strong) UILabel *homeNameLab;

@property (nonatomic,strong) UILabel *awayNameLab;

@property (nonatomic,strong) UILabel *scoreLab;

@property (nonatomic,strong) UIImageView *vsImgView;

@property (nonatomic,strong) UILabel *statusLab;

@property (nonatomic,strong) UIView *topView;

@property (nonatomic,strong) UILabel *norq_Lab;

@property (nonatomic,strong) UILabel *norq_WinLab;

@property (nonatomic,strong) UILabel *norq_EqualLab;

@property (nonatomic,strong) UILabel *norq_loseLab;

@property (nonatomic,strong) UIImageView *tuijianImgView;

@property (nonatomic,strong) UIView *priceInfoView;

@property (nonatomic,strong) UIImageView *hongbiImgView;

@property (nonatomic,strong) UILabel *priceLab;

@property (nonatomic,strong) UILabel *refundLab;

@property (nonatomic,strong) UILabel *payStatusLab;//支付状态

@property (nonatomic,strong) UIImageView *resImageView;//比赛结果

@property (nonatomic,assign) BOOL isBuy;//是否是购买,如果是购买页,则不显示赔率部分

@property (nonatomic,assign) BOOL hideMatchRate;//1不显示赔率部分

@property (nonatomic,strong) JCWVerTjInfoMatchBall *model;

@property (nonatomic,strong) JCWTjInfoDetailBall *tjInfoDetailBall;

@property (nonatomic,strong) JCHongbangDetail_MatchModel *matchModel;

@end

NS_ASSUME_NONNULL_END
