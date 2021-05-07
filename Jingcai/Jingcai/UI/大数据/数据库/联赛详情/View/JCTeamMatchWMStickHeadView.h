//
//  JCTeamMatchWMStickHeadView.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/6.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseView.h"
#import "JCDataBaseEventBaseModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCTeamMatchWMStickHeadView : JCBaseView

@property (nonatomic,strong) UIImageView *iconImgView;

@property (nonatomic, assign) BOOL isTeam;//默认是联赛,yes是球队

@property (nonatomic, strong) JCDataBaseEventBaseModel *eventInfoModel;

@end

NS_ASSUME_NONNULL_END
