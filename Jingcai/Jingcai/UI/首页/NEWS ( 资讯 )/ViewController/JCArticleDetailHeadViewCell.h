//
//  JCArticleDetailHeadView.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/11/10.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCWNewsDetailBall.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCArticleDetailHeadViewCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UIImageView *headView;

@property (nonatomic,strong) UILabel *nameLab;

@property (nonatomic,strong) UIView *userClickView;

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UIButton *concernBtn;

@property (nonatomic,strong) UIImageView *zhidingView;

@property (nonatomic,strong) UILabel *infoLab;

@property (strong, nonatomic) JCWNewsDetailBall * newsDetailBall;

@property (strong, nonatomic) UIView *userInfoView;

@property (nonatomic,copy) void(^JCConcernBlock)(void);

@end

NS_ASSUME_NONNULL_END
