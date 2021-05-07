//
//  JCPostCheckUserIDCardCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/8/23.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCPostCheckUserIDCardCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UIImageView *photoImgView;

@property (nonatomic,strong) UIView *errorInfoView;

@property (nonatomic,strong) UILabel *errorInfoLab;

@property (nonatomic,strong) UIImageView *errorIconImgView;

@property (nonatomic,strong) UIButton *deleteBtn;

@end

NS_ASSUME_NONNULL_END
