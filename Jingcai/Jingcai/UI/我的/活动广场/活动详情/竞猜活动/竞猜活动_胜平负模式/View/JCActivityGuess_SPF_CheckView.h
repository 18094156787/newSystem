//
//  JCActivityGuess_SPF_CheckView.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/6/28.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseView.h"
#import "JCActivityOptionModel.h"
#import "JCActivityDetailModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCActivityGuess_SPF_CheckView : JCBaseView

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UILabel *teamLab;

@property (nonatomic,strong) UILabel *infoLab;

@property (nonatomic,strong) UILabel *chooseLab;

@property (nonatomic,strong) UIButton *cancelBtn;

@property (nonatomic,strong) UIButton *sureBtn;

@property (nonatomic,copy) void(^JCSureBlock)(void);

@property (nonatomic,strong) JCActivityOptionModel *selectOptionModel;

@property (nonatomic,strong) JCActivityDetailModel *detailModel;
@end

NS_ASSUME_NONNULL_END
