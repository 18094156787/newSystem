//
//  JCPoissonDataModelDetailHeadView.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/10.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseView.h"
#import "JCHistoryPayDataModelDetailMatchView.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCPoissonDataModelDetailHeadView : JCBaseView

@property (nonatomic,strong) UIImageView *bgView;

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) JCHistoryPayDataModelDetailMatchView *matchView;

@end

NS_ASSUME_NONNULL_END
