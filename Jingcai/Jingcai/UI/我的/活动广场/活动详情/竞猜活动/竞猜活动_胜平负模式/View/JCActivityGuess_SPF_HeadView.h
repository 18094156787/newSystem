//
//  JCActivityGuess_SPF_HeadView.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/6/28.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseView.h"
#import "JCActivityDetailModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCActivityGuess_SPF_HeadView : JCBaseView

@property (nonatomic,strong) UIImageView *bgImgView;

@property (nonatomic,strong) KKPaddingLabel *countLab;

@property (nonatomic,copy) void(^JCHeightBlock)(float height);

@property (nonatomic,strong) JCActivityDetailModel *detailModel;

@end

NS_ASSUME_NONNULL_END
