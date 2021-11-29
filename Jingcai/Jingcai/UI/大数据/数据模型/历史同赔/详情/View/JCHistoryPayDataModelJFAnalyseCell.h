//
//  JCHistoryPayDataModelJFAnalyseCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/29.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCKellyDataDetailModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCHistoryPayDataModelJFAnalyseCell : JCBaseTableViewCell_New

@property (nonatomic, strong) UIView *progressView;

@property (nonatomic, strong) UILabel *teamLab;

@property (nonatomic, strong) UIView *winView;

@property (nonatomic, strong) UIView *equalView;

@property (nonatomic, strong) UIView *loseView;

@property (nonatomic, strong) UILabel *winLab;

@property (nonatomic, strong) UILabel *equalLab;

@property (nonatomic, strong) UILabel *loseLab;

@property (nonatomic,assign) NSInteger row;

@property (nonatomic,strong) JCKellyDataDetailModel *model;

@end

NS_ASSUME_NONNULL_END
