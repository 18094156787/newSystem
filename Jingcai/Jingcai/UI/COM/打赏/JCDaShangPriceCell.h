//
//  JCDaShangPriceCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/5.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseCollectionViewCell_New.h"
#import "JCCaiyunBall.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCDaShangPriceCell : JCBaseCollectionViewCell_New

@property (nonatomic,strong) UILabel *priceLab;

@property (nonatomic,strong) JCCaiyunBall *model;

@end

NS_ASSUME_NONNULL_END
