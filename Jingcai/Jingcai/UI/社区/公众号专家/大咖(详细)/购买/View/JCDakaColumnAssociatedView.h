//
//  JCDakaColumnAssociatedView.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/10/20.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseView.h"
#import "JCColumnInfoModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCDakaColumnAssociatedView : JCBaseView

@property (nonatomic,strong) UIView *bgView;

@property (nonatomic,strong) UIImageView *imgView;

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UILabel *contentLab;

@property (nonatomic,strong) UILabel *dateLab;

@property (nonatomic,assign) BOOL haveBottomDistance;

@property (nonatomic,strong) JCColumnInfoModel *model;

@end

NS_ASSUME_NONNULL_END
