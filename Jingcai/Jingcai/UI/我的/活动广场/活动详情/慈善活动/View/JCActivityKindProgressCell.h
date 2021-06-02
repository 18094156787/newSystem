//
//  JCActivityKindProgressCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/5/31.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCActivityDetailModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCActivityKindProgressCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UIView *tipBgView;

@property (nonatomic,strong) UIView *progressView;

@property (nonatomic,strong) UILabel *percentLab;

@property (nonatomic,strong) UILabel *countLab;

@property (nonatomic,strong) UIImageView *numImgView;

@property (nonatomic,strong) UIImageView *resultImgView;

@property (nonatomic,strong) UILabel *numLab;

@property (nonatomic,assign) float totalWidth;

@property (nonatomic,strong) JCActivityDetailModel *detailModel;

@end

NS_ASSUME_NONNULL_END
