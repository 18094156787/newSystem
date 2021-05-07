//
//  JCMatchDateCell.h
//  FootBallScore
//
//  Created by 陈继伟 on 2020/2/25.
//  Copyright © 2020 --. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JCMatchTimeModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCMatchDateCell : UICollectionViewCell

@property (nonatomic, strong) UILabel *dateLab;

@property (nonatomic, strong) UILabel *weekLab;

@property (nonatomic, strong) UILabel *todayLab;

@property (nonatomic, strong) JCMatchTimeModel *model;

@end

NS_ASSUME_NONNULL_END
