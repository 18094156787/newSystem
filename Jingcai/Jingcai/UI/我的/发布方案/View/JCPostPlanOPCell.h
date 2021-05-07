//
//  JCPostPlanOPCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/4/8.
//  Copyright © 2020 jingcai. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCPostButton.h"
#import "JCPostPlanMathInfoModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCPostPlanOPCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UILabel *titleLabel;

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UILabel *normalInfoLab;

@property (nonatomic,strong) UIImageView *homeImgView;

@property (nonatomic,strong) UIImageView *awayImgView;

@property (nonatomic,strong) UILabel *homeNameLab;

@property (nonatomic,strong) UILabel *awayNameLab;

@property (nonatomic,strong) UILabel *scoreLab;

@property (nonatomic,strong) UIView *anotherView;

@property (nonatomic,strong) UILabel *anotherInfoLab;

@property (nonatomic,strong) JCPostButton *masterWin_normalBtn;

@property (nonatomic,strong) JCPostButton *equal_normalBtn;

@property (nonatomic,strong) JCPostButton *customerWin_normalBtn;

@property (nonatomic,strong) JCPostButton *masterWin_anotherBtn;

@property (nonatomic,strong) JCPostButton *equal_anotherBtn;

@property (nonatomic,strong) JCPostButton *customerWin_anotherBtn;

@property (nonatomic,strong) UIButton *deleteBtn;

@property (nonatomic,strong) UIView *lineView;

@property (nonatomic,strong) NSMutableArray *btnArray;

@property (nonatomic,assign) NSInteger index;

@property (nonatomic,strong) JCPostPlanMathInfoModel *model;

@property (nonatomic,copy) void(^JCTitleSelectBlock)(void);

@property (nonatomic,copy) void(^JCMatchSelectBlock)(void);

@property (nonatomic,strong) NSArray *dataArray;

@end

NS_ASSUME_NONNULL_END
