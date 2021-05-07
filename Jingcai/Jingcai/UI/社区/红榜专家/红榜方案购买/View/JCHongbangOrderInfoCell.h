//
//  JCHongbangOrderInfoCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/8/21.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCWTjInfoDetailBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCHongbangOrderInfoCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UILabel *infoLab;

@property (nonatomic,strong) UIView *lineView;

@property (nonatomic,strong) UIView *priceBgView;

@property (nonatomic,strong) UILabel *tagLab;

@property (nonatomic,strong) UILabel *priceLab;

@property (nonatomic,strong) UIImageView *bzfhImgView;

@property (nonatomic,strong) JCWTjInfoDetailBall *infoModel;

@property (nonatomic,strong) NSArray *matchDataArray;
@end

NS_ASSUME_NONNULL_END
