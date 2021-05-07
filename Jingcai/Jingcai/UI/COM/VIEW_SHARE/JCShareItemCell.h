//
//  JCShareItemCell.h
//  Jingcai
//
//  Created by Administrator on 2019/2/1.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCBaseCollectionViewCell.h"
#import "JCShareTypeEnum.h"

NS_ASSUME_NONNULL_BEGIN
@interface JCShareItemCell : JCBaseCollectionViewCell
@property (nonatomic, assign) JCShareTypeEnum shareType;
@end
NS_ASSUME_NONNULL_END
