//
//  JCTeamMatchInfoZhenRongItemView.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/7.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseView.h"
#import "JCTeamMatchPlayerModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCTeamMatchInfoZhenRongItemView : JCBaseView

@property (nonatomic,strong) UIImageView *headImgView;

@property (nonatomic,strong) UIView *numberBgView;

@property (nonatomic,strong) UILabel *numberLab;

@property (nonatomic,strong) UIImageView *iconImgView;

@property (nonatomic,strong) UILabel *nameLab;

@property (nonatomic,strong) JCTeamMatchPlayerModel *model;

@end

NS_ASSUME_NONNULL_END
