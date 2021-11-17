//
//  JCMatchDataModelTipView.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/17.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCMatchDataModelTipView : JCBaseView

@property (nonatomic,strong) UIImageView *tipImgView;

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UILabel *contentLab;

@property (nonatomic,strong) UIView *buyBgView;

@property (nonatomic,strong) UIButton *buyBtn;//购买

@property (nonatomic, copy) void(^JCBuyBlock)(void);//type 1是单场,2是包月

@end

NS_ASSUME_NONNULL_END
