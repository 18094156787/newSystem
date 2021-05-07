//
//  JCMessageCenterCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/8/18.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCMeaasgeModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCMessageCenterCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UIView *iconImgView;

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UILabel *timeLab;

@property (nonatomic,strong) UILabel *contentLab;

@property (nonatomic,strong) UILabel *reasonLab;

@property (nonatomic,strong) UILabel *sureLab;

@property (nonatomic,strong) JCMeaasgeModel *model;


@end

NS_ASSUME_NONNULL_END
