//
//  JNMatchSJAgainstZhiShu_SPFChartCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/18.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCBigDataZhishuPanModel.h"
#import "JCBigDataZhishuLargeSmallModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JNMatchSJAgainstZhiShu_SPFChartCell : JCBaseTableViewCell_New<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UIImageView *leftLineImgView;

@property (nonatomic,strong) UIImageView *rightLineImgView;

@property (nonatomic,strong) UIView *bgView;

@property (nonatomic,strong) UILabel *lastTimeLab;

@property (nonatomic,strong) UILabel *nowTimeLab;

@property (nonatomic,strong) UILabel *chupanLab;//初盘

@property (nonatomic,strong) UILabel *jipanLab;//即盘

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *dataArray;

@property (nonatomic, strong) JCBigDataZhishuPanModel *panModel;

@property (nonatomic, strong) JCBigDataZhishuLargeSmallModel *largeModel;//最大最小值

@property (nonatomic, strong) NSArray *trendArray;//折线趋势

@end

NS_ASSUME_NONNULL_END
