//
//  JCColumnDetailIntroduceCollectionCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/10/18.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseCollectionViewCell_New.h"
#import "JCColunmHorseModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCColumnDetailIntroduceCollectionCell : JCBaseCollectionViewCell_New

@property (nonatomic,strong) UILabel *titileLab;

@property (nonatomic,strong) UILabel *timeLab;

@property (nonatomic,strong) JCColunmHorseModel *model;

@end

NS_ASSUME_NONNULL_END
