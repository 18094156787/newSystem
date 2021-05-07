//
//  JCActivityRedPacketListCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2019/9/26.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCActivityRedPacketListCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UILabel *countLab;

@property (nonatomic,strong) UIImageView *countImgView;

@property (nonatomic,strong) UILabel *priceLab;

@property (nonatomic,strong) UILabel *limitLab;

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UILabel *infoLab;

@property (nonatomic,strong) UILabel *dateLab;

@property (nonatomic,strong) JCActivityRedPacketModel *model;

@end

NS_ASSUME_NONNULL_END
