//
//  JCYCResultTableViewCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/4/16.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCJingCaiBtn.h"
#import "JCParticipateJingCaiTipView.h"
#import "JCJingCaiResultMatchModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCYCResultTableViewCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UILabel *infoLab;

@property (nonatomic,strong) UIImageView *masterImgView;

@property (nonatomic,strong) UIImageView *customerImgView;

@property (nonatomic,strong) UILabel *masterNameLab;

@property (nonatomic,strong) UILabel *customerNameLab;

@property (nonatomic,strong) UILabel *normalInfoLab;

@property (nonatomic,strong) UIView *masterView;

@property (nonatomic,strong) JCJingCaiBtn *masterWin_normalBtn;

@property (nonatomic,strong) JCJingCaiBtn *equal_normalBtn;

@property (nonatomic,strong) JCJingCaiBtn *customerWin_normalBtn;

@property (nonatomic,strong) UIView *anotherView;

@property (nonatomic,strong) UILabel *anotherInfoLab;

@property (nonatomic,strong) JCJingCaiBtn *masterWin_anotherBtn;

@property (nonatomic,strong) JCJingCaiBtn *equal_anotherBtn;

@property (nonatomic,strong) JCJingCaiBtn *customerWin_anotherBtn;

@property (nonatomic,strong) UIImageView *resultImgView;//命中结果,红或者黑

@property (nonatomic,strong) UIImageView *statusImgView;//比赛状态,已延期或已取消

@property (nonatomic,assign) BOOL is_result;//用来区分每日预测结果的弹窗

@property (nonatomic,strong) JCJingCaiResultMatchModel *model;

@property (nonatomic,strong) JCJingCaiResultMatchModel *tipModel;//弹窗用的



@end

NS_ASSUME_NONNULL_END
