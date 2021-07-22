//
//  JCActivityGuess_SPF_More_MatchCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/7/22.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCActivityDetailModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCActivityGuess_SPF_More_MatchCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UIImageView *qcImgView;//球场底图

@property (nonatomic,strong) UIImageView *homeImgView;

@property (nonatomic,strong) UIImageView *awayImgView;

@property (nonatomic,strong) UILabel *homeLab;

@property (nonatomic,strong) UILabel *awayLab;

@property (nonatomic,strong) UILabel *statusLab;

@property (nonatomic,strong) UILabel *scoreLab;

@property (nonatomic,strong) UIView *itemView;

@property (nonatomic,strong) UIButton *selectBtn;

@property (nonatomic,strong) UIImageView *resultImgView;

@property (nonatomic,strong) UIImageView *chooseImgView;

@property (nonatomic,strong) UIImageView *rightImgView;

@property (nonatomic,strong) JCActivityDetailModel *detailModel;

@property (nonatomic,strong) NSMutableArray *btnArray;

@property (nonatomic,copy) void(^JCSelectBlock)(JCActivityOptionModel *selectOptionModel);

@end

NS_ASSUME_NONNULL_END
