//
//  JCJingCaiAIHomeZhiShuTypeView.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/24.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseView.h"
#import "JCJingCaiAIHomeZhiShuItemView.h"
#import "JCJingCaiAIYLModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCJingCaiAIHomeZhiShuTypeView : JCBaseView

@property (nonatomic,strong) UIImageView *iconImgView;

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UIView *bgView;

@property (nonatomic,strong) UILabel *weekLab;

@property (nonatomic,strong) UILabel *monthLab;

@property (nonatomic,strong) UILabel *threeMonthLab;

@property (nonatomic,strong) UILabel *historyLab;

@property (nonatomic,strong) NSMutableArray *viewArray;

@property (nonatomic,strong) NSArray *dataArray;


@end

NS_ASSUME_NONNULL_END
