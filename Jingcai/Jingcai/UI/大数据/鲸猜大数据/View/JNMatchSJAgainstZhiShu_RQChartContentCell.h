//
//  JNMatchSJAgainstZhiShu_RQChartContentCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/10/21.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCBigDataZhishuModel.h"
#import "JCBigDataMingZhongModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JNMatchSJAgainstZhiShu_RQChartContentCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UILabel *labelOne;

@property (nonatomic,strong) UILabel *labelTwo;

@property (nonatomic,strong) UILabel *labelThree;

@property (nonatomic,strong) UILabel *labelFour;

@property (nonatomic,strong) UILabel *labelFive;

@property (nonatomic,strong) UILabel *labelSix;

@property (nonatomic,assign) NSInteger row;

@property (nonatomic,strong) JCBigDataZhishuModel *model;

@property (nonatomic,strong) JCBigDataMingZhongModel *mzModel;

@end

NS_ASSUME_NONNULL_END
