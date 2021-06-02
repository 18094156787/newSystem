//
//  JCActivityPrizeTitleView.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/6/2.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseView.h"
#import "JCActivityGoodsTitleModel.h"
#import "JCActivityDetailModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCActivityPrizeTitleView : JCBaseView

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UILabel *statusLab;

@property (nonatomic,strong) JCActivityDetailModel *detailModel;

@property (nonatomic,strong) JCActivityGoodsTitleModel *titleModel;

@end

NS_ASSUME_NONNULL_END
