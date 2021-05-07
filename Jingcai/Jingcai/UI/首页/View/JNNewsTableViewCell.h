//
//  JNNewsTableViewCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/4/29.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCWNewsBall.h"
NS_ASSUME_NONNULL_BEGIN

@interface JNNewsTableViewCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UILabel *timeLab;

@property (nonatomic,strong) UILabel *countLab;

@property (nonatomic,strong) UIImageView *iconImgView;

@property (nonatomic,strong) UILabel *zhidingLab;

@property (nonatomic,strong) UIView *lineView;

@property (nonatomic,strong) JCWNewsBall  *model;

@end

NS_ASSUME_NONNULL_END
