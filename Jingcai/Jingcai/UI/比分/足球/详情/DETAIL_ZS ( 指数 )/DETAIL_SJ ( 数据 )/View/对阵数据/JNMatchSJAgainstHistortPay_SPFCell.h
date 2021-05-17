//
//  JNMatchSJAgainstHistortPay_SPFCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/18.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCBigDataSimilarModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JNMatchSJAgainstHistortPay_SPFCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UIImageView *iconImgView;

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UILabel *winLab;

@property (nonatomic,strong) UILabel *eqalLab;

@property (nonatomic,strong) UILabel *loseLab;

@property (nonatomic,strong) UILabel *winRateLab;

@property (nonatomic,strong) UILabel *eqalRateLab;

@property (nonatomic,strong) UILabel *loseRateLab;

@property (nonatomic,assign) NSInteger type;//0是胜平负 1是让球 2是进球数

@property (nonatomic,strong) UIView *lineView;

@property (nonatomic,strong) JCBigDataSimilarModel *model;

@end

NS_ASSUME_NONNULL_END
