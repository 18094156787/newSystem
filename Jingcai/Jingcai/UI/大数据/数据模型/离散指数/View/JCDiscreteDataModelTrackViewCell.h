//
//  JCDiscreteDataModelTrackViewCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/11.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCDiscreteDataModelTrackViewCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UIView *trackView;

@property (nonatomic,strong) UIView *bottomView;

@property (nonatomic,strong) UILabel *lastTimeLab;

@property (nonatomic,strong) UILabel *nowTimeLab;

@property (nonatomic,strong) UILabel *beginTimeLab;

@property (nonatomic, strong) NSArray *trendArray;//折线趋势

@end

NS_ASSUME_NONNULL_END
