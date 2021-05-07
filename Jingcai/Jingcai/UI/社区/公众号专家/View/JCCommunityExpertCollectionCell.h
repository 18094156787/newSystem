//
//  JCCommunityExpertCollectionCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/10/27.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseCollectionViewCell_New.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCCommunityExpertCollectionCell : JCBaseCollectionViewCell_New

@property (nonatomic,strong) UIImageView *headView;

@property (nonatomic,strong) UILabel *infoLab;

@property (nonatomic,strong) UILabel *countLab;

@property (nonatomic,strong) UILabel *nameLab;

@property (nonatomic,strong) JCWExpertBall *model;

@property (nonatomic,assign) BOOL isHongbang;

@property (nonatomic,strong) NSString *type;

@end

NS_ASSUME_NONNULL_END
