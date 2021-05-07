//
//  JCMyConcernExpertCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/8/28.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCMyConcernExpertCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UIImageView *headImgView;

@property (nonatomic,strong) UILabel *countLab;

@property (nonatomic,strong) UILabel *nameLab;

@property (nonatomic,strong) UILabel *fansLab;

@property (nonatomic,strong) UIButton *concernBtn;

@property (nonatomic,strong) JCWExpertBall *model;

@property (nonatomic,copy) void(^JCConcernBlock)(void);

@end

NS_ASSUME_NONNULL_END
