//
//  JCTopRankListCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/8/19.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCCommunityRankModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCTopRankListCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UIImageView *iconImgView;

@property (nonatomic,strong) UILabel *numberLab;

@property (nonatomic,strong) UIImageView *headImgView;

@property (nonatomic,strong) UILabel *countLab;

@property (nonatomic,strong) UILabel *nameLab;

@property (nonatomic,strong) UILabel *tagLab;

@property (nonatomic,strong) UILabel *rateLab;

@property (nonatomic,strong) UIButton *concernBtn;

@property (nonatomic,assign) NSInteger type;

@property (nonatomic,strong) JCCommunityRankModel *model;

@property (nonatomic,copy) void(^JCConcernBlock)(JCCommunityRankModel *rankModel);

@end

NS_ASSUME_NONNULL_END
