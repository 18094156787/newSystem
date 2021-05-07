//
//  JCDakaTopExpertCollectionCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/8/5.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseCollectionViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCDakaTopExpertCollectionCell : JCBaseCollectionViewCell

@property (nonatomic,strong) UIImageView *headView;

@property (nonatomic,strong) UILabel *infoLab;

@property (nonatomic,strong) UILabel *nameLab;

@property (nonatomic,strong) JCWExpertBall *model;

@property (nonatomic,assign)BOOL isHongbang;

@end

NS_ASSUME_NONNULL_END
