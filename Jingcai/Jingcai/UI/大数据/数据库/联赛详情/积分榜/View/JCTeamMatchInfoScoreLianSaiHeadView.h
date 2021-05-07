//
//  JCTeamMatchInfoScoreLianSaiHeadView.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/7.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCTeamMatchInfoScoreLianSaiHeadView : JCBaseView

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UILabel *rankLab;

@property (nonatomic,strong) UILabel *teamLab;

@property (nonatomic,strong) UILabel *numberLab;//场次

@property (nonatomic,strong) UILabel *spfLab;//胜/平/负

@property (nonatomic,strong) UILabel *jsLab;//进/失

@property (nonatomic,strong) UILabel *scoreLab;//积分

@property (nonatomic, assign) BOOL showTop;


@end

NS_ASSUME_NONNULL_END
