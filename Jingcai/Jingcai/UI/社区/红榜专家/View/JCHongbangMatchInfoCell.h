//
//  JCHongbangMatchInfoCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/5/19.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCWVerTjInfoMatchBall.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCHongbangMatchInfoCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UILabel *dayLab;

@property (nonatomic,strong) UILabel *matchNameLab;

@property (nonatomic,strong) UILabel *timeLab;

@property (nonatomic,strong) UILabel *rqLabel;

@property (nonatomic,strong) UILabel *no_rqLab;//非让球

@property (nonatomic,strong) UILabel *rqLab;//让球

@property (nonatomic,strong) UILabel *homeLab;//

@property (nonatomic,strong) UILabel *vsLab;//

@property (nonatomic,strong) UILabel *awayLab;//

@property (nonatomic,strong) UIView *no_rqView;

@property (nonatomic,strong) UIView *no_rqWinView;

@property (nonatomic,strong) UILabel *no_rqWinLab;

@property (nonatomic,strong) UIView *no_rqEquaView;

@property (nonatomic,strong) UILabel *no_rqEqualLab;

@property (nonatomic,strong) UIView *no_rqLoseView;

@property (nonatomic,strong) UILabel *no_rqLoseLab;

@property (nonatomic,strong) UIView *rqWinView;

@property (nonatomic,strong) UILabel *rqWinLab;

@property (nonatomic,strong) UIView *rqEqualView;

@property (nonatomic,strong) UILabel *rqEqualLab;

@property (nonatomic,strong) UIView *rqLoseView;

@property (nonatomic,strong) UILabel *rqLoseLab;

@property (nonatomic,strong) UIImageView *tuijianImgView;

@property (nonatomic,strong) UIImageView *tuijianImgView2;

@property (nonatomic,strong) NSMutableArray *labelArray;

@property (nonatomic,strong) JCWVerTjInfoMatchBall *model;
@end

NS_ASSUME_NONNULL_END
