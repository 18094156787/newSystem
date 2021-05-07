//
//  JCPostPlanCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2019/12/26.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCPostButton.h"
#import "JCPostPlanMathInfoModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCPostPlanCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UILabel *matchLabel;

@property (nonatomic,strong) UITextField *matchTF;

@property (nonatomic,strong) UILabel *titleLabel;

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UIImageView *homeImgView;

@property (nonatomic,strong) UIImageView *awayImgView;

@property (nonatomic,strong) UILabel *homeNameLab;

@property (nonatomic,strong) UILabel *awayNameLab;

@property (nonatomic,strong) UILabel *scoreLab;



@property (nonatomic,strong) JCPostButton *masterWin_normalBtn;

@property (nonatomic,strong) JCPostButton *equal_normalBtn;

@property (nonatomic,strong) JCPostButton *customerWin_normalBtn;



@property (nonatomic,strong) UIButton *deleteBtn;

@property (nonatomic,strong) NSMutableArray *btnArray;

@property (nonatomic,strong) JCPostButton *selectBtn;

@property (nonatomic,strong) NSString *type;//1 欧盘  2 亚盘  3 大小球

@property (nonatomic,strong)JCPostPlanMathInfoModel *model;

@property (nonatomic,copy) void(^JCTitleSelectBlock)(void);

@property (nonatomic,copy) void(^JCMatchSelectBlock)(void);



@end

NS_ASSUME_NONNULL_END
