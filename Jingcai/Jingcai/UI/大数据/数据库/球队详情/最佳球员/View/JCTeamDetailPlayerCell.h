//
//  JCTeamDetailPlayerCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/23.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCEventScorePlayerModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCTeamDetailPlayerCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UILabel *typeLab;

@property (nonatomic,strong) UILabel *rankLab;

//@property (nonatomic,strong) UILabel *userLab;

@property (nonatomic,strong) UILabel *teamLab;

@property (nonatomic,strong) UILabel *countLab;

//@property (nonatomic,strong) UIImageView *userImgView;

@property (nonatomic,strong) UIImageView *teamImgView;

@property (nonatomic,strong) JCEventScorePlayerModel *model;

@end

NS_ASSUME_NONNULL_END
