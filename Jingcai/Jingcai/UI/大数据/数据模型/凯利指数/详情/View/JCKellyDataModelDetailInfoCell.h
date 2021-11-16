//
//  JCKellyDataModelDetailInfoCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/12.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCKellyDataModelOpenRateView.h"
#import "JCKellyDataDetailModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCKellyDataModelDetailInfoCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UIView *bgView;

@property (nonatomic, strong) JCKellyDataModelOpenRateView *chuView;//初赔

@property (nonatomic, strong) JCKellyDataModelOpenRateView *jiView;//即赔

@property (nonatomic,strong) KKPaddingLabel *historyLab;

@property (nonatomic,strong) JCKellyDataDetailModel *model;

@end

NS_ASSUME_NONNULL_END
