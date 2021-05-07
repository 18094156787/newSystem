//
//  JCYCExpertTopView.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/4/16.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseView.h"
#import "JCYCUserInfoModel.h"
#import "JCYCTopUserInfoModel.h"
#import "JCYuceCommomModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCYCExpertTopView : JCBaseView

@property (nonatomic,strong) CAGradientLayer *gl;

@property (nonatomic,strong) UIView *bgView;

@property (nonatomic,strong) UIView *contentBgView;

@property (nonatomic,strong) UIView *bottomView;

@property (nonatomic,strong) UIImageView *headImgView;

@property (nonatomic,strong) UILabel *nameLab;

@property (nonatomic,strong) UILabel *infoLab;

@property (nonatomic,strong) UILabel *countLab;

@property (nonatomic,strong) UILabel *historyLab;

@property (nonatomic,strong) UIImageView *qianyueView;

@property (nonatomic,strong) UIImageView *bottombgView;

@property (nonatomic,strong) UILabel *contentLab;

@property (nonatomic,strong) UILabel *predicateLab;

@property (nonatomic,strong) UIImageView *indicateImgView;

@property (nonatomic,strong) JCYuceCommomModel *commom_Model;

@property (nonatomic,strong) JCYCUserInfoModel *model;

@property (nonatomic,strong) JCYCTopUserInfoModel *userModel;

@property (nonatomic,strong) NSString *expertID;

@property (nonatomic,assign) BOOL noClick;//没有点击事件

@end

NS_ASSUME_NONNULL_END
