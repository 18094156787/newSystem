//
//  JNMatchZS_SF_TableViewCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/7.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JNMatchZS_PLInfoModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JNMatchZS_SF_TableViewCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UILabel *companyLab;//

@property (nonatomic,strong) UILabel *windLab;//

@property (nonatomic,strong) UILabel *equalLab;//

@property (nonatomic,strong) UILabel *loseLab;

@property (nonatomic,strong) UILabel *j_windLab;//

@property (nonatomic,strong) UILabel *j_equalLab;//

@property (nonatomic,strong) UILabel *j_loseLab;

@property (nonatomic,strong) UILabel *c_Lab;

@property (nonatomic,strong) UILabel *j_Lab;

@property (nonatomic,strong) UIImageView *indicateImgView;

@property (nonatomic,strong) JNMatchZS_PLInfoModel *basketballModel;

@property (nonatomic,strong) NSArray *dataArray;

@end

NS_ASSUME_NONNULL_END
