//
//  JCAiProfitDetailPieCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/15.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "SCChart.h"
#import "JCJingCaiAIYLModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCAiProfitDetailPieCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UIImageView *iconImgView;

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UILabel *countLab;

@property (nonatomic,strong) UILabel *rateLab;

@property (nonatomic,strong) UILabel *rateInfoLab;

@property (nonatomic,strong) UIView *winView;

@property (nonatomic,strong) UIView *loseView;

@property (nonatomic,strong) UIView *winHalfView;

@property (nonatomic,strong) UIView *loseHalfView;

@property (nonatomic,strong) UIView *zsView;

@property (nonatomic,strong) UILabel *winLab;

@property (nonatomic,strong) UILabel *loseLab;

@property (nonatomic,strong) UILabel *winHalfLab;

@property (nonatomic,strong) UILabel *loseHalfLab;

@property (nonatomic,strong) UILabel *zsLab;

@property (nonatomic,strong) UILabel *winRateLab;

@property (nonatomic,strong) UILabel *loseRateLab;

@property (nonatomic,strong) UILabel *winHalfRateLab;

@property (nonatomic,strong) UILabel *loseHalfRateLab;

@property (nonatomic,strong) UILabel *zsRateLab;

@property (nonatomic,strong,nullable) SCPieChart *chartView;

@property (nonatomic,strong) JCJingCaiAIYLModel *model;

@end

NS_ASSUME_NONNULL_END
