//
//  JCPostCheckArticleIntroduceCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/8/23.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCPostCheckArticleIntroduceCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UITextView *contentTV;

@property (nonatomic,strong) UIView *errorInfoView;

@property (nonatomic,strong) UILabel *errorInfoLab;

@property (nonatomic,strong) UIImageView *errorIconImgView;

@property (nonatomic,strong) UILabel *countLab;

@end

NS_ASSUME_NONNULL_END
