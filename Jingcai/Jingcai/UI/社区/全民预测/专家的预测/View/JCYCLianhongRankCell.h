//
//  JCYCLianhongRankCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/4/16.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCYCRankModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCYCLianhongRankCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UIImageView *rankImgView;

@property (nonatomic,strong) UILabel *rankLab;

@property (nonatomic,strong) UIImageView *headImgView;

@property (nonatomic,strong) UILabel *nameLab;

@property (nonatomic,strong) UILabel *infoLab;

@property (nonatomic,strong) UIImageView *qianyueImgView;

@property (nonatomic,strong) UIImageView *lianHongImgView;

@property (nonatomic,strong) UILabel *lianhongLab;

@property (nonatomic,strong) UILabel *lianhongLabel;

@property (nonatomic,copy) void(^JCJumpBlock)(JCYCRankModel *model);

@property (nonatomic,strong) JCYCRankModel *model;

@end

NS_ASSUME_NONNULL_END
