//
//  JCPlaneDetailNewAnalysisCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/12/18.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCGZHTuiJianModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCPlaneDetailNewAnalysisCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UIView *bgView;

@property (nonatomic,strong)  UILabel *infoLab;

@property (nonatomic,strong) UILabel *contentLab;

@property (nonatomic,strong) JCWTjInfoBall *planDetailModel;

@property (nonatomic,strong) JCWTjInfoBall *freeDetailModel;

@property (nonatomic,strong) JCGZHTuiJianModel *tjModel;

@property (nonatomic,strong) NSString *content;

@end

NS_ASSUME_NONNULL_END
