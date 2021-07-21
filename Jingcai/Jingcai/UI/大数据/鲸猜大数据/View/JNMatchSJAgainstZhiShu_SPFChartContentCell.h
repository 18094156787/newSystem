//
//  JNMatchSJAgainstZhiShu_SPFChartContentCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/10/20.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCBigDataZhishuModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JNMatchSJAgainstZhiShu_SPFChartContentCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UILabel *labelOne;

@property (nonatomic,strong) UILabel *labelTwo;

@property (nonatomic,strong) UILabel *labelThree;

@property (nonatomic,strong) UILabel *labelFour;

@property (nonatomic,strong) UILabel *labelFive;

@property (nonatomic,strong) UILabel *labelSix;

@property (nonatomic,strong) UIView *lineOne;

@property (nonatomic,strong) UIView *lineTwo;

@property (nonatomic,strong) UIView *lineThree;

@property (nonatomic,strong) UIView *lineFour;

@property (nonatomic,strong) UIView *lineFive;

@property (nonatomic,strong) UIImageView *upImgView;

@property (nonatomic,strong) UIImageView *equalImgView;

@property (nonatomic,strong) UIImageView *downImgView;

@property (nonatomic,strong) UILabel *upLabel;

@property (nonatomic,strong) UILabel *equalLabel;

@property (nonatomic,strong) UILabel *downLabel;

@property (nonatomic,assign) NSInteger row;

@property (nonatomic,strong) JCBigDataZhishuModel *model;

@end

NS_ASSUME_NONNULL_END
