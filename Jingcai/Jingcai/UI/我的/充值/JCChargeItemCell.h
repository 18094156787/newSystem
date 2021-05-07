//
//  JCChargeItemCell.h
//  Jingcai
//
//  Created by Administrator on 2019/1/15.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCBaseCollectionViewCell.h"
#import "JCCaiyunBall.h"

@protocol JCChargeItemCellDelegate <NSObject>
- (void)chargeItemClick:(UICollectionViewCell *)cell;
@end

NS_ASSUME_NONNULL_BEGIN
@interface JCChargeItemCell : JCBaseCollectionViewCell
@property (nonatomic, assign) id<JCChargeItemCellDelegate> delegate;
@property (nonatomic, strong) JCCaiyunBall * caiyunBall;
@end
NS_ASSUME_NONNULL_END
