//
//  JNMatchSJAgainstSPF_Cell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/17.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCBigDataMonthProduceModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JNMatchSJAgainstSPF_Cell : JCBaseTableViewCell_New

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UILabel *winLab;

@property (nonatomic,strong) UILabel *eqalLab;

@property (nonatomic,strong) UILabel *loseLab;

@property (nonatomic,strong) UILabel *winInfoLab;

@property (nonatomic,strong) UILabel *eqalInfoLab;

@property (nonatomic,strong) UILabel *loseInfoLab;

@property (nonatomic,strong) UIImageView *leftLineImgView;

@property (nonatomic,strong) UIImageView *rightLineImgView;

@property (nonatomic,strong) JCBigDataMonthProduceModel *model;

@end

NS_ASSUME_NONNULL_END
