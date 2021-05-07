//
//  JCPlaneDetailMatch_CustomCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/12/18.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCWVerTjInfoMatchBall.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCPlaneDetailMatch_CustomCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) KKPaddingLabel *typeLab;

@property (nonatomic,strong) UILabel *vsLab;

@property (nonatomic,strong) UILabel *homeLab;

@property (nonatomic,strong) UILabel *awayLab;

@property (nonatomic,strong) UILabel *nameLab;

@property (nonatomic,strong) UILabel *tuiJianLab;

@property (nonatomic,strong) JCWVerTjInfoMatchBall *matchModel;


@end

NS_ASSUME_NONNULL_END
