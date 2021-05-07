//
//  JCYCHongbaoInfoView.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/4/20.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseView.h"
#import "JCJingCaiHongbaoModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCYCHongbaoInfoView : JCBaseView

@property (nonatomic,strong)  UIView *contentBgView;

@property (nonatomic,strong) UILabel *content_titleLab;

@property (nonatomic,strong) UILabel *content_timeLab;

@property (nonatomic,strong) UILabel *content_contentLab;

@property (nonatomic,strong)  UIView *priceBgView;

@property (nonatomic,strong)  UILabel *priceLab;

@property (nonatomic,strong) UILabel *infoLab1;

@property (nonatomic,strong) UILabel *infoLab2;

@property (nonatomic,strong) UIButton *sureBtn;

@property (nonatomic,copy) void(^JCGoHongbaoBlock)(void);

@property (nonatomic,strong) JCJingCaiHongbaoModel *model;

@end

NS_ASSUME_NONNULL_END
