//
//  JCHistoryPayDataModelColumnarView.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/10.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseView.h"
#import "JCHistoryPayRateDataModel.h"
NS_ASSUME_NONNULL_BEGIN
//柱状图相关视图
@interface JCHistoryPayDataModelColumnarView : JCBaseView

@property (nonatomic, strong) UILabel *topLab;

@property (nonatomic, strong) UILabel *nameLab;

@property (nonatomic, strong) UILabel *bottomLab;

@property (nonatomic, strong) UILabel *countLab;

@property (nonatomic, strong) UIView *colorBgView;

@property (nonatomic, strong) UIView *colorView;

@property (nonatomic,assign) float rate;

@end

NS_ASSUME_NONNULL_END
