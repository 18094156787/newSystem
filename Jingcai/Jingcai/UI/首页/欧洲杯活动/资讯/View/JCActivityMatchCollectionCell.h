//
//  JCActivityMatchCollectionCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/3/4.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseCollectionViewCell_New.h"
#import "JCWMatchBall.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCActivityMatchCollectionCell : JCBaseCollectionViewCell_New

@property (nonatomic,strong) UIView *backImgView;

@property (nonatomic,strong) KKPaddingLabel *goingLab;

@property (nonatomic,strong) UILabel *timeInfoLab;

@property (nonatomic,strong) UILabel *timeLab;

@property (nonatomic,strong) UIImageView *homeImgView;

@property (nonatomic,strong) UIImageView *awayImgView;

@property (nonatomic,strong) UILabel *homeLab;

@property (nonatomic,strong) UILabel *infoLab;

@property (nonatomic,strong) UILabel *awayLab;

@property (nonatomic,strong) UIImageView *countImgView;

@property (nonatomic,strong) KKPaddingLabel *countLab;

@property (nonatomic,strong) JCWMatchBall *model;

@end

NS_ASSUME_NONNULL_END
