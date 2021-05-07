//
//  JCJingCaiAIHomeHeadView.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/24.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseView.h"
#import "JCJingCaiAIHomeZhiShuTypeView.h"
#import "JCJingCaiAINoticeModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCJingCaiAIHomeHeadView : JCBaseView<SDCycleScrollViewDelegate>

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) JCJingCaiAIHomeZhiShuTypeView *rqView;

@property (nonatomic,strong) JCJingCaiAIHomeZhiShuTypeView *jqsView;

@property (nonatomic,strong) UIView *bgView;

@property (nonatomic,strong) UIView *bottomView;

@property (nonatomic,strong) SDCycleScrollView *noticeCycleScrollView;//中奖轮播

@property (nonatomic,strong) NSArray *titleArray;

@property (nonatomic,strong) NSArray *rqArray;

@property (nonatomic,strong) NSArray *jqsArray;





@end

NS_ASSUME_NONNULL_END
