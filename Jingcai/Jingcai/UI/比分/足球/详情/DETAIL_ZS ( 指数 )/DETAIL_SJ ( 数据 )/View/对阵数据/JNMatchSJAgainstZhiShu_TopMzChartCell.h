//
//  JNMatchSJAgainstZhiShu_TopMzChartCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/7/20.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCBigDataZhishuModel.h"
#import "JCBigDataMingZhongModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JNMatchSJAgainstZhiShu_TopMzChartCell : JCBaseTableViewCell_New

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

@property (nonatomic,assign) NSInteger row;

@property (nonatomic,strong) JCBigDataZhishuModel *model;

@property (nonatomic,strong) JCBigDataMingZhongModel *mzModel;


@end

NS_ASSUME_NONNULL_END
