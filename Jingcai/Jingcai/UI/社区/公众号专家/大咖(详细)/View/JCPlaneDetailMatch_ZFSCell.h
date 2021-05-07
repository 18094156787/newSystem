//
//  JCPlaneDetailMatch_ZFSCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/7.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCWVerTjInfoMatchBall.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCPlaneDetailMatch_ZFSCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) KKPaddingLabel *typeLab;

@property (nonatomic,strong) UILabel *vsLab;

@property (nonatomic,strong) UILabel *homeLab;

@property (nonatomic,strong) UILabel *awayLab;

@property (nonatomic,strong) UIView *homeView;

@property (nonatomic,strong) UILabel *no_rqLab;

@property (nonatomic,strong) UILabel *no_rq_windLab;

@property (nonatomic,strong) UILabel *no_rq_equalLab;

@property (nonatomic,strong) UILabel *no_rq_loseLab;

@property (nonatomic,strong) JCWVerTjInfoMatchBall *matchModel;

@end

NS_ASSUME_NONNULL_END
