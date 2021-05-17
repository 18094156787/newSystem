//
//  JNMatchSJHurtCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/19.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseCollectionViewCell.h"
#import "JNMatchInjuryBall.h"
NS_ASSUME_NONNULL_BEGIN

@interface JNMatchSJHurtCell : JCBaseCollectionViewCell

@property (nonatomic,strong) UIImageView *headImgView;

@property (nonatomic,strong) UILabel *nameLab;

@property (nonatomic,strong) UIImageView *iconImgView;

@property (nonatomic,strong) UILabel *infoLab;

@property (nonatomic,strong) JNMatchInjuryBall *injuryBall;




@end

NS_ASSUME_NONNULL_END
