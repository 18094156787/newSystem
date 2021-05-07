//
//  JCHBExpertZhanjiCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/8/19.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCCommunityEventModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCHBExpertZhanjiCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UIImageView *iconImgView;

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UILabel *infoLab;

@property (nonatomic,strong) JCCommunityEventModel *model;

@end

NS_ASSUME_NONNULL_END
