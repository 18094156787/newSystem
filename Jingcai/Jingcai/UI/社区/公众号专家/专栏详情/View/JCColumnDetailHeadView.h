//
//  JCColumnDetailHeadView.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/10/18.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseView.h"
#import "JCColumnDetailModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCColumnDetailHeadView : JCBaseView

@property (nonatomic,strong) UIImageView *imgView;

@property (nonatomic,strong) UIImageView *headImgView;

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UILabel *nameLab;

@property (nonatomic,strong) UILabel *contentLab;

@property (nonatomic,strong) UILabel *countLab;

@property (nonatomic,strong) UIButton *concernBtn;//关注按钮

@property (nonatomic, strong) JCColumnDetailModel *detailModel;

@property (nonatomic,copy) void(^JCConcernBlock)(void);

@property (nonatomic,copy) void(^ShowAllBlock)(float height);

- (void)configConcernStatus;

@end

NS_ASSUME_NONNULL_END
