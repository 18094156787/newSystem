//
//  JCMyBuyOrderDataHeadView.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/27.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseView.h"
#import "JCBigDataOrderDetailModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCMyBuyOrderDataHeadView : JCBaseView

@property (nonatomic,strong) UILabel *titleInfoLab;

@property (nonatomic,strong) UILabel *priceLab;

@property (nonatomic,strong) UIView *bgView;

@property (nonatomic,strong) UIImageView *headImgView;

@property (nonatomic,strong) UILabel *contentLab;

@property (nonatomic,strong) UILabel *infoLab;

@property (nonatomic,strong) UIButton *buyBtn;

@property (nonatomic,strong) JCBigDataOrderDetailModel *detailModel;

@property (nonatomic,copy) void(^JCBuyBlock)(void);

@end

NS_ASSUME_NONNULL_END
