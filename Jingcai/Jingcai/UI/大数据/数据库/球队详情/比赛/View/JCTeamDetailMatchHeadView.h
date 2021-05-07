//
//  JCTeamDetailMatchHeadView.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/16.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCTeamDetailMatchHeadView : JCBaseView

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UIImageView *iconImgView;

@property (nonatomic,assign) BOOL showAll;

@property (nonatomic,copy) void(^JCShowMoreMatchBlock)(BOOL showAll);

@end

NS_ASSUME_NONNULL_END
