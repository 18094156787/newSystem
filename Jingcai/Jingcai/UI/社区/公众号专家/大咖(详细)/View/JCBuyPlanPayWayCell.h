//
//  JCBuyPlanPayWayCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/5/18.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCPayWayBall.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCBuyPlanPayWayCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UIImageView *iconImgView;

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UILabel *infoLab;

@property (nonatomic,strong) UIImageView *indicateImgView;

@property (nonatomic,strong) UIButton *selBtn;

//@property (nonatomic,strong) UIImageView *hongbaoImgView;
//
//@property (nonatomic,strong) UILabel *hongbaoLab;//可抵扣的红包金额

@property (nonatomic,strong) UILabel *selHongbaoLab;//选择的红包抵扣金额

@property (nonatomic,strong) UIView *lineView;

@property (nonatomic,strong) JCPayWayBall *payWayball;
@end

NS_ASSUME_NONNULL_END
