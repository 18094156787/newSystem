//
//  JCTeamDetailZhuanHuiCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/13.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCTeamDetailZhuanHuiItemView.h"
#import "JCTeamDetailInfoZhuanHuiModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCTeamDetailZhuanHuiCell : JCBaseTableViewCell_New

@property (nonatomic,strong) JCTeamDetailZhuanHuiItemView *inView;

@property (nonatomic,strong) JCTeamDetailZhuanHuiItemView *outView;

@property (nonatomic,strong) JCTeamDetailInfoZhuanHuiModel *zhuanRuModel;

@property (nonatomic,strong) JCTeamDetailInfoZhuanHuiModel *zhuanChuModel;

@property (nonatomic,strong) NSString *team_id;


@end

NS_ASSUME_NONNULL_END
