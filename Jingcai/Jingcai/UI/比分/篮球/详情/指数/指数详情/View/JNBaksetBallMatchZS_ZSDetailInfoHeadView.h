//
//  JNBaksetBallMatchZS_ZSDetailInfoHeadView.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/7.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface JNBaksetBallMatchZS_ZSDetailInfoHeadView : JCBaseView

@property (nonatomic,strong) UILabel *companyLab;

@property (nonatomic,strong) UILabel *windLab;

@property (nonatomic,strong) UILabel *equalLab;

@property (nonatomic,strong) UILabel *loseLab;

@property (nonatomic,strong) UILabel *timeLab;

@property (nonatomic,assign) NSInteger type;//type  1胜负 2让分 3总分

@end

NS_ASSUME_NONNULL_END
