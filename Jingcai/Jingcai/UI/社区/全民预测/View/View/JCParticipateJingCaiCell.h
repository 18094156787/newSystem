//
//  JCParticipateJingCaiCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2019/9/24.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCJingCaiBtn.h"
#import "JCParticipateJingCaiTipView.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCParticipateJingCaiCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UILabel *infoLab;

@property (nonatomic,strong) UIImageView *masterImgView;

@property (nonatomic,strong) UIImageView *customerImgView;

@property (nonatomic,strong) UILabel *masterNameLab;

@property (nonatomic,strong) UILabel *customerNameLab;

@property (nonatomic,strong) UILabel *normalInfoLab;

@property (nonatomic,strong) JCJingCaiBtn *masterWin_normalBtn;

@property (nonatomic,strong) JCJingCaiBtn *equal_normalBtn;

@property (nonatomic,strong) JCJingCaiBtn *customerWin_normalBtn;

@property (nonatomic,strong) UIView *anotherView;

@property (nonatomic,strong) UILabel *anotherInfoLab;

@property (nonatomic,strong) JCJingCaiBtn *masterWin_anotherBtn;

@property (nonatomic,strong) JCJingCaiBtn *equal_anotherBtn;

@property (nonatomic,strong) JCJingCaiBtn *customerWin_anotherBtn;

@property (nonatomic,strong) UIImageView *danImgView;

@property (nonatomic,strong) UIImageView *dan_anotherImgView;

@property (nonatomic,strong) JCJingCaiMatchModel *model;

@property (nonatomic,strong) NSMutableArray *btnArray;

@property (nonatomic,strong) JCJingCaiBtn*currentBtn;

@property (nonatomic,strong) NSArray *dataArray;

@property (nonatomic,assign) NSInteger count;

@property (nonatomic,copy) void(^JCJingcaiBlock)(void);

@property (nonatomic,strong) JCParticipateJingCaiTipView *tipView;

@property (nonatomic,strong) UIView *haveJingCaiView;

@end

NS_ASSUME_NONNULL_END
