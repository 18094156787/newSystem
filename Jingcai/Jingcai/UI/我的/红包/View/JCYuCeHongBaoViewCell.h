//
//  JCYuCeHongBaoViewCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/3/30.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCJingCaiHongbaoModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCYuCeHongBaoViewCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UIImageView *bgView;

@property (nonatomic,strong) UILabel *priceLab;

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UILabel *contentLab2;

@property (nonatomic,strong) UILabel *contentLab3;

@property (nonatomic,strong) UILabel *contentLab4;

@property (nonatomic,strong) UILabel *timeLab;

@property (nonatomic,strong) UILabel *infoLab;

@property (nonatomic,strong) UILabel *statusLab;

//@property (nonatomic,strong) JCJingCaiHongbaoInfoModel *yhqModel;

@property (nonatomic,strong) JCJingCaiHongbaoInfoModel *model;

@property (nonatomic,strong) void(^JCYCBlock)(void);

@end

NS_ASSUME_NONNULL_END
