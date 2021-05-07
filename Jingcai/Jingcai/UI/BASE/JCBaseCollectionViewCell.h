//
//  JCBaseCollectionViewCell.h
//  Jingcai
//
//  Created by Rain on 2018/10/10.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^JCCollectionViewCellNeedReturnHeightBlock)(CGFloat contentH);

NS_ASSUME_NONNULL_BEGIN
@interface JCBaseCollectionViewCell : UICollectionViewCell
- (void)initViews;
- (void)data;
@property (nonatomic, copy) JCCollectionViewCellNeedReturnHeightBlock needReturnHeightBlock;
@end
NS_ASSUME_NONNULL_END
