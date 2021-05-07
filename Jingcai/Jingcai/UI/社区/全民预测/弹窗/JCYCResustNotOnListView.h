//
//  JCYCResustNotOnListView.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/4/17.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseView.h"
#import "JCYuCeWeekResultModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCYCResustNotOnListView : JCBaseView

@property (nonatomic,strong) UIImageView *headImgView;

@property (nonatomic,strong) UIImageView *qyImgView;

@property (nonatomic,strong) UILabel *nameLab;

@property (nonatomic,strong) UILabel *infoLab;

@property (nonatomic,strong) UILabel *label;

@property (nonatomic,copy) void(^JCCloseBlock)(void);

@property (nonatomic,strong) JCYuCeWeekResultModel *weekResultModel;

@end

NS_ASSUME_NONNULL_END
