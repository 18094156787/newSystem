//
//  JCPayFreeView.h
//  Jingcai
//
//  Created by 陈继伟 on 2019/11/29.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCPayFreeView : JCBaseView

@property (nonatomic,strong) UIImageView *bgView;

@property (nonatomic,strong) UIImageView *smallBgView;

@property (nonatomic,strong) UILabel *tipLab;

@property (nonatomic,strong) UILabel *infoLab;

@property (nonatomic,strong) UIButton *sureBtn;

@property (nonatomic,strong) UILabel *priceLab;

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UILabel *beginTimeLab;

@property (nonatomic,strong) UILabel *endTimeLab;

@property (nonatomic,copy) void(^JCUseBlock)(void);

@property (nonatomic,copy) void(^JCCloseBlock)(void);

@end

NS_ASSUME_NONNULL_END
