//
//  JCHistoryPayDataModelDetailTopView.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/10.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseView.h"
#import "JCHistoryPayDataModelDetailMatchView.h"
#import "JCHistoryPayDataModelColumnarView.h"
#import "JCKellyDataDetailModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCHistoryPayDataModelDetailTopView : JCBaseView

@property (nonatomic,strong) UIImageView *bgView;

@property (nonatomic,strong) JCHistoryPayDataModelDetailMatchView *matchView;

@property (nonatomic,strong) UIView *tpBgView;//同赔

@property (nonatomic,strong) UIView *historyBgView;//历史同赔

@property (nonatomic, strong) UILabel *chuLab;//初指

@property (nonatomic, strong) UILabel *jiLab;//即指

@property (nonatomic, strong) JCHistoryPayDataModelColumnarView *homeWinView;

@property (nonatomic, strong) JCHistoryPayDataModelColumnarView *homeEqualView;

@property (nonatomic, strong) JCHistoryPayDataModelColumnarView *homeLoseView;

@property (nonatomic, strong) JCHistoryPayDataModelColumnarView *awayWinView;

@property (nonatomic, strong) JCHistoryPayDataModelColumnarView *awayEqualView;

@property (nonatomic, strong) JCHistoryPayDataModelColumnarView *awayLoseView;

@property (nonatomic,strong) UIView *bottomView;

@property (nonatomic,strong) UILabel *historyLab;

@property (nonatomic,strong) UILabel *resultLab;

@property (nonatomic,strong) UILabel *tipLab;

@property (nonatomic,strong) UIView *redLineView;

@property (nonatomic,assign) BOOL hidetopMatch;

@property (nonatomic,strong) JCKellyDataDetailModel *model;

@property (nonatomic,strong) NSString *match_id;

@end

NS_ASSUME_NONNULL_END
