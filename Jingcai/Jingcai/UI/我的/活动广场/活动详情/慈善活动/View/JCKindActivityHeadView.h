//
//  JCKindActivityHeadView.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/5/31.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseView.h"
#import "JCActivityDetailModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCKindActivityHeadView : JCBaseView

@property (nonatomic,strong) UIImageView *bgImgView;

@property (nonatomic,copy) void(^JCHeightBlock)(float height);

@property (nonatomic,strong) JCActivityDetailModel *detailModel;

@end

NS_ASSUME_NONNULL_END
