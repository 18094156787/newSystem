//
//  JCDatabaseMatchHeadView.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/6.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseView.h"
#import "JCDataBaseAreaCountryModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCDatabaseMatchHeadView : JCBaseView

@property (nonatomic,strong) UIImageView *iconImgView;

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UIButton *upDownBtn;

@property (nonatomic,strong) UIView *lineView;

@property (nonatomic,strong) JCDataBaseAreaCountryModel *model;

@end

NS_ASSUME_NONNULL_END
