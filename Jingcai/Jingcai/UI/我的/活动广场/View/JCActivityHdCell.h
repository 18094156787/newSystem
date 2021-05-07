//
//  JCActivityHdCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/3/9.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCActivityHdCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UILabel *timeLab;

@property (nonatomic,strong) UILabel *statusLab;

@property (nonatomic,strong) UIImageView *imgView;

@property (nonatomic,strong) UIImageView *statusImgView;

@property (nonatomic,strong)JCWSlideBall *model;

@end

NS_ASSUME_NONNULL_END
