//
//  JCBasketBallHomeMatchCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/4.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "KKPaddingLabel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCBasketBallHomeMatchCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UILabel *matchNameLab;

@property (nonatomic,strong) UILabel *timeLab;

@property (nonatomic,strong) UILabel *typeLab;

@property (nonatomic,strong) UILabel *weekLab;

@property (nonatomic,strong) UILabel *sectionTimeLab;

@property (nonatomic, strong) KKPaddingLabel *planCountLab;//方案数量

@property (nonatomic, strong) UILabel *homeNameLab;

@property (nonatomic, strong) UILabel *awayNameLab;

@property (nonatomic, strong) UILabel *homeScoreLab;

@property (nonatomic, strong) UILabel *awayScoreLab;

@property (nonatomic, strong) UILabel *homeSectionOneLab;

@property (nonatomic, strong) UILabel *homeSectionTwoLab;

@property (nonatomic, strong) UILabel *homeSectionThreeLab;

@property (nonatomic, strong) UILabel *homeSectionFourLab;

@property (nonatomic, strong) UILabel *homeSectionOTLab;

@property (nonatomic, strong) UILabel *homeSectionTotalLab;

@property (nonatomic, strong) UILabel *awaySectionOneLab;

@property (nonatomic, strong) UILabel *awaySectionTwoLab;

@property (nonatomic, strong) UILabel *awaySectionThreeLab;

@property (nonatomic, strong) UILabel *awaySectionFourLab;

@property (nonatomic, strong) UILabel *awaySectionOTLab;

@property (nonatomic, strong) UILabel *awaySectionTotalLab;

@property (nonatomic, strong) UIButton *collectionBtn;//收藏

@property (nonatomic, strong) UIView *bottomView;

@property (nonatomic, strong) NSMutableArray *homeScoreArray;

@property (nonatomic, strong) NSMutableArray *awayScoreArray;

@property (nonatomic, assign) BOOL showBottom;

@property (nonatomic, copy) void(^JCConcernBlock)(void);

@property (nonatomic, strong) JCBasketBallMatchBall *model;

@property (nonatomic, strong) JCBasketBallMatchBall *concernModel;

@end

NS_ASSUME_NONNULL_END
