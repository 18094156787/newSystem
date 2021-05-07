//
//  JCMatchParticipateView.h
//  Jingcai
//
//  Created by 陈继伟 on 2019/10/24.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JNMatchParticipateModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCMatchParticipateCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UIView *topLineView;

@property (nonatomic,strong) UIView *circleView;

@property (nonatomic,strong) UIView *bottomLineView;

@property (nonatomic,strong) UIImageView *headImgView;

@property (nonatomic,strong) UILabel *timeLab;

@property (nonatomic,strong) UILabel *nameLab;

@property (nonatomic,strong) UILabel *infoLab;

@property (nonatomic,strong) UIImageView *indicateImgView;

@property (nonatomic,strong) UIView *bottomView;

@property (nonatomic,strong) UILabel *lianhongLab;

@property (nonatomic,strong) UILabel *zhongLab;

@property (nonatomic,strong) JNMatchParticipateModel *model;

@end

NS_ASSUME_NONNULL_END
