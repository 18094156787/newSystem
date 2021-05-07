//
//  JCTeamDetailZhuanHuiItemView.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/13.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseView.h"
#import "JCTeamDetailInfoZhuanHuiModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCTeamDetailZhuanHuiItemView : JCBaseView

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UIImageView *imgView;

@property (nonatomic,strong) UIImageView *iconImgView;

@property (nonatomic,strong) UIImageView *iconImgView1;

@property (nonatomic,strong) UIImageView *iconImgView2;

@property (nonatomic,strong) JCTeamDetailInfoZhuanHuiModel *model;

@end

NS_ASSUME_NONNULL_END
