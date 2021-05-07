//
//  JCFootBall_GZH_AuthorErCodeView.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/10/27.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCFootBall_GZH_AuthorErCodeView : JCBaseView

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UIButton *closeBtn;

@property (nonatomic,strong) UIImageView *codeImgView;

@property (nonatomic,strong) UIButton *saveBtn;

@property (nonatomic,strong) UILabel *infoLab;

@property (nonatomic,strong) UIImage *codeImg;

@property (nonatomic,strong) JCWTjInfoBall *infoModel;//专家详情

@property (nonatomic,strong) JCWExpertBall *expertDetailModel;//专家详情


@end

NS_ASSUME_NONNULL_END
