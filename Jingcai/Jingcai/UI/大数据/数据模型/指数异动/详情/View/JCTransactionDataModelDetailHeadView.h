//
//  JCTransactionDataModelDetailHeadView.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/12.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseView.h"
#import "JCTransactionDataModelDetailMatchView.h"
#import "JCKellyDataDetailModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCTransactionDataModelDetailHeadView : JCBaseView

@property (nonatomic,strong) UIImageView *bgView;

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) JCTransactionDataModelDetailMatchView *matchView;

@property (nonatomic,strong) JCKellyDataDetailModel *model;

@property (nonatomic,strong) NSString *match_id;

@property (nonatomic,strong) NSString *model_id;

@end

NS_ASSUME_NONNULL_END
