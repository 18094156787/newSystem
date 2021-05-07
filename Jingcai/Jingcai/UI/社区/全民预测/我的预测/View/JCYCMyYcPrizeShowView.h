//
//  JCYCMyYcPrizeShowView.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/10/29.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseView.h"
#import "JCMyZhanJiModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCYCMyYcPrizeShowView : JCBaseView

@property (nonatomic,strong) UILabel *priceLab;

@property (nonatomic,strong) UILabel *kefuLab;

@property (nonatomic,strong) UILabel *codeLab;

@property (nonatomic,strong) UIButton *copyBtn;

@property (nonatomic,strong) JCMyZhanJiModel *model;

@end

NS_ASSUME_NONNULL_END
