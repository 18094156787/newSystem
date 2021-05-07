//
//  JCAIHomeNoticeCollectionViewCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/25.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseCollectionViewCell_New.h"
#import "JCJingCaiAINoticeModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCAIHomeNoticeCollectionViewCell : JCBaseCollectionViewCell_New

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UILabel *statusLab;

@property (nonatomic,strong) JCJingCaiAINoticeModel *model;

@property (nonatomic,strong) JCJingCaiAINoticeModel *aModel;
@end

NS_ASSUME_NONNULL_END
