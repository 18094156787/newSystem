//
//  JCPlaneDetailMatchCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/23.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCWVerTjInfoMatchBall.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCPlaneDetailMatchCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UIView *bgView;

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UILabel *tagLab;


@property (nonatomic,strong) UILabel *homeNameLab;

@property (nonatomic,strong) UILabel *awayNameLab;

@property (nonatomic,strong) UILabel *vsLab;

@property (nonatomic,strong) UIImageView *typeImgView;

@property (nonatomic,strong) UILabel *resultLab;

@property (nonatomic,strong) JCWVerTjInfoMatchBall *model;


@end

NS_ASSUME_NONNULL_END
