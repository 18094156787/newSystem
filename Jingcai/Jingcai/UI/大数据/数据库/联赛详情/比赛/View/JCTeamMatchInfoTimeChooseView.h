//
//  JCTeamMatchInfoTimeChooseView.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/7.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCTeamMatchInfoTimeChooseView : JCBaseView

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UIView *selView;

@property (nonatomic,strong) UILabel *timeLab;

@property (nonatomic,strong) UIImageView *iconImgView;

@property (nonatomic,strong) UIImageView *upIconImgView;

@property (nonatomic,strong) NSString *title;

@property (nonatomic,assign) BOOL changeSize;//改变宽度

@property (nonatomic,copy) void(^JCChooseBlock)(void);

@end

NS_ASSUME_NONNULL_END
