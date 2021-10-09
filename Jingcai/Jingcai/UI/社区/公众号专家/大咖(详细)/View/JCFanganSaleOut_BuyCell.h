//
//  JCFanganSaleOut_BuyCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/9/27.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCWTjInfoDetailBall.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCFanganSaleOut_BuyCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UILabel *introduceLab;//简介

@property (nonatomic,strong) UIImageView *imgView;

@property (nonatomic, strong) JCWTjInfoDetailBall *tjInfoDetailBall;//方案详情

@property (nonatomic,strong) JCWTjInfoBall *payInfoModel;

@property (nonatomic,assign) BOOL is_wz;//是文章,则显示文章对应的图片


@end

NS_ASSUME_NONNULL_END
