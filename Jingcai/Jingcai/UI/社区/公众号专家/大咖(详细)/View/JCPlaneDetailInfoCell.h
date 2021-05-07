//
//  JCPlaneDetailInfoCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2019/8/11.
//  Copyright © 2019年 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCPlaneDetailInfoCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UIView *bgView;

@property (nonatomic,strong) UILabel *contentLab;

@property (nonatomic,strong) UIView *analyseBgView;

@property (nonatomic,strong) UILabel *analyseLab;

@property (nonatomic,strong) UILabel *infoLab;

//@property (nonatomic,strong)  UIView *lineView;
//
//@property (nonatomic,strong) UILabel *resultLab;

@property (nonatomic,strong) NSAttributedString *htmlStr;

@property (nonatomic,strong) JCWTjInfoBall *planDetailModel;//方案详情

@property (nonatomic,strong) void(^JCImageBlock)(NSArray *array);

@end

NS_ASSUME_NONNULL_END
